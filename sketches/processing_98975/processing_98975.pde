
int xPos = 0;        //establish variables to hold x&y position
int yPos = 0;

float rFactor = 0;  //establish non-integer values for scaling colours
float gFactor = 0; 

int speedFactor = 1; //switches between 1 and -1 to control direction of square placement


void setup()
{
  size(400,400);  //set window size
  background(0);  
  //frameRate(400);
}

void draw()
{

 

  
  rFactor = xPos/380.; //determine current position as fraction of space available
  gFactor = yPos/380.;
  
  fill(255*rFactor, 255*gFactor, random(255)); //sets R&G values according to rFactor,gFactor. B value is assigned randomly.
  stroke(0,0);
  rect(xPos,yPos,20,20);
  

  
  if (xPos == 400){
    yPos = yPos + 20;
    speedFactor = -1*speedFactor;
  } 
  
  if (xPos == -20 && speedFactor == -1) {
   yPos = yPos + 20;
   speedFactor = -1*speedFactor; 
  }
  xPos = xPos + speedFactor*20;
  
  if(yPos == 400) {
    yPos = 0;
  }
   
}




