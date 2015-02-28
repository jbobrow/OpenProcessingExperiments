
//claire gustavson, 2012, hw 10, copywrite

int [] numbers = {
  1, 2, 37, 4, 5, 200, 47, 68, 2, 98
};

int [] numbers2 = {
  56, 5, 37, 4, 5, 67, 47, 68, 2, 12, 34
};

int [] numbers3 = {
  100, 4, 37, 56, 72, 200, 47, 68, 5, 89, 45, 9
};
int average;
 
void setup() {
  size (400, 400);
  fill (0);
  println (numbers);
  text ("array length:"+numbers.length, 10, 20);
  text (numbers2.length, 200, 20);
  text(numbers3.length, 300, 20);
  text ("array sum:" + findSum(numbers), 10, 40);
  text (findSum(numbers2), 200, 40);
    text (findSum(numbers3), 300, 40);
  text ("array average:" + findAverage(numbers), 10, 60);
  text (findAverage(numbers2), 200, 60);
  text(findAverage(numbers3), 300, 60);
text ("array greater:" + findGreater(numbers), 10, 80);
text(findGreater(numbers2), 200, 80);
text(findGreater(numbers3),300, 80);
}
 
int findSum(int[] x) {
  int sum=0;
  for (int i=0; i<x.length; i++) {
    sum=sum+x[i];
  }
  return sum;
}
 
float findAverage(int []x) {
  float average=0;
  for (int i=0; i<x.length; i++) {
    average=average+x[i];
  }
  return average/x.length;
}
 
float findGreater(int []y )
{
  float average = findAverage(y);
 float sum = 0;
  for (int i = 0; i < y.length ; i++ )
  {
    if (y[i] > average)
    {
      sum = y[i] +sum;
    }
  }
return sum;
}


