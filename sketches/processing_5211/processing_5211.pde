
float i,j;  //is movement across the screen.  
float speedme;
float eyeWidth, eyeHeight;
PImage faceImg;
PImage eyeImg;
PImage snakeImg;

PShape eyeShape;
PShape stalkShape;
PShape faceSvg;

int displayMode; //using this variable to tell the program what types of files to display.
//displayMode 0 is photoshop displayMode 1 is Illustrator.


void setup ()
{
  speedme = 5;
  displayMode = 0;
  eyeWidth = 100;
  eyeHeight = 40;
  
  size(480, 300);
  faceImg = loadImage("whiteface.png");
  eyeImg = loadImage("lips.png");
  snakeImg = loadImage("stalk.png");

  imageMode(CENTER);
  faceSvg = loadShape("whiteface.svg");
  shapeMode(CENTER);
  eyeShape = loadShape("flower.svg");
  stalkShape = loadShape("stalk.svg");
  
}

void draw ()
{
  
  background (0);
  
  
  smooth ();
  translate(240, 150);
  scale(.5, .5);
  
  //This is changing it to Photoshop.
  if (displayMode == 0)
  { 
    image(faceImg, 0, 0, 240, 320);
  } 
  
  //This is changing it to Illustrator.
 if (displayMode == 1)
  { 
    shape(faceSvg, 0, 0, 155, 134);
  }
  

 //Left Eye
 pushMatrix();
 
 translate(50, -20);
 j =  0;
 
 float frac = 255/15;
 while(j < 15)
  {
    translate(12, 0);
    
 
    if (displayMode == 0)
    {
      image(snakeImg, 0, 0, 20, 20);
    }
 
    if (displayMode == 1)
    {
      shape (stalkShape,0,0,20,20);
    }
 
     
    scale(1.1);
    rotate( .6*sin(frameCount/40.0 + (.5*j) ) );
    j=j+1;
  }

 if (displayMode == 0)
  {
   image(eyeImg, 0, 0, eyeWidth, eyeHeight);
  }
 
 if (displayMode == 1)
  {
    shape (eyeShape,0,0,eyeWidth,eyeWidth);
  }
  
  
 // Right Eye
 popMatrix();
 translate(-63, -15);
 j =  0;

 while(j < 15)
  {
    translate(-12, 0);
    
    if (displayMode == 0)
    {
      image(snakeImg, 0, 0, 20, 20);
    }
 
    if (displayMode == 1)
    {
      shape (stalkShape,0,0,20,20);
    }

    scale(1.1);
    rotate( .6*sin(frameCount/40.0 + (.5*j) ) );
    j=j+1;
  }

  
  if (displayMode == 0)
  {
   image(eyeImg, 0, 0, eyeWidth, eyeHeight);
  }
 
 if (displayMode == 1)
  {
    shape (eyeShape,0,0,eyeWidth,eyeWidth);
  }
 
  
  //i = i + speedme;
  
  i = 200;
  
  if (i > 275)
  {
    speedme = -5;
    //i = 1;     
  }
  
  if (i < 25)
  {
    speedme = 5;
    //i = 505;
    
  }
}

void keyPressed (){

  if(key == ' ')  //Testing to see if the spacebar is pressed.  
  { 
    
    displayMode++;  //the same as "displayMode = displayMode + 1;"
  
    if (displayMode > 1)
    {
      displayMode = 0; //When clicking on the spacebar you will return to Photoshop.
    }
  }


  
} 



