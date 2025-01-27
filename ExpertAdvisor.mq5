//+------------------------------------------------------------------+
//|                                                ExpertAdvisor.mq5 |
//|                                                   Kayro Schembek |
//|                      https://www.mql5.com/pt/users/kayroschembek |
//+------------------------------------------------------------------+
#property copyright "Kayro Schembek"
#property link      "https://www.mql5.com/pt/users/kayroschembek"
#property version   "1.00"



#include  ".\Include\Inputs.mqh"
#include  ".\Include\Enumerators.mqh"

#include  ".\Include\Temporario.mqh"




int handleBollingerBands;
double buffer_up[], buffer_down[], buffer_middle[];

MqlTradeRequest request;
MqlTradeResult result;
MqlTradeCheckResult check_result;



int OnInit()
   {
      if(!SymbolSelect(_Symbol, true))
         {
            Print("Error loading Symbol.");
            ResetLastError();
            return INIT_FAILED;
         }
   
      handleBollingerBands = iBands(_Symbol, Timeframe, Periodo, 0, StandardDeviation, PRICE_CLOSE);
      
      if(handleBollingerBands == INVALID_HANDLE)
         {
            Print("Error loading indicator.");
            ResetLastError();
            return INIT_FAILED;
         }
      ArraySetAsSeries(buffer_up, true);
      ArraySetAsSeries(buffer_down, true);      
      ArraySetAsSeries(buffer_middle, true);
            
      if(!CheckTimeSettings())
         {
            Print("Invalid hours settings.");
            ResetLastError();
            return INIT_FAILED;
         }
      
      
      
      
      if(TypeTakeprofit == TAKEPROFIT_POINTS)
         {
            if(Takeprofit_Points < 0)
               {
                  Print("Invalid takeprofit settings.");
                  return INIT_FAILED;
               }
         }
      if(TypeTakeprofit == TAKEPROFIT_PERCENTAGE)
         {
            Print("Undeveloped configurations");
            return INIT_FAILED;
         }      
         
         
      if(TypeStoploss == STOPLOSS_POINTS)
         {
            if(Stoploss_Points < 0)
               {
                  Print("Invalid stoploss settings.");
                  return INIT_FAILED;
               }
         }         
      if(TypeStoploss == STOPLOSS_PERCENTAGE)
         {
            Print("Undeveloped configurations");
            return INIT_FAILED;
         }          
         
      Print("Expert Advisor loaded successfully"); 
      return(INIT_SUCCEEDED);
   }

void OnDeinit(const int reason)
   {
      
   }

void OnTick()
   {
      if(NewDay())
         ShowHistory(); 
            
      if(Position_CheckPositioned())
         {
            CheckBreakeven();
            CheckStepStop();
         } 
         
            
      if(!NewCandle())
         return;


      if(!CheckFinancialLimit() || CheckOperationLimit())
         return;            
         
      ENUM_SIGNAL signal = Signal();
      CheckNewEntry(signal);   
      CheckHourEndOrdemPending();
      CheckHourClosePosition(); 
   }


bool CheckTimeSettings()
   {
      datetime hour_start = NULL;
      datetime hour_end   = NULL;
      datetime hour_close = NULL;           
      
      if(TypeHour == HOUR_COMPLETE)
         {
            hour_start    = EnumTimeToDateTimeComplete(HourStartComplete);
            hour_end      = EnumTimeToDateTimeComplete(HourEndComplete);
            hour_close    = EnumTimeToDateTimeComplete(HourCloseComplete);
         }   
      if(TypeHour == HOUR_PARTIAL)
         {
            hour_start    = EnumTimeToDateTimePartial(HourStartPartial);
            hour_end      = EnumTimeToDateTimePartial(HourEndPartial);
            hour_close    = EnumTimeToDateTimePartial(HourClosePartial);         
         }   
         
      if(TypeHour == HOUR_COMPLETE)
         if(hour_start == COMPLETE_TIME_NULL || hour_end == COMPLETE_TIME_NULL || hour_close == COMPLETE_TIME_NULL)
            return false;
      if(TypeHour == HOUR_PARTIAL)
         if(hour_start == PARTIAL_TIME_NULL || hour_end == PARTIAL_TIME_NULL || hour_close == PARTIAL_TIME_NULL)
            return false;           
        
      if(hour_start == NULL || hour_end == NULL || hour_close == NULL)
         return false;
           
      if(hour_start > hour_end || hour_start > hour_close)
         return false;   
         
      return true;   
   }
   
bool NewCandle()
   {
      static int index = 0;
      int new_index = Bars(_Symbol, Timeframe); 
      if(index != new_index)  
         {  
            index = new_index;   
            return true;  
         } 
      return false;   
   }  
   
bool NewDay()
   {
      static int day = 0;    
      datetime now = TimeCurrent();
      MqlDateTime nowStruct;
      TimeToStruct(now, nowStruct);
      int newDay = nowStruct.day_of_year;
      if(newDay != day)
         {
            day = newDay;
            return true;
         }
         
      return false;
   } 

ENUM_SIGNAL Signal()
   {
      MqlRates candles[];
      ArraySetAsSeries(candles, true);
      CopyRates(_Symbol, Timeframe, 0, 3, candles);
      
      CopyBuffer(handleBollingerBands, 0, 0, 3, buffer_middle);
      CopyBuffer(handleBollingerBands, 1, 0, 3, buffer_up);
      CopyBuffer(handleBollingerBands, 2, 0, 3, buffer_down);
      
      if(candles[2].close < buffer_down[2] && candles[1].close > buffer_down[1])
         return SIGNAL_BUY;
      if(candles[2].close > buffer_up[2] && candles[1].close < buffer_up[1])
         return SIGNAL_SELL;         
      
      return SIGNAL_NONE;
   } 
   
void CheckNewEntry(ENUM_SIGNAL signal)
   {
      if(signal == SIGNAL_NONE || !CheckTimeExpertAdvisor() || Position_CheckPositioned())
         return;
      if(signal == SIGNAL_BUY)
         Buy();
      else
         Sell();   
   }   

bool Buy()
   {
      if(TypeOrder == ORDER_PENDING)
         {
            if(OrderPending_CheckOrder())
               return ModifyOrderPending(SIGNAL_BUY);
            return BuyPending();
         }   
      return BuyMarket();
   }
   
bool Sell()
   {
      if(TypeOrder == ORDER_PENDING)
         {
            if(OrderPending_CheckOrder())
               return ModifyOrderPending(SIGNAL_SELL);
            return SellPending();
         }   
      return SellMarket();
   }      
   
bool CheckTimeExpertAdvisor()
   {
      datetime hour_now       = NULL;
      datetime hour_start     = NULL;
      datetime hour_end       = NULL;
      
      if(TypeHour == HOUR_COMPLETE)
         {
            hour_now       = TimeCurrent();
            hour_start     = EnumTimeToDateTimeComplete(HourStartComplete);
            hour_end       = EnumTimeToDateTimeComplete(HourEndComplete);         
         }
      if(TypeHour == HOUR_PARTIAL)
         {
            hour_now       = TimeCurrent();
            hour_start     = EnumTimeToDateTimePartial(HourStartPartial);
            hour_end       = EnumTimeToDateTimePartial(HourEndPartial);         
         }            

      if(hour_now == NULL || hour_start == NULL || hour_end == NULL)
         return false;

      if(hour_now < hour_start || hour_now >= hour_end)
         return false;
      
      return true;
   }   

bool CheckHourEndOrdemPending()
   {
      datetime hour_now    = NULL;
      datetime hour_end    = NULL;
   
      if(TypeHour == HOUR_COMPLETE)
         {
            hour_now    = TimeCurrent();
            hour_end    = EnumTimeToDateTimeComplete(HourEndComplete);
         }   

      if(TypeHour == HOUR_PARTIAL)
         {
            hour_now    = TimeCurrent();
            hour_end    = EnumTimeToDateTimePartial(HourEndPartial);
         } 

      if(hour_now == NULL || hour_end == NULL)
         return false;
               
      if(hour_now >= hour_end)
         RemoveOrderPending();  
      
      return true;
   }

bool CheckHourClosePosition()
   {
      datetime hour_now    = NULL;
      datetime hour_close  = NULL;
   
      if(TypeHour == HOUR_COMPLETE)
         {
            hour_now    = TimeCurrent();
            hour_close  = EnumTimeToDateTimeComplete(HourCloseComplete);
         }
      if(TypeHour == HOUR_PARTIAL)
         {
            hour_now    = TimeCurrent();
            hour_close  = EnumTimeToDateTimePartial(HourClosePartial);
         }         
         
      if(hour_now == NULL || hour_close == NULL)
         return false;
                  
      if(hour_now >= hour_close)
         RemovePosition();  
      
      return true;
   }
   
void ResetRequest()
   {
      ZeroMemory(request);
      ZeroMemory(result);
      ZeroMemory(check_result);
   }   
   
int GetFillingType()
{
   int symbol_filling = FillingCheck(_Symbol, TRADE_ACTION_DEAL);
   
   if(symbol_filling != -1)
      return symbol_filling;
      
   uint filling = (uint) SymbolInfoInteger(_Symbol, SYMBOL_FILLING_MODE);
   
   if(filling == SYMBOL_FILLING_FOK)      { return ORDER_FILLING_FOK; }
   else if(filling == SYMBOL_FILLING_IOC) { return ORDER_FILLING_IOC; }
   return ORDER_FILLING_RETURN;
}

int FillingCheck(const string symbol, ENUM_TRADE_REQUEST_ACTIONS action)
{
   ENUM_SYMBOL_TRADE_EXECUTION exec = (ENUM_SYMBOL_TRADE_EXECUTION) SymbolInfoInteger(symbol, SYMBOL_TRADE_EXEMODE);
   if(exec == SYMBOL_TRADE_EXECUTION_REQUEST || exec == SYMBOL_TRADE_EXECUTION_INSTANT)
      return -1;
   uint filling = (uint) SymbolInfoInteger(symbol, SYMBOL_FILLING_MODE);
   if(exec == SYMBOL_TRADE_EXECUTION_MARKET)
   {
      if(action != TRADE_ACTION_PENDING)
      {
         if((filling&SYMBOL_FILLING_FOK) == SYMBOL_FILLING_FOK)   {  return ORDER_FILLING_FOK;  }
         if((filling&SYMBOL_FILLING_IOC) == SYMBOL_FILLING_IOC)   {  return ORDER_FILLING_IOC;  }
         return -1;   
      }
      return -1;
   }
   return ORDER_FILLING_RETURN;
}   

bool SendRequest()
{
   ResetLastError();
   PrintFormat("Request: %s, Lote: %.2f, Price: %.2f, StopLoss: %.2f, TakeProfit: %.2f.", request.comment, request.volume, request.price, request.sl, request.tp);
   if(!OrderCheck(request, check_result))
   {
      PrintFormat("Error OrderCheck: %d, Code: %d.", GetLastError(), check_result.retcode);
      ResetLastError();
      return false;
   }
   if(!OrderSend(request, result))
   {
      PrintFormat("Error OrderSend: %d, Code: %d.", GetLastError(), result.retcode);
      ResetLastError();  
      return false;
   }
   return true;
}

bool BuyMarket()
   {
      double priceEntry       = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      double priceStoploss    = NormalizeDouble(priceEntry - Stoploss_Points*_Point, _Digits);
      double priceTakeprofit  = NormalizeDouble(priceEntry + Takeprofit_Points*_Point, _Digits);
      double lote             = NormalizeDouble(Lote, 2);
      
      ResetRequest();
      request.action          = TRADE_ACTION_DEAL; 
      request.magic           = MagicNumber;
      request.symbol          = _Symbol;
      request.volume          = lote;
      request.price           = priceEntry;
      request.sl              = priceStoploss;
      request.tp              = priceTakeprofit;
      request.type            = ORDER_TYPE_BUY;
      request.type_filling    = GetFillingType();
      request.type_time       = ORDER_TIME_DAY;
      request.comment         = "Market Buy";
      
      return SendRequest();      
   } 
   
bool SellMarket()
   {
      double priceEntry       = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      double priceStoploss    = NormalizeDouble(priceEntry + Stoploss_Points*_Point, _Digits);
      double priceTakeprofit  = NormalizeDouble(priceEntry - Takeprofit_Points*_Point, _Digits);
      double lote             = NormalizeDouble(Lote, 2);
      
      ResetRequest();
      request.action          = TRADE_ACTION_DEAL; 
      request.magic           = MagicNumber;
      request.symbol          = _Symbol;
      request.volume          = lote;
      request.price           = priceEntry;
      request.sl              = priceStoploss;
      request.tp              = priceTakeprofit;
      request.type            = ORDER_TYPE_SELL;
      request.type_filling    = GetFillingType();
      request.type_time       = ORDER_TIME_DAY;
      request.comment         = "Market Sell";
      
      return SendRequest();      
   }  
   
bool BuyPending()
   {
      double priceEntry       = GetPriceEntry(SIGNAL_BUY);
      double priceStoploss    = NormalizeDouble(priceEntry - Stoploss_Points*_Point, _Digits);
      double priceTakeprofit  = NormalizeDouble(priceEntry + Takeprofit_Points*_Point, _Digits);
      double lote             = NormalizeDouble(Lote, 2);
      
      ResetRequest();
      request.action          = TRADE_ACTION_PENDING; 
      request.magic           = MagicNumber;
      request.symbol          = _Symbol;
      request.volume          = lote;
      request.price           = priceEntry;
      request.sl              = priceStoploss;
      request.tp              = priceTakeprofit;
      request.type            = ORDER_TYPE_BUY_STOP;
      request.type_filling    = GetFillingType();
      request.type_time       = ORDER_TIME_DAY;
      request.comment         = "Order Pending Buy";
      
      return SendRequest();      
   }         

bool SellPending()
   {
      double priceEntry       = GetPriceEntry(SIGNAL_SELL);
      double priceStoploss    = NormalizeDouble(priceEntry + Stoploss_Points*_Point, _Digits);
      double priceTakeprofit  = NormalizeDouble(priceEntry - Takeprofit_Points*_Point, _Digits);
      double lote             = NormalizeDouble(Lote, 2);
      
      ResetRequest();
      request.action          = TRADE_ACTION_PENDING; 
      request.magic           = MagicNumber;
      request.symbol          = _Symbol;
      request.volume          = lote;
      request.price           = priceEntry;
      request.sl              = priceStoploss;
      request.tp              = priceTakeprofit;
      request.type            = ORDER_TYPE_SELL_STOP;
      request.type_filling    = GetFillingType();
      request.type_time       = ORDER_TIME_DAY;
      request.comment         = "Order Pending Sell";
      
      return SendRequest();      
   } 

bool ModifyOrderPending(ENUM_SIGNAL signal)
   {
      double priceEntry       = GetPriceEntry(SIGNAL_BUY);
      double priceStoploss    = NormalizeDouble(priceEntry - Stoploss_Points*_Point, _Digits);
      double priceTakeprofit  = NormalizeDouble(priceEntry + Takeprofit_Points*_Point, _Digits);
      double lote             = OrderPending_GetVolume();
      
      if(signal == SIGNAL_SELL)
         {
            priceEntry       = GetPriceEntry(SIGNAL_SELL);
            priceStoploss    = NormalizeDouble(priceEntry + Stoploss_Points*_Point, _Digits);
            priceTakeprofit  = NormalizeDouble(priceEntry - Takeprofit_Points*_Point, _Digits);         
         }
      
      ResetRequest();
      request.action          = TRADE_ACTION_MODIFY; 
      request.magic           = MagicNumber;
      request.symbol          = _Symbol;
      request.volume          = lote;
      request.order           = OrderPending_GetTicket();
      request.price           = priceEntry;
      request.sl              = priceStoploss;
      request.tp              = priceTakeprofit;
      request.type            = ORDER_TYPE_SELL_STOP;
      request.type_filling    = GetFillingType();
      request.type_time       = ORDER_TIME_DAY;
      request.comment         = "Modifying entry price";
      
      return SendRequest();    
   }
   
bool ModifyPosition(double sl, double tp, string comentario, ulong ticket)
{
   if(ticket == -1 || ticket == NULL)
      return false;
      
   ResetRequest();
   request.action    = TRADE_ACTION_SLTP;
   request.magic     = MagicNumber;
   request.symbol    = _Symbol;
   request.sl        = NormalizeDouble(sl, _Digits);
   request.tp        = NormalizeDouble(tp, _Digits);
   request.position  = ticket;
   request.comment   = comentario;
   request.type_time = ORDER_TIME_DAY;


   Print("Request: Modify: SL: ",request.sl," TP: ",request.tp," PRICE CURRENT: ", PositionGetDouble(POSITION_PRICE_CURRENT)," TICKET: ", ticket);
   
   return SendRequest();
}   
   
bool RemoveOrderPending()
   {
      if(!OrderPending_CheckOrder())
         return false;
         
      for(int i = 0; i < OrdersTotal(); i++)
         {
            ulong ticket   = OrderGetTicket(i);
            
            if(!OrderSelect(ticket))
               return false;
            
            if(OrderGetString(ORDER_SYMBOL) == _Symbol && OrderGetInteger(ORDER_MAGIC) == MagicNumber)
               {
                  ResetRequest();
                  request.action    = TRADE_ACTION_REMOVE;
                  request.order     = ticket;
                  request.comment   = "Removing order pending";
                  
                  return SendRequest();
               }
         }
      
      return true;
   }

bool RemovePosition()
   {
      if(!Position_CheckPositioned())
         return false;
      
      for(int i = 0; i < PositionsTotal(); i++)
         {
            PositionSelectByTicket(PositionGetTicket(i));
            
            if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == MagicNumber)
               {
                  ResetRequest();
                  
                  double   volume   = PositionGetDouble(POSITION_VOLUME);
                  long     type     = PositionGetInteger(POSITION_TYPE);
                  
                  if(type == POSITION_TYPE_BUY)
                     {
                        request.price  = SymbolInfoDouble(_Symbol, SYMBOL_BID);
                        request.type   = ORDER_TYPE_SELL;
                     }
                  else
                     {
                        request.price  = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
                        request.type   = ORDER_TYPE_BUY;
                     }
                  
                  request.action          = TRADE_ACTION_DEAL;
                  request.position        = PositionGetTicket(i);
                  request.magic           = MagicNumber;
                  request.symbol          = _Symbol;
                  request.volume          = volume;
                  request.type_filling    = GetFillingType();
                  request.comment         = "Closing position";
                  
                  return SendRequest();
               }
         }
      return false;   
   }

void ShowHistory()
   {
      int totalTrades   = 0;
      double balance    = AccountInfoDouble(ACCOUNT_BALANCE);
      
      HistorySelect(0, TimeCurrent());
      
      for(int dealID = 0; dealID < HistoryDealsTotal(); dealID++)
         {
            ulong dealTicket = HistoryDealGetTicket(dealID);
            
            if(HistoryDealGetInteger(dealTicket, DEAL_ENTRY) == DEAL_ENTRY_OUT && HistoryDealGetInteger(dealTicket, DEAL_MAGIC) == MagicNumber)
               {
                  totalTrades++;
                  balance += HistoryDealGetDouble(dealTicket, DEAL_PROFIT);
               }   
         }
      Print("=================");
      Print("Operations Report");   
      Print("=================");
      
      Print("Total Operating: ", totalTrades);
      Print("Balance: ", balance); 
      Print("=================");      
   }


double GetPriceEntry(ENUM_SIGNAL signal)
   {
      MqlRates candles[];
      ArraySetAsSeries(candles, true);
      CopyRates(_Symbol, Timeframe, 0, 2, candles);   
         
      if(signal == SIGNAL_BUY)
         return candles[1].high;
         
      if(signal == SIGNAL_SELL)
         return candles[1].low;   
      
      return 0.0;   
   }   
   
bool CheckBreakeven()
{
   if(TypeBreakeven == BREAKEVEN_NONE)
      return false;
      
   for(int i = 0; i < PositionsTotal(); i++)
      {
         if(PositionSelectByTicket(PositionGetTicket(i)))
            {
               if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == MagicNumber)
                  {
                     double priceCurrent     = NormalizeDouble(PositionGetDouble(POSITION_PRICE_CURRENT), _Digits);
                     double priceOpen        = NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN), _Digits);
                     double priceStoploss    = NormalizeDouble(PositionGetDouble(POSITION_SL), _Digits);
                     double priceTakeprofit  = NormalizeDouble(PositionGetDouble(POSITION_TP), _Digits);
                     long typePosition       = PositionGetInteger(POSITION_TYPE);
                     
                     /*
                              check if breakeven  has benn activated
                     */   
                     if(typePosition == POSITION_TYPE_BUY && priceStoploss >= priceOpen) 
                        return false;
                     if(typePosition == POSITION_TYPE_SELL && priceStoploss <= priceOpen)
                        return false; 
                     /*
                              check if the current price is in the stoploss zone 
                     */
                     if(typePosition == POSITION_TYPE_BUY && priceCurrent < priceOpen) 
                        return false;
                     if(typePosition == POSITION_TYPE_SELL && priceCurrent > priceOpen)
                        return false;  
                                             
                     /*
                              does not allow stoploss to retrace
                     */
                     if((typePosition == POSITION_TYPE_BUY && priceStoploss >= priceOpen) || (typePosition == POSITION_TYPE_SELL && priceStoploss <= priceOpen))
                        return false;      
                     
                     double stop = 0;            
         
                     if(TypeBreakeven == BREAKEVEN_PERCENTAGE)
                        {
                           double distance_tp = MathAbs((priceTakeprofit - priceOpen)*MathPow(10,_Digits));
                           
                           //ponto de ativaçao do breaveven
                           double breakeven = distance_tp*Breakeven_Percente/100;
                           double distance = 0;
                           stop = NormalizeDouble(priceOpen, _Digits);
                           
                           if(typePosition == POSITION_TYPE_BUY)        { distance = (priceCurrent - priceOpen)*MathPow(10,_Digits); }
                           else if(typePosition == POSITION_TYPE_SELL)  { distance = (priceOpen - priceCurrent)*MathPow(10,_Digits); }  
                           
                           //checa a condição
                           if(distance < breakeven)
                              return false;
                        }      
                     if(TypeBreakeven == BREAKEVEN_POINTS)
                        {
                           double distance = CalculateDistancePoints(priceCurrent, priceOpen);
                           distance = NormalizeDouble(distance, 0);
                           stop = NormalizeDouble(priceOpen, _Digits); 
                           if(distance < Breakeven_Points)
                              return false;  
                        }
         
                     Print("Activating breakeven. Ticket: ", PositionGetTicket(i));                        
                     return ModifyPosition(stop, priceTakeprofit, "Breakeven", PositionGetTicket(i));
                  }
            }
      }
   
   return false;
}   

bool CheckStepStop()
{
   if(TypeStepstop == STEPSTOP_NONE)
      return false;
      
   for(int i = 0; i < PositionsTotal(); i++)
      {
         ulong ticket_posicao = PositionGetTicket(i);
         if(PositionSelectByTicket(PositionGetTicket(i)))
            {
               if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == MagicNumber)
                  {
                     double priceCurrent     = NormalizeDouble(PositionGetDouble(POSITION_PRICE_CURRENT), _Digits);
                     double priceOpen        = NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN), _Digits);
                     double priceStoploss    = NormalizeDouble(PositionGetDouble(POSITION_SL), _Digits);
                     double priceTakeprofit  = NormalizeDouble(PositionGetDouble(POSITION_TP), _Digits);
                     long typePosition       = PositionGetInteger(POSITION_TYPE);
                     
                     /*
                              check if breakeven  has benn activated
                     */   
                     if(typePosition == POSITION_TYPE_BUY && priceStoploss >= priceOpen) 
                        return false;
                     if(typePosition == POSITION_TYPE_SELL && priceStoploss <= priceOpen)
                        return false; 
                     
                     /*
                              check if the current price is in the stoploss zone 
                     */
                     if(typePosition == POSITION_TYPE_BUY && priceCurrent < priceOpen) 
                        return false;
                     if(typePosition == POSITION_TYPE_SELL && priceCurrent > priceOpen)
                        return false;   
                     
                     double priceNewStoploss = 0;
                     
                     if(TypeStepstop == STEPSTOP_PERCENTAGE)
                        {
                           double distance_points = 0;
                           
                           if(typePosition == POSITION_TYPE_BUY)         
                              distance_points = (priceCurrent - priceOpen)*MathPow(10,_Digits);
                           else if(typePosition == POSITION_TYPE_SELL)  
                              distance_points = (priceOpen - priceCurrent)*MathPow(10,_Digits); 
                           
                           double distance_tp_points = MathAbs(priceTakeprofit - priceOpen)*MathPow(10,_Digits);
                           
                           double trigger_points = distance_tp_points*Stepstop_Trigger_Percentage/100;
                           
                           if(distance_points < trigger_points)
                              return false;
                              
                           double stopMobile = distance_tp_points*Stepstop_Distance_Percentage/100;
                           
                           if(stopMobile >= trigger_points)
                              return false;
                           
                           priceNewStoploss = NormalizeDouble(priceOpen, _Digits);
                        
                           if(typePosition == POSITION_TYPE_BUY)
                              priceNewStoploss = NormalizeDouble(priceOpen + stopMobile*_Point, _Digits);
                           else if(typePosition == POSITION_TYPE_SELL)
                              priceNewStoploss = NormalizeDouble(priceOpen - stopMobile*_Point, _Digits);
                        }
                     
                     if(TypeStepstop == STEPSTOP_POINTS)
                        {
                           double distance = CalculateDistancePoints(priceOpen, priceCurrent);
                           distance = NormalizeDouble(distance, 0);
                           
                           if(distance < Stepstop_Trigger_Points)
                              return false;
                           
                           if(typePosition == POSITION_TYPE_BUY)
                              priceNewStoploss = NormalizeDouble(priceOpen + Stepstop_Distance_Points*_Point, _Digits);
                           else if(typePosition == POSITION_TYPE_SELL)
                              priceNewStoploss = NormalizeDouble(priceOpen - Stepstop_Distance_Points*_Point, _Digits);
                        }
                     
                     Print("Activating Stepstop. Ticket: ", PositionGetTicket(i));
                     return ModifyPosition(priceNewStoploss, priceTakeprofit, "Stop Movel", PositionGetTicket(i));
                  }
            }
      }
   return false;         
}


double CalculateDistancePoints(double price_1, double price_2)
   {
      double reslt = MathAbs((price_1 - price_2)*MathPow(10,_Digits));
      return reslt;
   }
   
bool CheckFinancialLimit()
   {
      double resultDay  = GetResultDay();
      
      if(LimitGain != 0 && resultDay >= LimitGain)
         return false;
      if(LimiteLoss != 0 && resultDay <= -LimiteLoss)
         return false;
      
      return true;      
   }  

double GetResultDay()
   {
      MqlDateTime today;
      TimeCurrent(today);
      
      today.hour  = 0;
      today.min   = 0;
      today.sec   = 0;
      
      HistorySelect(StructToTime(today), TimeCurrent());
      
      uint     total          = HistoryDealsTotal();
      ulong    ticket         = 0;
      double   profitTotal    = 0;
      double   profit         = 0;
      string   symbol;
      long     type;
      ulong    magic;
      
      for(uint i = 0; i < total; i++)
         {
            ticket = HistoryDealGetTicket(i);
            if(ticket > 0)
               {
                  profit   = HistoryDealGetDouble(ticket, DEAL_PROFIT);
                  symbol   = HistoryDealGetString(ticket, DEAL_SYMBOL);
                  type     = HistoryDealGetInteger(ticket, DEAL_TYPE);
                  magic    = HistoryDealGetInteger(ticket, DEAL_MAGIC);
                  
                  if((symbol == _Symbol) && (magic == MagicNumber) && (type == DEAL_TYPE_BUY || type == DEAL_TYPE_SELL))
                     profitTotal += profit;
               }
         }
      return profitTotal;
   }   
   
bool CheckOperationLimit()
   {
      if(LimitOperation == 0 && LimitOperationLoss == 0)
         return false;
      
      datetime now   = TimeCurrent();
      datetime start = now - (now % 86400);
      HistorySelect(start, now);
      
      int deals = HistoryDealsTotal();
      
      int total_operation  = 0;
      int losses           = 0;   
   
      for(int i = 0; i < deals; i++)
         {
            ulong deal_ticket = HistoryDealGetTicket(i);
            
            if(deal_ticket > 0)
               {
                  long magic = HistoryDealGetInteger(deal_ticket, DEAL_MAGIC);
                  if(magic != MagicNumber)
                     continue;
                     
                  long entry = HistoryDealGetInteger(deal_ticket, DEAL_ENTRY);
                  if(entry == 0)
                     continue;
                  
                  long reason = HistoryDealGetInteger(deal_ticket, DEAL_REASON);
                  
                  if(entry == 1 || (ENUM_DEAL_REASON) reason == DEAL_REASON_SL || (ENUM_DEAL_REASON) reason == DEAL_REASON_TP)
                     {
                        total_operation++;
                        
                        if(LimitOperation > 0 && total_operation >= LimitOperation)
                           return true;
                        
                        double balance_operation = HistoryDealGetDouble(deal_ticket, DEAL_PROFIT);
                        
                        if(balance_operation < 0)
                           losses++;
                        
                        if(LimitOperationLoss > 0 && losses >= LimitOperationLoss)
                           return true;
                     }      
               }
         }
      return false;
   }   