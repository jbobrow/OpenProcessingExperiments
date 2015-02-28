
//Gloriana Gonzalez
//HW 9
//Arrays
//October 2012



int [] iList= {2, 8, 12, 9, 3, 27, 15, 20, 6, 14};


void setup ()
{
  size (400, 400);
  textSize(10);
  smooth();
  fill(0);


  
}
void draw()

{
 background (200, 60, 10);
 text ("Array length= " + iList.length, mouseX, mouseY);
 text ("Array sum= " + sumAll(), mouseX, mouseY+20);
 text ("Array average= " + average(), mouseX, mouseY+40);
 text ("Array sum of values greater than average= " + sumGreaterAverage(), mouseX, mouseY+60);

}




//This prints the sum of all the values of the array
float sumAll ()
{
  float sumAll=0;
  for (int i=0; i<iList.length; i++)
 {
  sumAll= sumAll + iList[i];
 }
 return sumAll;  
}


//This prints the sum of all the values of the array
float average()
{
  return sumAll()/ iList.length;
}


//This sums op the values that are greater than the average
float sumGreaterAverage()
{
  float sumGreaterAverage = 0;
  float average= average();
  for (int i =0; i<iList.length; i++)
  {
    if (iList[i] > average)
    {
       sumGreaterAverage= sumGreaterAverage + iList[i];
    }
  }
  
  return sumGreaterAverage;
}



