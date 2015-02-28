
int xPos = 0;        //establish variables to hold x&y position
int yPos = 0;

float rFactor = 0;  //establish non-integer values for scaling colours
float gFactor = 0; 

int speedFactor = 1; //switches between 1 and -1 to control direction of square placement

int squareSize = 40;  //set up the size of the boxes


void setup()
{
  size(400,400);
  background(0);  
  //frameRate(400);
}

void draw()
{
  
  rFactor = 1.0*xPos/(width - squareSize); //determine current position as fraction of space available
  gFactor = 1.0*yPos/(height - squareSize);
  
  fill(255*rFactor, 255*gFactor, random(255)); //sets R&G values according to rFactor,gFactor. B value is assigned randomly.
  stroke(0,0);
  rect(xPos,yPos,squareSize,squareSize);
  

  
  if (xPos == width){
    yPos = yPos + squareSize;
    speedFactor = -1*speedFactor;
  } 
  
  if (xPos == -squareSize && speedFactor == -1) {
   yPos = yPos + squareSize;
   speedFactor = -1*speedFactor; 
  }
  xPos = xPos + speedFactor*squareSize;
  
  if(yPos == height) {
    yPos = 0;
  }
   
}

