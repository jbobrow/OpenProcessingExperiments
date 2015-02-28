
//homework 9
//copyright 2012 kathryn thomas

int [ ] numbers = {1,1,2,3,5,8,13,21,34,55};

void setup() 
{
size(400,400);
fill(0);
println(numbers);
text("Array Length: " + numbers.length,10,20);
text("Sum of Values: " + getSum() , 10,40);
text("Sum of Values Greater than Average: " + sumGreater(),10,60);
text("Average Value: " + getAverage(),10,80);
}

float getAverage()
{
  float sum = 0;
  for (int i = 0; i < numbers.length; i++)
  {
    sum = sum + numbers[i];
  }
  return sum/numbers.length;
}

int getSum()
{
 int sum = 0;
 for (int i = 0; i < numbers.length; i++)
  {
    sum = sum + numbers[i];
  }
  return sum;
}

int sumGreater()
{
  int sumGreater = 0;
  for(int i = 0; i<numbers.length; i++)
  {
    if(numbers[i] > getAverage())
    {
      sumGreater = sumGreater + numbers[i];
    }
    else
    {
      sumGreater = sumGreater;
    }
  }
    return sumGreater;
  
}

