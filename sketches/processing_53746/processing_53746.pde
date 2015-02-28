
// 48-257, bumyeolk_HW8
// Bumyeol Kim, Copyright 2012

int [] elements = {2, 3, 5, 8, 12, 17, 25, 65, 85, 94, 125};

void setup()
{
  size(600, 400);
  textAlign(CENTER);
  textSize(20);
  text("The Length of the Array: " + elements.length, 300, 100);
  text("The Sum of the Array: " + doSum(), 300, 150);
  text("The Average of the Array: " + doAverage(), 300, 200);
  text("The Sum of all values above the Average: " + doGreater(), 300, 250);
}

int doSum()
{
  int sum = 0;
  for(int i = 0; i < elements.length; i ++)
  {
    sum += elements[i];
  }
  return sum;
}

float doAverage()
{
  float average = 0;
  for(int i = 0; i < elements.length; i ++)
  {
    average += elements[i];
  }
  return average/elements.length;
}

float doGreater()
{
  float doGreater = 0;
  for(int i = 0; i < elements.length; i ++)
  {
    if(elements[i] > doAverage())
    {
      doGreater += elements[i];
    }
  }
  return doGreater;
}

