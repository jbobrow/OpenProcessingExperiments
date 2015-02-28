
//copyright Victoria Adams
//hw9 2.28.2012


int [] numbers = {6, 23, 13, 5, 9, 34, 7, 62, 54, 1};
  
void setup ()
{
 size (400, 400);
 fill (0);
 println (numbers);
 text ("array length: " + numbers.length, 10, 20);
 text ("the sum of the array is: " + getSum(), 10, 40);
 text ("the average of the array is: " + getAverage(), 10, 60);
 text ("the sum of the values in the array", 10, 80); 
 text ("that are greater than the average is:" + getSumAverage(), 10, 100);
}
  
float getSumAverage ()
{
  float sum = 0;
  for (int i = 0; i < numbers.length; i++)
  {
    if (numbers[i] > getAverage() )
    {
       sum = sum + numbers[i];
    }
  }
  return sum;
}
  
float getAverage ()
{
  float sum = 0;
  for (int i = 0; i < numbers.length; i++)
  {
    sum = sum + numbers[i];
  }
  return sum/numbers.length;
}
  
int getSum()
{
  int sum = 0;
  for (int i = 0; i < numbers.length; i++)
  {
    sum = sum + numbers[i];
  }
    
  return sum;
}

