
//copyright benjamin corwin 2012
int [] arraytest = new int [10];
float x=25, y= 70;
void setup()
{
  smooth();
  size(450,300);
  textSize(18);
  background(0);
}
void draw()
{
  fill(255,255,0);
  arraytestSetup();
  arraytestPrint();
  arraytestText();
  arraytestSumAverage();
  noLoop();
}

void arraytestSetup()
{
  for ( int n = 0; n < 10; n ++)
  {
    arraytest[n] = int(random(0,1000));
  }
}

void arraytestPrint()
{
  //println("values in the array: ");
  for( int i = 0; i < arraytest.length ; i++)
  {
    //print( arraytest[i] + ", ");
  }
}

void arraytestText()
{
  text("values in the array: ",x,y);
  for( int i = 0; i < arraytest.length; i++)
  {
    text( arraytest.length,x,y + 20);
  }
}

void arraytestSumAverage()
{
  //println();
  //println("greater than average values: ");
  float sum = 0;
  float average = 0;
  int greatersum = 0;
  String dummy = "";
  for(int i = 0; i < arraytest.length; i++ )
  {
    sum = sum + arraytest[i];
    average = (sum/arraytest.length);
  }
  for(int i = 0; i < arraytest.length; i++ )
  {
    if(arraytest[i] >= average)
    {
      print(arraytest[i] + ", ");
      dummy += (arraytest[i] + " ");
    }
  }
  for(int i = 0; i < arraytest.length; i++)
  {
    if(arraytest[i] >= average)
    {
      greatersum = greatersum + arraytest[i];
    }
  }
  
  text("Array is randomly generated each time.",x,y-20);
  text("sum of array: ", x,y + 40);
  text(int(sum),x,y + 60);
  text("average of array",x,y + 80);
  text(nf(sum/arraytest.length,3,1), x,y + 100);
  text("numbers in array greater than the average: ", x,y + 120); 
  text(dummy,x,y + 140);
  text("sum of all numbers greater than the average: ", x, y + 160);
  text(greatersum,x,y + 180);
      
}
