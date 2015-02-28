
//Homework10
//Vishal Agrawal
//vishala@andrew.cmu.edu
//copyright (C) 2012

void setup()
{
  float [] x1 = {1, 2, 3, 4, 5, 6, 7, 8, 9 , 10};
  float [] x2 = {11, 12, 13, 14, 15, 16, 17, 18, 19 , 20};
  float [] x3 = {21, 22, 23, 24, 25, 26, 27, 28, 29 , 30};
  
  PFont font;
  float sum = 0;
  float avg = 0;
  float newSum = 0;
  size(600, 600);
  
  //load font
  font = loadFont("f1.vlw"); 
  textFont(font);
  textSize(20);
 
  //display lengths 
  text("length of array x1 = " + x1.length, 10, 40);
  text("length of array x2 = " + x1.length, 10, 80);
  text("length of array x3 = " + x1.length, 10, 120);
  
  sum = getSum(x1);
  text("sum of array x1 = " + sum, 10, 160);

  sum = getSum(x2);
  text("sum of array x2 = " + sum, 10, 200);
  
  sum = getSum(x3);
  text("sum of array x3 = " + sum, 10, 240);
  
  avg = getAvg(x1);
  text("average of array x1 = " + avg, 10, 280);

  avg = getAvg(x2);
  text("average of array x2 = " + avg, 10, 320);
  
  avg = getAvg(x3);
  text("average of array x2 = " + avg, 10, 360);
  
  newSum = getSumofAvg(x1);
  text("special sum of array x1 = " + newSum, 10, 400);

  newSum = getSumofAvg(x2);
  text("special sum of array x2 = " + newSum, 10, 440);
  
  newSum = getSumofAvg(x3);
  text("special sum of array x2 = " + newSum, 10, 480);
}

float getSum(float x[])
{
  float sum = 0; 
  
  for(int i =0 ; i<x.length; i++)
  {
    sum +=x[i];
  }
  
  return sum;
}

float getAvg(float x[])
{
  float sum = getSum(x);
  return sum/x.length;
}

float getSumofAvg(float x[])
{
  float avg = getAvg(x);
  float sum = 0;
  for(int i=0; i<x.length; i++)
  {
    if(x[i]>avg)
    {
      sum += x[i];
    }
  }
  return sum;
}
