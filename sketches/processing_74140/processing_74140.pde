
// Homework 9
// Hyunjook
// Hyunjoo Kim 2012 Copyrights, CMU

int[] numbers = {5, 10, 30, 3, 5, 1, 50, 34, 29, 39, 29, 13};

void setup() {
  size(400,400);
  textSize(14);
  textAlign(CENTER);
  background(255);
  fill(0);
  text ("The length of the array is: " + numbers.length, width/2, 100);
  text ("The sum of the values in the array is:" + Sum(), width/2, 130);
  text ("The average of the values in the array is:" + Average(), width/2, 160);
  text ("The sum of all values greater than the average is:" +SumGreater(), width/2, 190);
}

int Sum()
{
  int sum = 0;
  for (int i = 0; i < numbers.length; i++)
  {
    sum = sum + numbers[i];
  }
  return sum;
}

float Average()
{
  float sum = 0;
  for (int i = 0; i < numbers.length; i++)
  {
    sum = sum + numbers[i];
  }
  return sum/numbers.length;
}
  
int SumGreater()
{
  int sum = 0;
  for (int i = 0; i < numbers.length; i++)
  {
    if (numbers[i] > Average())
    {
      sum = sum + numbers[i];
    }
  }
  return sum;
}
      


