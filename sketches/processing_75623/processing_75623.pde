
//ihansen HW9
//copyright2012
//declare and initialize an array of int values
//and work with the data in the array


int[]arrayPlay = {2,4,6,8,10,12,14,16,18,20};


void setup()
{
  size(400,400);
  background(0);

  textSize(24);
  text("length of array: " + arrayPlay.length,width/7,height/6);
  text ("Sum of array values: "+ arraySum(), width/7, height/4);
  text ("Avg of array values: " + arrayAvg(), width/7, height/3);
  text ("Sum of array values", width/7, height/2.25);
  text ("greater than the average: "
      + arraySumGreaterThanAvg(), width/7, height/2);
 
 
}

void draw()
{
 
}


//String arrayString(int[]whateverArray)
//{
  //String s =" ";
  //for (int i = 0; i < whateverArray.length; i++)
  //{
    //s += whateverArray[i] + "  ";
  //}
  //return s;
//}


int arraySum()
{
 int sum=0;
 for (int i=0; i <arrayPlay.length; i= i+1)
 {
   sum=sum+arrayPlay[i];
 }
 return sum;
  
}

float arrayAvg()
{
  float sum = 0;
  for (int i=0; i < arrayPlay.length; i++)
  {
    sum += arrayPlay[i];
  }
  return sum/arrayPlay.length;
}

int arraySumGreaterThanAvg()
{
  int sum=0;
  for (int i=0; i< arrayPlay.length; i=i+1)
  {
    if (arrayPlay[i] > arrayAvg())
    {
    sum = sum + arrayPlay[i];
  }}
  return sum;
  
}
