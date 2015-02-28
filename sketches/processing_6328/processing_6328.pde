
/**
 *
 *Created By: David A. Perez
 */

PImage BG;
PImage smileyFace;
PImage sadFace;

int dudeSize;

int dudeOneX;
float dudeOneY;
int dudeOneShake;
int dudeOneSpeed;

int jumpOne;
int jumpTwo;

int dudeTwoX;
float dudeTwoY;

int FLOOR;
int FRAMERATE;
int radius;

float miliSecOne;
int timerOne;

float miliSecTwo;
int timerTwo;

int yOne;
int yTwo;

float Gravity;

void setup()
{
  // Loading Pictures  
  sadFace = loadImage("sadFace.gif");
  smileyFace = loadImage("smileyFace.gif");
  BG = loadImage("sunset.jpg");
  
  size(900, 600);
  background(BG);
  smooth();
    
  /* VARIABLE YOU CAN CHANGE */ 
     FLOOR = height-50;
  
     dudeSize = 50;
     radius = dudeSize/2;
     
     dudeOneX = width/5;
     dudeOneY = FLOOR-dudeSize;
     dudeOneShake = 0;
     dudeOneSpeed = 5;
     
     dudeTwoX = width/5*4;
     dudeTwoY = FLOOR-dudeSize;
     
     Gravity = 9.1;
     
     FRAMERATE = 50;
  /* VARIABLE YOU CAN CHANGE */
  
  frameRate(FRAMERATE);
  
  //Set Variables 
  miliSecOne = 1/FRAMERATE;
  timerOne = 0;
  
  miliSecTwo = 1/FRAMERATE;
  timerTwo = 0;
  
  jumpOne = 0;
  jumpTwo = 0;
  
  yOne = 1;
  yTwo = 1;
  
}

void draw()
{
  background(BG);
  
  fill(20, 50, 90);
  rect(0, FLOOR, width, 50);
  
  dudeOne();
  gravityOne();
  dudeTwo();
  gravityTwo();
}

void dudeOne()
{
  int signChooser;
  image(smileyFace, dudeOneX, dudeOneY, dudeSize, dudeSize);
  
  if(((keyPressed) && (key == 'w' || key == 's' || key == 'a' || key == 'd')) || (jumpOne == 1)){
     signChooser = (int)(random(2));
    
    if(signChooser == 1){
      dudeOneX += (int)(random(dudeOneShake));
      dudeOneY += (int)(random(dudeOneShake));
    }
    else{
      dudeOneX -= (int)(random(dudeOneShake));
      dudeOneY -= (int)(random(dudeOneShake));
    } 
  
   if(key == 'w'){jumpOne = 1;}
      if(jumpOne == 1){dudeOneY -= dudeOneSpeed;}
   if(key == 'a'){dudeOneX -= dudeOneSpeed;} 
   if(key == 'd'){dudeOneX += dudeOneSpeed;}
  }
  
  if(dudeOneX < 0-dudeSize){dudeOneX = width + radius;}
  if(dudeOneX > width+radius){dudeOneX = 0-dudeSize;}
}

void dudeTwo()
{
  image(sadFace, dudeTwoX, dudeTwoY, dudeSize, dudeSize);
  
  if(keyPressed && key == CODED && keyCode == UP){jumpTwo = 1;}
     if(jumpTwo == 1){dudeTwoY -= 1;}
  if(keyPressed && key == CODED && keyCode == LEFT){dudeTwoX -= 1;}
  if(keyPressed && key == CODED && keyCode == RIGHT){dudeTwoX += 1;}
  
  if(dudeTwoX < 0-dudeSize){dudeTwoX = width + radius;}
  if(dudeTwoX > width+radius){dudeTwoX = 0-dudeSize;}
}

void gravityOne()
{ 
  float downwardThrust = Gravity*miliSecOne;
  
  if(dudeOneY < FLOOR-dudeSize)
  {
    timerOne = 1;
    miliSecOne += 0.01;
  }
  else{
    timerOne = 0;
    miliSecOne = 0;
    jumpOne = 0;
    yOne = 1;
  }
    
  if(timerOne == 1)
  {
    dudeOneY = dudeOneY + downwardThrust;
  }
}

void gravityTwo()
{   
  float downwardThrust = Gravity*miliSecTwo;
  
  if(dudeTwoY < FLOOR-dudeSize)
  {
    timerTwo = 1;
    miliSecTwo += 0.01;
  }
  else{
    timerTwo = 0;
    miliSecTwo = 0;
    jumpTwo = 0;
    yTwo = 1;
  }
  
  if(timerTwo == 1)
  {
    dudeTwoY = dudeTwoY + downwardThrust;
  }
}

