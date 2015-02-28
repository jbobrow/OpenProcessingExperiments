
int arraySize=200;

int currentPoint=-1;
int pointsReached=-1;
int xPos[] = new int[arraySize];
int yPos[] = new int[arraySize];
int xCtrl[] = new int[arraySize];
int yCtrl[] = new int[arraySize];
int clr[] = new int[arraySize];
int colorCounter;
int colorVector = 1;
int randModX[] = new int[arraySize];
int randModY[] = new int[arraySize];

void setup()
{
  //set up the randMod array;
  for(int k = 0; k < arraySize; k++)
  {
    randModX[k] = 0;
    randModY[k] = 0;
  }
  
  size(800,800);
  smooth();
  background(30);
}

void draw()
{
 
  noStroke();
  fill(30, 255);//-(pointsReached*1.25));
  rect(0, 0, width, height);
  
  
  if(!mousePressed)
  {
    if(pointsReached>0)
    {
      pointsReached--;
    }
    if(currentPoint>0)
    {
      currentPoint--;
    }
  }
  
 // background(30);
  //if you've clicked once, draw an elipse,
if(pointsReached>=0)
{
  for(int i = 0; i <= pointsReached; i++)
  {
     stroke(255);
     fill(255);
     ellipse(xPos[currentPoint], yPos[currentPoint], 20, 20);
  }
}
  //if you've clicked twice or more, draw a line
if(pointsReached>=1)
{
  for(int i = 0; i <= pointsReached; i++)
  {
     stroke(255);

  }
}
 
 //modulate the randMod;
 for(int r = 0; r < arraySize; r++)
 {
  
   randModX[r] = randModX[r] + (int)random(-10, 10);
   randModY[r] = randModY[r] + (int)random(-10, 10);
 }

  //
  colorMode(HSB, 100);
  //changing the color
colorCounter = colorCounter+colorVector;
if(colorCounter>=100 || colorCounter<=0)
{
  colorVector = colorVector*-1;
}
///

if(pointsReached>=1)
{
   for(int i = 0; i <= pointsReached; i++)
  {
   stroke(clr[i], 360, 360);
   //make the curve begin at half
  bezier((float)xPos[i], (float)yPos[i],/////
  //ctrlPts
  (float)randModX[i] + xPos[(i+1)%pointsReached]-((xPos[(i+1)%pointsReached] - xPos[i])/2),
  
  (float)randModY[i] + yPos[(i+1)%pointsReached]-((yPos[(i+1)%pointsReached] - yPos[i])/2),

  (float)xPos[i], (float)yPos[i],

  /*(float)randModX[i] + ((xPos[(i+1)%pointsReached] - xPos[i])/2),
  
  (float)randModY[i] + ((yPos[(i+1)%pointsReached] - yPos[i])/2),  
  */
  (float)xPos[(i+1)%pointsReached], (float)yPos[(i+1)%pointsReached]);
  }
}

}///endDraw



void mouseDragged()
{
  currentPoint++;
  if(currentPoint>=arraySize)
  {
    currentPoint=0;
  }
 
  if(pointsReached<arraySize-1)
  {
    pointsReached++;
  }
  
  clr[currentPoint]= colorCounter;
  xPos[currentPoint] = mouseX;
  yPos[currentPoint] = mouseY;
  
 
}

