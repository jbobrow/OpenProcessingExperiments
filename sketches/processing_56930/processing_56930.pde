
//Mitsuko Verdery 
//Hw#9 
//Copyright 2012

int [] numbers = {7, 51, 3, 20, 68, 110, 240, 18, 200, 160};

void setup()
{
  size( 600, 400 ); 
  smooth();
  textSize(20);
  background(0, 181, 200);
  text("The length of this array is: " + numbers.length, 10, 50);
  text("The sum of this array is: " + getSum( ), 10, 30);
  text("The average of this array is: " + average( ), 10, 100); 
  text("The sum of the array greater than the average: " + Sum2(numbers), 10, 150);
}

int getSum ( )
{
  int sum = 0; 
  for (int i= 0; i< numbers.length; i++)
  {
    sum = sum + numbers[i] ; 
  }
  return sum;
}

float average()
{
  float sum = 0;
  for ( int i = 0; i <numbers.length; i++)
  {
    sum += numbers[i];
  }
  return sum/numbers.length;
}

float Sum2(int [] numbers) 
{
  float av = average();
  float Sum2 = 0;
  for(int i = 0; i<numbers.length; i++) 
  { 
    if (numbers[i] > av) {
       Sum2 = Sum2 + numbers[i]; 
    }
  }
 return Sum2;
}
