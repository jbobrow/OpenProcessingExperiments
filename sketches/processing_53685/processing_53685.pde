
//computer arts for processing 60-257
//hw #9 array practice 
//copyright kyree 2012

int[] prices = {3, 4, 7, 8, 4, 12, 11, 45, 23, 5, 16, 1};

void setup()
{
  size(400,400);
  background(#DE573B);
  
  println(prices);

  textSize(20);
  text("Kyree's Gas Price Projections ", 20,80);
  
  textSize(16);
  text("Number of Months of Projected Gas Prices: " + prices.length, 20,160);
  text("Total Cost of Gas for 12 Months: " + gasTotal(), 20,190);
  text("Average Cost of Gas per Month: " + gasAverage(), 20,220);   
  text("Sum of All Values Above Average: " + aboveAverageTot(), 20,250);

  textSize(11);
  text("*All values are per one gallon ", 20,360);
  text("**Projections are not based on any actual research ", 20,380);

}

int gasTotal ()
{
  int total = 0;
  for (int i = 0; i < prices.length;i ++)
  {
    total = total + prices[i];
  }
  return total;
}
  
float gasAverage()
{
  float total = 0;
  for (int i = 0; i < prices.length; i++)
  {  
  total = total + prices [i];
  }
  return total/prices.length;
}

float aboveAverageTot()
{
  float total = 0;
  for(int i = 0; i < prices.length; i++)
  {
    if(prices[i] > gasAverage())
    {
    total = total + prices[i];
    }
  }
  return total; 
}
