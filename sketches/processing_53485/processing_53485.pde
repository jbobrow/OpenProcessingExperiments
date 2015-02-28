
//melanie danver
//copyright 2012 mdanver
int [] bubbles = {
  1, 23, 54, 12, 34, 18, 52, 43, 2, 9
}; 

void setup()
{
  size(400, 400);
  fill(0);
  text("length of array: " + (bubbles.length), 10, 20);
  text("sum of array: " + computeSum(), 10, 40);
  text("average of array: " + computeAverage(), 10, 60);
  text("sum of above average : " + aboveAverageSum(), 10, 80);
}

int computeSum()
{
  int sum = 0;
  for (int i = 0; i<bubbles.length; i++)
  {
    sum = sum + bubbles[i];
  }
  return sum;
}

float computeAverage()
{

  int average = 0;
  for (int i = 0; i< bubbles.length; i++)
  {
    average = average + bubbles[i];
  }
  return average/(bubbles.length);
}

float aboveAverageSum( )
{
  float average = computeAverage();
  
  //println("values greater than the average of " + average + ": " );
 float sum = 0;
  for (int i = 0; i < bubbles.length ; i++ )
  {
    if (bubbles[i] > average)
    { 
      sum = bubbles[i] +sum;
    }
  }
return sum;
}




