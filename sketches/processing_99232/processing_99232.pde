
int xPos = 0;        //establish variables to hold x&y position
int yPos = 0;

float rFactor = 0;  //establish non-integer values for scaling colours
float gFactor = 0; 

int speedFactor = 1; //switches between 1 and -1 to control direction of square placement

int squareSize = 40;  //set up the size of the boxes and the window - in such a way to prevent 
int divisions = 12; //fractional window or box sizes.
int windowSize = squareSize*divisions;


void setup()
{
  size(400,400);  //set window size
  background(0);  
  //frameRate(400);
}

void draw()
{
  
  rFactor = 1.0*xPos/(windowSize - squareSize); //determine current position as fraction of space available
  gFactor = 1.0*yPos/(windowSize - squareSize);
  
  fill(255*rFactor, 255*gFactor, random(255)); //sets R&G values according to rFactor,gFactor. B value is assigned randomly.
  stroke(0,0);
  rect(xPos,yPos,squareSize,squareSize);
  

  
  if (xPos == windowSize){
    yPos = yPos + squareSize;
    speedFactor = -1*speedFactor;
  } 
  
  if (xPos == -squareSize && speedFactor == -1) {
   yPos = yPos + squareSize;
   speedFactor = -1*speedFactor; 
  }
  xPos = xPos + speedFactor*squareSize;
  
  if(yPos == windowSize) {
    yPos = 0;
  }
   
}




