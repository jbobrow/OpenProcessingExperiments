
// Homework #9, 48-757, 11:30AM
// Copyright M. Yvonne Hidle
// yvonnehidle@gmail.com

/* 
Declare an array of int values and initialize it with an 
initializer list. The array must be at least 10 elements long.

I made them all generate at random, for fun.
*/
int[]numbers = {
int(random(0,99)),
int(random(0,99)),
int(random(0,99)),
int(random(0,99)),
int(random(0,99)),
int(random(0,99)),
int(random(0,99)),
int(random(0,99)),
int(random(0,99)),
int(random(0,99))
};

// intialize global variables
int sum;
int sum2;


//========================================//
void setup()
{
  size(600,200);
  smooth();
  
// Test the numbers, make sure they work
// println(numbers[8]);
// println(numbers.length);
}
//========================================//


//========================================//
void draw()
{
  background(255);
  textSize(15);
  noStroke();
  fill(0);

/*
Using the text( ), function, print the length of the array 
(this must be a value returned by a function and not a magic 
number or variable).
*/
showLength();


/*
THIS IS EXTRA, BUT USEFUL.
Show all numbers in the array using the text( ) fucntion.
*/
showNumbers();

/*
Define a function that computes and returns the sum of the 
values in the array. Using the text( ), function, print the sum.
*/
computeSum();

/*
Define a function that computes and returns the average of the 
values in the array. Using the text( ), function, print the average.
*/
computeAverage();


/*
Define a function compute and return the sum of all values in the array 
that are greater than the average of all values in the array. Display 
this sum with the text( ) function.
*/
computeAverage2();

}
//========================================//


//========================================//
void showLength()
{
  
text("Length of the array: "+numbers.length, 10, 20);
  
}
//========================================//


//========================================//
void showNumbers()
{
  
  text("Values in the array: ",10,50);
int textX=155;

for(int i=0; i<numbers.length; i++)
{
  text(numbers[i],textX,50);
  textX=textX+30;
}

}
//========================================//


//========================================//
void computeSum()
{

sum=0;
  
  for(int i=0; i<numbers.length; i++)
{
  sum=sum+numbers[i];
}
text("Sum of the values in the array: "+sum,10,80);

}
//========================================//


//========================================//
void computeAverage()
{
text("Average value in the array: "+sum/numbers.length,10,110);
}
//========================================//


//========================================//
void computeAverage2()
{
  
sum2=0;
  
for(int i=0; i<numbers.length; i++)
{
  if(numbers[i] > sum/numbers.length)
  {
    
// println("Greater than average: "+numbers[i]);
sum2=sum2+numbers[i];

  }
}

text("Sum of all values in the array that are greater than the average: "+sum2,10,140);

}
//========================================//

