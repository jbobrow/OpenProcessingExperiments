
//HW 9 - Computing for the Arts with Processing
//Copyright 2012 Tony Zhang

int [] arr = {
  6, 34, 555, 2, 3, 66, 91, 24, 71, 10
};
float sum;
float avg;
float sumavg;

void setup()
{
  size (400, 400);
  textSize(12);
  fill(0);
  background(255);
  text("Length = " + arr.length, 10, 30);

  float sum = getSum();
  text("Sum = " + sum, 10, 70);

  float avg = getAvg();
  text("Average = " + avg, 10, 110);

  float sumavg = getSumavg();
  text("Sum of values greater than the average = " + sumavg, 10, 150);
}

float getSum()
{
  for (int i=0; i < arr.length; i++)
  {
    sum += arr[i];
  }
  return sum;
}

float getAvg()
{
  avg = sum / (arr.length);

  return avg;
}

float getSumavg()
{
  for (int i=0; i < arr.length; i++)
  {
    if (arr[i] > avg)
    {
      sumavg += arr[i];
    }
  }
  return sumavg;
}


