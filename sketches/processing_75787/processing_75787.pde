
//hannah schmitt
//homework 9
//copyright, hannah schmitt, carnegie mellon university, 2012

int [] iList = {4, 7, 10, 14, 17, 22, 32, 37, 41, 46};


void setup ()
{
  size (400,400);
  fill(47, 48, 85);
  background(201, 240, 255);
println (iList);
text("Length of Array=" + iList.length, 10, 80);

text("Sum of the values= "+ sumValues (), 10, 140);

text("Average of the value=" + getAverage (), 10, 200);

text("Sum of greater than the average =" + sumGreater (), 10, 260);
 
}


int sumValues ()
{
 int sum = 0;
 for (int i=0; i < iList.length; i ++)
 {
   sum = sum + iList[i];
 }
 
 return sum; 
}

int getAverage ()
{
  int avg = 0;
  for (int i=0; i<iList.length; i++)
  {
    avg = sumValues ()/iList.length;
  }
  return avg;
}

int sumGreater ()
{
  int greater= 0;
  for (int i= 0; i< iList.length; i++)
  {
    if (iList [i]> getAverage ()) {
   greater= greater +iList[i]; 
    }
  }
  return greater;
}

