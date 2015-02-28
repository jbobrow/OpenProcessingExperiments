
// Homework # 9 

int [] numbers = { 2, 4, 6, 8, 10, 12, 14, 16, 18, 20}; 

void setup ()
{
  size (400, 400);
  textSize (14);
  smooth ();
  fill (0);
  background (25, 94, 188);
  
}


void draw ()
{
  noLoop ();
  fill (255);
  text ("> LENGTH OF ARRAY : " + numbers.length, 10, 100);
  text ("> SUM OF ARRAY : " + getSum (), 10, 120); 
  text ("> AVERAGE OF ARRAY : " + getAverage (), 10, 140);
  text ("> SUM OF ALL NUMBERS GREATER \n    THAN THE  AVERAGE OF ARRAY : " + sumGreaterThan (), 10, 160); 
}


int getSum ()
{ 
  int sum = 0;
  for (int i = 0; i < numbers.length; i++)
  {
    sum = sum + numbers [i];
  }
    
   return sum;
    
}


int getAverage () 
{
  return getSum ()/numbers.length;
} 


int sumGreaterThan ()
{
  int sum = 0;
  int average = getAverage();
  for (int i = 0; i < numbers.length; i++)
  {
    if (numbers[i] > average) 
    {
    sum = sum + numbers [i];
    }
  }
  
  return sum;
}

