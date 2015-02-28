
/*This example demonstrates the use of functions in a very simple manner.
A number is tested to check whether or not it is a multpile of 10.

Developed by Laura Maye, University of Limerick */

/* Q: You should try messing with teh values to see what you get! */
boolean isMultipleOfTen;

void setup()
{
  size(400, 400);
  background(0, 255, 255);
  fill(0);
}

void draw()
{
  isMultipleOfTen = testForMultipleOfTen(20);
  if (!isMultipleOfTen)
  {
    text("The number is NOT a multiple of ten", 10, 10);
  }
  else
  {
    text("The number IS a multiple of ten", 10, 10);
  }
}

boolean testForMultipleOfTen(int n)
{
  int num = n;
  boolean multipleTest;
  if (num % 10 == 0)
  {
    multipleTest = true;
  }
  else
  {
    multipleTest = false;
  }
  return multipleTest;
}
