
//homework #9 - 48257 S'12
//melissa (macy) goh copyright 2012

int [] arraySet = {32, 28, 89, 23, 24, 47, 5, 3, 16, 11};
 
void setup() 
{
  size(400, 400);
  background(16, 144, 160);
  smooth();
  textSize(20);
  textAlign(CENTER);
}
 
void draw()
{
  text ("The length of the array is: " + arraySet.length, width/2, height*.2);
  text ("Sum of the array: " + calculateSum(), width/2, height*.4);
  text ("Average of the array: " + calculateAverage(), width/2, height*.6);
  text ("Sum of #s greater than the average: "+ calculateBigSum(), width/2, height*.8);
  noLoop ();
}
 
int calculateSum()
{
  int sum = 0;
  for (int i = 0; i < arraySet.length; i++) 
  {
    sum = sum + arraySet [i];
  }
  return sum;
}
 
 
float calculateAverage() 
{
  float average = 0;
  
  for (int i = 0; i < arraySet.length; i++)
  {
    average = average + arraySet[i];
  }
  
  return average / arraySet.length;
}
 
 
int calculateBigSum() 
{
  int bigSum = 0;
  for (int i = 0; i < arraySet.length; i++) 
  {
    if (arraySet[i] > calculateAverage()) 
    {
      bigSum = bigSum + arraySet[i];
    }
  }
  return bigSum;
}


