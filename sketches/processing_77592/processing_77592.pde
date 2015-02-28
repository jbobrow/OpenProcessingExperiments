
//Patrick Clancy
//Homework 9
//Copyright, Patrick Clancy, Carnegie Mellon University, 2012



int [ ] values = { 12, 4, 120, 45, 78, 65, 231, 72, 3, 1, 97, 15 };


void setup() 
{
  size(400,400);
  fill(105, 250, 25);
  textSize(20);
  background(0, 0, 0);
  println (values);
  text("Length of Array=" + values.length, 40, 50);
  text("Sum of Values=" + sumValues (), 40, 100);
  text("Average of Values=" + getAverage (), 40, 150);
 text("Sum of Greater Than Average=" + sumGreater (), 40, 200); 
}

int sumValues ()
{
 int sum = 0;
 for (int v=0; v < values.length; v ++)
 {
   sum = sum + values[v];
 }
  
 return sum;
}
 
int getAverage ()
{
  int avg = 0;
  for (int v=0; v<values.length; v++)
  {
    avg = sumValues ()/values.length;
  }
  return avg;
}
 
int sumGreater ()
{
  int greater= 0;
  for (int v= 0; v< values.length; v++)
  {
    if (values [v]> getAverage ()) {
   greater= greater +values[v];
    }
  }
  return greater;
}


//saveframe


