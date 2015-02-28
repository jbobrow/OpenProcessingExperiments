
int [] numbers = {
  1, 2, 37, 4, 5, 200, 47, 68, 2, 98
};

int average;

void setup() {
  size (400, 400);
  fill (0);
  println (numbers);
  text ("array length:"+numbers.length, 10, 20);
  text ("array sum:" + findSum(), 10, 40);
  text ("array average:" + findAverage(), 10, 60);
text ("array greater:" + findGreater(), 10, 80);
}

int findSum() {
  int sum=0;
  for (int i=0; i<numbers.length; i++) {
    sum=sum+numbers[i];
  }
  return sum;
}

float findAverage() {
  float average=0;
  for (int i=0; i<numbers.length; i++) {
    average=average+numbers[i];
  }
  return average/numbers.length;
}

float findGreater( )
{
  float average = findAverage();
 float sum = 0;
  for (int i = 0; i < numbers.length ; i++ )
  {
    if (numbers[i] > average)
    {
      sum = numbers[i] +sum;
    }
  }
return sum;
}


