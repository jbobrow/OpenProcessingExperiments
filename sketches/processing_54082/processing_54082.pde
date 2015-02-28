
int [] arr1 = {85, 21, 84, 56, 26, 68, 75, 33, 2, 48};
int [] arr2 = {39, 46, 16, 44, 91, 88, 49, 3, 90, 32, 78, 93, 12, 41, 6};
int [] arr3 = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181};

void setup()
{
  size (850, 190);
  background (0);
  textAlign(LEFT);
  textSize(24);
  
  text("Length of the array: " + arr1.length + ", " + arr2.length + ", " + arr3.length, 50, 50);
  text("Sum of array values: " + calculateSum(arr1) + ", " + calculateSum(arr2) + ", " + calculateSum(arr3), 50, 80);
  text("Average of array values: " + calculateAvg(arr1) + ", " + calculateAvg(arr2) + ", " + calculateAvg(arr3), 50, 110);
  text("Sum of array values greater than average: " + calculateSumAvg(arr1) + ", "+ calculateSumAvg(arr2) + ", " + calculateSumAvg(arr3), 50, 140);
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

