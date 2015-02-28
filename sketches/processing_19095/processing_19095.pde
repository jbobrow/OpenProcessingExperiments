
smooth();
//set the size and line weight
size(800, 680);
strokeWeight(3);

//declare coordinate variables
int xPrev = 150;
int yPrev = 200;
int xNext = -1;
int yNext = -1;

//declare color variables
int[] colorVals = new int[3];
colorVals[0] = 0;
colorVals[1] = 0;
colorVals[2] = 0;

/*
declare the cycler. this keeps track fo which color
value to change.
*/
int cycler = 0;

//sets black background
background(0x000000);

while (true)
{
  cycler++;
  //randomly generade segment color
  for (int k=0; k<3; k++)
  {
    colorVals[k] = int(random(0,255));
  }
  stroke(colorVals[0], colorVals[1], colorVals[2]);
  //randomly generate next coords
  
  //connects last points after a certain number of lines. now it's 150.
  if (cycler == 150)
  {
    xNext = 150;
    yNext = 200;
    line(xPrev, yPrev, xNext, yNext);
    break;
  }
  
  //randomly generates coordinates for the next line. makes sure the line
  //length is constant. the constant happens to be 75.
  while (xNext < 0 || xNext >= 800 || yNext < 0 || yNext >= 680)
  {
    int deltaX = int(random(-75, 75));
    xNext = xPrev + deltaX;
    int overUnder = 0;
    while (overUnder == 0)
    {
      overUnder = int(random(-5, 5))%2;
    }
    int deltaY = overUnder*int(sqrt(5625-sq(deltaX)));
    yNext = yPrev + deltaY;
  }
  line(xPrev, yPrev, xNext, yNext);
  
  //the destination coords are now the current location, the next coords
  //are reset
  xPrev = xNext;
  yPrev = yNext;
  xNext = -1;
  yNext = -1;
}




