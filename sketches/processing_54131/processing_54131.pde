
// assignment 10
// Mi Jin Hwang copyright 2012

int [] arrayInt = {89,87,100,97,82,92,96,65,34,55,66,90,0,-12};
int [] arrayIntTwo = {11,33,42,51,66,71,8,14,16,17,35};
int [] arrayIntThree = {2,4,6,8,10,12,14,16,18,20,22};

void setup()
{
  size(450,180);
  background (129, 159, 237);
  textSize (15);

  //2. show length of array
  text("Length of array: " + arrayInt.length+ "," + arrayIntTwo.length +","
+ arrayIntThree.length , 30, 40);
  //3. show sum of array
  text("Sum of array: " + sumArray(arrayInt)+ "," + sumArray(arrayIntTwo)+ "," +
sumArray(arrayIntThree), 30, 70);
  //4. show average of array
  text("Average of array: " + avgArray(arrayInt)+ "," + avgArray(arrayIntTwo)+ "," +
avgArray(arrayIntThree), 30, 100);
  //5. show sum of all values greater than the average.
  text("Sum of values greater than the average: " + sumGreater(arrayInt)+ ","
+sumGreater(arrayIntTwo)+ "," +sumGreater(arrayIntThree), 30, 130);
}

int sumArray(int[] array)
{
  int sum = 0;
  for(int i = 0; i < array.length; i ++)
  {
    sum = sum + array[i];
  }
  return sum;
}

float avgArray(int[] array)
{
  //sum of array is already written as a function above.
  //avg = sum of array divided by the number of arrays.
  float avg = 0;
  avg = float(sumArray(array))/array.length;
  return avg;
}

int sumGreater(int[] array)
{
  int sumGreater = 0;
  for(int i=0; i<array.length; i++)
  {
    if(array[i] > avgArray(array))
    {
      sumGreater = sumGreater + array[i];
    }
    else
    {
      sumGreater = sumGreater;
    }
  }
  return sumGreater;
}



