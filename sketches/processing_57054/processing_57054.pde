
//Mitsuko Verdery 
//Hw#10 
//Copyright 2012

int [] array1 = {4, 20, 11, 40, 32, 12, 16, 30, 28, 45};
int [] array2 = {6, 18, 100,  80, 90, 30, 24, 110, 112, 60};
int [] array3 = {6, 15, 105, 200, 135, 60, 68, 75, 42, 3, 10, 15};

void setup ()
{
  size(500, 400);
  smooth();
  textSize(15);
  background(148, 25, 200);
  text("The length of array #1 is:" + array1.length, 20, 50);
  text("The length of array #2 is:" + array2.length, 20, 70);
  text("The length of array #3 is:" + array3.length, 20, 90);
  text("The sum of array#1 is:" + computeSum(array1), 20, 110);
  text("The sum of array#2 is:" + computeSum(array2), 20, 130);
  text("The sum of array#3 is:" + computeSum(array3), 20, 150);
  text("The average of array #1 is:" + average(array1), 20, 170);
  text("The average of array #2 is:" + average(array2), 20, 190);
  text("The average of array #3 is:" + average(array3), 20, 210);
  text("The average sum of array #1 is:" +sumAverage(array1), 20, 230);
  text("The average sum of array #2 is:" +sumAverage(array2), 20, 250);
  text("The average sum of array #3 is:" +sumAverage(array3), 20, 270);
  }

int computeSum(int []array)
{
  int computeSum = 0; 
  for (int i = 0; i <array.length; i ++)
  {
    computeSum+=array[i];
  }
  return computeSum;
}

float average(int [] array)
{
  float computeSum = 0;
  for ( int i = 0; i < array.length; i ++)
  {
    computeSum += array[i];
  }
  return computeSum/array.length;
}

float sumAverage(int[] array) 
{
  float computeSum = 0;
  for (int i=0; i<array.length; i++)
  {
    if (array [i]>sumAverage(array)) {
      computeSum = computeSum + array [i];
    }
  }
  return computeSum;
}
