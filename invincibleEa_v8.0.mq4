//+------------------------------------------------------------------+
//|    1、M5 作为主趋势方向，CLaguerreRsi上穿0.45位up，下穿0.55为down
//     2、M1为入场点确认周期 
//|    3、entry：空单为例
//         A. 趋势刚为down，向前找到所有macd小于0的柱子，统计柱子开始到当前的差值。                                                  
//|        B. 差值大于8左右不适合入场，小于8可考虑进入。                                  
//         C. macd大于macd信号线，禁止入场。
//         D. 第二种入场方式为，macd从大于0转小于0，应看情况加过滤条件或加止损。
//     4、exit
//        趋势转换出场
//
//+------------------------------------------------------------------+
#property copyright "xiaoxin003"
#property link      "yangjx009@139.com"
#property version   "8.0"
#property strict

#include "CStrategy.mqh";
 
extern int       SmOne_MagicNumber  = 20190811;    
extern double    SmOne_Lots         = 0.1;
extern int       SmOne_intTP        = 0;
extern int       SmOne_intSL        = 0;
      

CStrategy* oCStrategy;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
//---
   Print("begin");
   if(oCStrategy == NULL){
      oCStrategy = new CStrategy(SmOne_MagicNumber);
   }
   oCStrategy.Init(SmOne_Lots,SmOne_intTP,SmOne_intSL);
   
//---
   return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   Print("deinit");
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+

void OnTick()
{
   oCStrategy.Tick();
   subPrintDetails();
}


void subPrintDetails()
{
   //
   string sComment   = "";
   string sp         = "----------------------------------------\n";
   string NL         = "\n";

   sComment = sp;
   sComment = sComment + "Trend = " + oCStrategy.getTrend() + NL; 
   sComment = sComment + sp;
   //sComment = sComment + "TotalItemsActive = " + oCOrder.TotalItemsActive() + NL; 
   sComment = sComment + sp;
   //sComment = sComment + "Lots=" + DoubleToStr(Lots,2) + NL;
   Comment(sComment);
}


