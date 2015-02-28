
//Matt Dawson
//madawson@andrew.cmu.edu
//hw9
//Copyright Matt Dawson, Carnegie Mellon University, 10/31/12, All Rights Reserved



int i, sum, avg, aa;
int [ ] numbers = new int [10];

void setup()
{
  size (400, 400);
  background(0);
  smooth();
  textSize(15);
  textAlign (CENTER);
  
  i=0;
  sum=0;
  
  for (int i = 0; i<numbers.length; i++)
  {
    numbers[i] = int(random (0,100));
  }
  
  for (int i = 0; i<numbers.length; i++)
  {
    sum += numbers[i];
  }
  avg=sum/numbers.length;
  for (int i = 0; i<numbers.length; i++)
  {
    if(numbers[i]>avg)
    {
      aa+=numbers[i];
    }
  }
}

void draw()
{
  length();
  sum();
  average();
  aboveaverage();
}

void length()
{
  float a = numbers.length;
  text ("The length of the array is" +  a, width/2, 50);
}

void sum()
{
  text ("The sum of the values in the array is" +  sum, width/2, 150);
}

void average()
{
  text ("The average of the values in the array is" +  avg, width/2, 250);
}

void aboveaverage()
{
  text ("The sum of the values above the average is" +  aa, width/2, 350);
}

