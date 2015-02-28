
//Homework9
//Vishal Agrawal
//vishala@andrew.cmu.edu
//copyright (C) 2012

float [] x = {1, 2, 3, 4, 5, 6, 7, 8, 9 ,10};

void setup()
{
  background(#990000);
  PFont font;
  float sum = 0;
  size(500, 500);
  
  //load font
  font = loadFont("f1.vlw"); 
  textFont(font, 24); 
  
  //print length of array
  text("length of array - " + x.length, 20, 40);
  
  //print sum of array
  text("sum of array - " + getSum(), 20, 100);
  
  //print average of array
  text("average of array -" + getAvg(), 20, 160);
  
  //print special sum of array
  text("special sum of array - " + getSpecialSum(), 20, 220);
}

float getSum()
{
  float sum = 0;
  for(int i =0 ; i<x.length; i++)
  {
  sum +=x[i];
  }
  return sum; 
}

float getAvg()
{
  float sum = getSum();
  return sum/x.length;
}

float getSpecialSum()
{
  float sum = 0;
  float avg = getAvg();
  for(int i=0; i<x.length; i++)
  {
    if(x[i]>avg)
    {
      sum += x[i];
    }
  }
 return sum; 
}
