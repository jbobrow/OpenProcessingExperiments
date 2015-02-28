
/* Richard May rwmay@andrew.cmu.edu
Copyright October 2012
Declare and initialize and array of int values and work with
the data in the array to find it's length, sum, average and sum
of the numbers greater than the average.
*/

int [] numbers = {
  10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
int sum;
int avg;
int sumAvg;


void setup ()
{
  smooth();
  size (500,500);
}
void draw ()
{
  background (255);
  textSize(.0225*width);
  fill(0);
  noStroke ();
  
  
  
  findLength();
  findSum();
  findAvg();
  findSumAvg();
}


void findLength ()
{
  text ("The Length of the Array is " + numbers.length, .05*width, .2*height);
}

void findSum()
{
  sum = 0;
  for(int i=0; i < numbers.length; i++)
  {
    sum=sum+numbers [i];
  }
  text ("The Sum of the Values with in the Array is " + sum, .05 * width, .3 *height);
}

void findAvg()
{
  avg = sum/numbers.length;
  text ("The Average of the numbers in the Array is " + avg, .05 * width, .4 * height);
}

void findSumAvg ()
{
  sumAvg=0;
   for (int i = 0; i < numbers.length; i++)
  {
    if (numbers[i] > avg)
    {
    sumAvg=sumAvg+numbers [i];
    }  
  }
  text ("The Sum of the Numbers in the Array Greater than the Average of the Array " + sumAvg, .05 * width, .5 * height);
}


