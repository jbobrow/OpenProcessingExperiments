
int [] arr = {7, 5, 19, 4, 34, 12, 61, 91, 96, 88};

void setup()
{
  size (700, 190);
  background (0);
  textAlign(LEFT);
  textSize(24);
  
  text("Length of the array: " + arr.length, 50, 50);
  text("Sum of the array values: " + calculateSum(arr), 50, 80);
  text("Average of the array values: " + calculateAvg(arr), 50, 110);
  text("Sum of the array values greater than average: " + calculateSumAvg(arr), 50, 140);
}

float calculateSum(int [] a)
{
  float sum = 0;
  for (int i = 0; i < a.length; i++)
  {
    sum += a[i];
  }
  return sum;
}

float calculateAvg(int [] a)
{
  float avg = 0;
  avg = calculateSum(a)/a.length;
  return avg;
}

float calculateSumAvg(int [] a)
{
  float sum = 0;
  for (int i = 0; i < a.length; i++)
  {
    if (a[i] > calculateAvg(a))
    {
      sum += a[i];
    }
  }
  return sum;
}

