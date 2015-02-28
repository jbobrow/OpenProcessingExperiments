
//homework #10 - 48257 S'12
//melissa (macy) goh copyright 2012

int [] array1 = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
int [] array2 = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22};
int [] array3 = {3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36};
 
void setup()
{
  size (400, 400);
  background (16, 144, 160);
  smooth();
  textAlign(LEFT);
  textSize(15);
   
  text("Length of arrays: ", 25, 50);
  text("1st array: " + array1.length, 40, 70);
  text("2nd array: " + array2.length, 40, 90);
  text("3rd array: " + array3.length, 40, 110);
  
  text("Sum of arrays: ", 25, 140);
  text("1st array: " + calculateSum(array1), 40, 160);
  text("2nd array: " + calculateSum(array2), 40, 180);
  text("3rd array: " + calculateSum(array3), 40, 200);
  
  text("Average of arrays: ", 25, 230);
  text("1st array: " + calculateAverage(array1), 40, 250);
  text("2nd array: " + calculateAverage(array2), 40, 270);
  text("3rd array: " + calculateAverage(array3), 40, 290);
  
  text("Sum of numbers greater than the average: ", 25, 320);
  text("1st array: " + calculateBigSum(array1), 40, 340);
  text("2nd array: " + calculateBigSum(array2), 40, 360);
  text("3rd array: " + calculateBigSum(array3), 40, 380);
}
 
 
float calculateSum(int [] arrays)
{
  int sum = 0;
  for (int i = 0; i < arrays.length; i++)
  {
    sum = sum + arrays[i];
  }
  return sum;
}
  
float calculateAverage(int [] arrays)
{
  float average = 0;
  average = calculateSum(arrays)/arrays.length;
  return average;
}
  
float calculateBigSum(int [] arrays)
{
  float bigSum = 0;
  for (int i = 0; i < arrays.length; i++)
  {
    if (arrays[i] > calculateAverage(arrays))
    {
      bigSum = bigSum + arrays[i];
    }
  }
  return bigSum;
}


