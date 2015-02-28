
//assignment #9
// Mi Jin Hwang copyright 2012 

//1. Declare an array of int values and initialize it with an initializer list.
//-array must be at least 10 elements long.


int [] arrayInt = {89,87,100,97,82,92,96,65,34,55,66,90,0,-12};

void setup()
{
  size(400,180);
  background (234, 114, 206);
  textSize (15);
 
  //2. show length of array
  text("Length of array:" + arrayInt.length , 30, 40);
  //3. show sum of array
  text("Sum of array:" + sumArray(), 30, 70);
  //4. show average of array
  text("Average of array:" + avgArray(), 30, 100);
  //5. show sum of all values greater than the average.
  text("Sum of values greater than the average:" + sumGreater(), 30, 130);
}

int sumArray()
{
  int sum = 0;
  for(int i = 0; i < arrayInt.length; i ++)
  {
    sum = sum + arrayInt[i];
  }
  return sum;
}

float avgArray()
{
  //sum of array is already written as a function above.
  //avg = sum of array divided by the number of arrays.
  float avg = 0;
  avg = float(sumArray())/arrayInt.length;
  return avg;
}

int sumGreater()
{
  int sumGreater = 0;
  for(int i=0; i<arrayInt.length; i++)
  {
    if(arrayInt[i] > avgArray())
    {
      sumGreater = sumGreater + arrayInt[i];
    }
    else
    {
      sumGreater = sumGreater;
    }
  }
  return sumGreater;
}

