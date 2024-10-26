//+------------------------------------------------------------------+
//|                                                       Inputs.mqh |
//|                                                   Kayro Schembek |
//|                      https://www.mql5.com/pt/users/kayroschembek |
//+------------------------------------------------------------------+
#property copyright "Kayro Schembek"
#property link      "https://www.mql5.com/pt/users/kayroschembek"




#include  ".\Enumerators.mqh"




input group "-----------EXPERT-------------"

input group "BASIC SETTINGS"
input ulong                MagicNumber                   = 1111;                 // Magic Number
input ENUM_TYPE_ORDER      TypeOrder                     = ORDER_PENDING;        // Type Order
input ENUM_TIMEFRAMES      Timeframe                     = PERIOD_CURRENT;       // Timeframe
input double               Lote                          = 1.0;                  // Lote

input group "HOURS SETTINGS"
input ENUM_TYPE_HOUR       TypeHour                      = HOUR_COMPLETE;        // Type Hour
input ENUM_HOUR_COMPLETE   HourStartComplete             = COMPLETE_TIME_NULL;   // [Hour Complete] Start Time
input ENUM_HOUR_COMPLETE   HourEndComplete               = COMPLETE_TIME_NULL;   // [Hour Complete] End Time
input ENUM_HOUR_COMPLETE   HourCloseComplete             = COMPLETE_TIME_NULL;   // [Hour Complete] Closing Time
input ENUM_HOUR_PARTIAL    HourStartPartial              = PARTIAL_TIME_NULL;    // [Hour Partial] Start Time
input ENUM_HOUR_PARTIAL    HourEndPartial                = PARTIAL_TIME_NULL;    // [Hour Partial] End Time
input ENUM_HOUR_PARTIAL    HourClosePartial              = PARTIAL_TIME_NULL;    // [Hour Partial] Closing Time

input group "STRATEGY SETTINGS"
input int                  Periodo                       = 20;                   // Period
input double               StandardDeviation             = 2.0;                  // Standard Deviation


input group "TAKEPROFIT SETTINGS"
input double               Takeprofit_Points             = 100;                  // [Points] Takeprofit 




input group "STOPLOSS SETTINGS"
input double               Stoploss_Points               = 100;                  // [Points] Stoploss


input group "BREAKEVEN SETTINGS"
input ENUM_TYPE_BREAKEVEN  TypeBreakeven                 = BREAKEVEN_NONE;       // Type Breakeven
input double               Breakeven_Points              = 200;                  // [Points] Breakeven
input double               Breakeven_Percente            = 30;                   // [Percentage] Breakeven

input group "STEPSTOP SETTINGS"
input ENUM_TYPE_STEPSTOP   TypeStepstop                  = STEPSTOP_NONE;        // Type Stepstop
input double               Stepstop_Trigger_Points       = 0;                    // [Points] Trigger Stepstop
input double               Stepstop_Distance_Points      = 0;                    // [Points] Distance Stepstop
input double               Stepstop_Trigger_Percentage   = 0;                    // [Percentage] Trigger Stepstop
input double               Stepstop_Distance_Percentage  = 0;                    // [Percentage] Distance Stepstop

input group "FINANCIAL LIMIT SETTINGS"
input double               LimitGain                     = 0;                    // [Disable = 0] Profit Limits  
input double               LimiteLoss                    = 0;                    // [Disable = 0] Loss Limites

input group "OPERATION LIMIT SETTINGS"
input int                  LimitOperation                = 0;                    // [Disable = 0] Operation Limit
input int                  LimitOperationLoss            = 0;                    // [Disable = 0] Operation Limit Loss