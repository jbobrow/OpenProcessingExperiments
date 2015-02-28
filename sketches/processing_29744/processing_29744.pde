
//Binary clock by Pierre J. Goldstein
Seconds_Ones so;
Seconds_Tens st;
Minutes_Ones mo;
Minutes_Tens mt;
Hours_Ones ho;
Hours_Tens ht;

void setup()
{
  size(300,400);
  so = new Seconds_Ones();
  st = new Seconds_Tens();
  mo = new Minutes_Ones();
  mt = new Minutes_Tens();
  ho = new Hours_Ones();
  ht = new Hours_Tens();
}

void draw()
{
  background(0);
  smooth();
  so.countseconds_ones();
  st.countseconds_tens();
  mo.countminutes_ones();
  mt.countminutes_tens();
  ho.counthours_ones();
  ht.counthours_tens();
}

