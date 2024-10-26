//+------------------------------------------------------------------+
//|                                                   temporario.mqh |
//|                                                   Kayro Schembek |
//|                      https://www.mql5.com/pt/users/kayroschembek |
//+------------------------------------------------------------------+
#property copyright "Kayro Schembek"
#property link      "https://www.mql5.com/pt/users/kayroschembek"



#include  ".\Inputs.mqh"



bool Position_CheckPositioned()
{
   for(int i = 0; i < PositionsTotal(); i++)
      if(PositionSelectByTicket(PositionGetTicket(i)))
         if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == MagicNumber)
            return true; 
   return false;
}

double Position_GetVolume()
{
   for(int i = 0; i < PositionsTotal(); i++)
      if(PositionSelectByTicket(PositionGetTicket(i)))
         if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == MagicNumber)
            return PositionGetDouble(POSITION_VOLUME); 
   return -1;
}

ulong Position_GetTicket()
{
   for(int i = 0; i < PositionsTotal(); i++)
      if(PositionSelectByTicket(PositionGetTicket(i)))
         if(PositionGetString(POSITION_SYMBOL) == _Symbol && PositionGetInteger(POSITION_MAGIC) == MagicNumber)
            return PositionGetInteger(POSITION_TICKET);
   return 0;
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool OrderPending_CheckOrder()
{
   for(int i = 0; i < OrdersTotal(); i++)
      if(OrderSelect(OrderGetTicket(i)))
         if(OrderGetString(ORDER_SYMBOL) == _Symbol && OrderGetInteger(ORDER_MAGIC) == MagicNumber)
            return true;
   return false;
}

double OrderPending_GetVolume()
{
   for(int i = 0; i < OrdersTotal(); i++)
      if(OrderSelect(OrderGetTicket(i)))
         if(OrderGetString(ORDER_SYMBOL) == _Symbol && OrderGetInteger(ORDER_MAGIC) == MagicNumber)
            return OrderGetDouble(ORDER_VOLUME_CURRENT);
   return -1;
}

ulong OrderPending_GetTicket()
{
   for(int i = 0; i < OrdersTotal(); i++)
      if(OrderSelect(OrderGetTicket(i)))
         if(OrderGetString(ORDER_SYMBOL) == _Symbol && OrderGetInteger(ORDER_MAGIC) == MagicNumber)
            return OrderGetInteger(ORDER_TICKET);
   return 0;
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
