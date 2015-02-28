
//copyright Victoria Adams
//hw10 2.28.2012

int [] numberList1 = {3, 54, 29, 9, 93, 94, 0, 2, 4, 34, 48};
int [] numberList2 = {28, 59, 2, 50, 28, 5, 90, 3, 27, 9};
int [] numberList3 = {38, 30, 8, 3, 20, 89, 23, 2, 58, 4, 9, 5};

void setup ()
{
  size (400, 400);
  textSize (18);
  fill (0);
  smooth ();
}

void draw ()
{
  text ("the length of array 1 is: " + numberList1.length, 20, 40);
  text ("the length of array 2 is: " + numberList2.length, 20, 60);
  text ("the length of array 3 is: " + numberList3.length, 20, 80);
  text ("the sum of array 1 is: " + getSum(numberList1), 20, 100);
  text ("the sum of array 2 is: " + getSum(numberList2), 20, 120);
  text ("the sum of array 3 is: " + getSum(numberList3), 20, 140);
  text ("the average of array 1 is: " + getAverage(numberList1), 20, 160);
  text ("the average of array 2 is: " + getAverage(numberList2), 20, 180);
  text ("the average of array 3 is: " + getAverage(numberList3), 20, 200);
  text ("the sum of the numbers larger", 20, 220);
  text ("than the average of array 1 is: " + getSumLargerThan (numberList1), 20, 240);
  text ("the sum of the numbers larger", 20, 260);
  text ("than the average of array 2 is: " + getSumLargerThan (numberList2), 20, 280);
  text ("the sum of the numbers larger", 20, 300);
  text ("than the average of array 3 is: " + getSumLargerThan (numberList3), 20, 320);
}

float getSumLargerThan (int [ ] x)
{
  float lsum = 0;
  for (int i = 0; i < x.length; i++)
  {
    if (x[i] > getAverage (x) )
    {
      lsum = lsum + x[i];
    }
  }
  return lsum;
}

float getAverage (int [ ] x)
{
  float avg = getSum(x)/(x.length * 1.0);
  return avg;
}

int getSum (int [ ] x)
{
  int sum = 0;
  for (int i = 0; i < x.length; i++)
  {
    sum = sum + x[i];
  }
  return sum;
}

                
                
