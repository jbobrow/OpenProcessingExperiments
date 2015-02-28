
float moveDownTrigger = 0;
float shouldSetSpeed = 0;
float shouldDiveRed = 0;
float shouldDiveGreen = 0;
float gDirection=1;
float retreat=0;
PImage hawk;
PImage backgroundGrass;
PImage mouse;
PImage groundhog;
float pY = 500; // variable that controls y coordinate of prey ellipse
float pX = 0; // variable that controls x coordinate of prey ellipse
float gY = 480; // variable that controls y coordinate of green predator ellipse
float gX = 0; // variable that controls x coordinate of green predator ellipse
float rY = 0; // variable that controls y coordinate of red predator ellipse
float rX = 0; // variable that controls x coordinate of red predator ellipse
float pMoveY; // variable that changes in the y to move the prey ellipse 
float pMoveX; // variable that changes in the x to move the prey ellipse 
float gMoveY; // variable that changes in the y to move the green predator ellipse 
float gMoveX=3; // variable that changes in the x to move the green predator ellipse 
float rMoveY; // variable that changes in the y to move the red predator ellipse 
float rMoveX; // variable that changes in the x to move the red predator ellipse 
float tempSaveSpeed=0;
float maxSpeed = 4.0; // variable that sets the maximum speed at which creatures can move
float radius = 20.0; // variable that sets the size of the ellipses
boolean pScared = false; // boolean variable that lets the white ellipse to remain scared
void setup() { 
  hawk = loadImage("Hawk.png");
  backgroundGrass = loadImage("Background.png");
  mouse = loadImage("Mouse.png");
  groundhog = loadImage("Groundhog.png");
  size(500, 500); // sets the size of the sketch
  background(0); // draws the background black
  pMoveX=random(-maxSpeed, maxSpeed); // sets the white ellipse speed in the x
  //pMoveY=random(-maxSpeed, maxSpeed); // sets the white ellipse speed in the y
  gMoveX=random(2, maxSpeed); // sets the green ellipse speed in the x
  gMoveY=random(-maxSpeed, maxSpeed); // sets the green ellipse speed in the y
  rMoveX=random(2.0, maxSpeed); // sets the red ellipse speed in the x
  rMoveY=random(2.0, maxSpeed); // sets the red ellipse speed in the y
  rX=20+random(width-(radius+20)); // sets the starting position of the red ellipse in the x
  rY=100; // sets the startin) position of the red ellipse in the y
  gX=4+random(width-(radius+4)); // sets the starting position of the green ellipse in the x
  pX=random(radius*2, width-radius*2);  // sets the starting position of the white ellipse in the x
  smooth();  // sets all 2D primitives to draw smoothly
  noStroke();  // sets all 2D primitives to draw without outlines 
  ellipseMode(RADIUS); // sets ellipses to draw using the last two numbers as radius width and radius height
}
void draw() {
  
  fill(0); 
  rect(0, 0, width, height); // this and the above line draw a feint black rectangle over the entire screen (this is how we get the nice trails)
  image(backgroundGrass,0,0);
  //////////Mouse "PREDATOR&PREY" LOGIC
  if(moveDownTrigger==1&&rY>250)
  {
    if(gDirection==-1)
    {
      gMoveX=-6;
    }
    if(gDirection==1)
    {
      gMoveX=6;
    }
  }
  else
  {
    if(gDirection==1)
    {
      gMoveX=2;
    }
    if(gDirection==-1)
    {
      gMoveX=-2;
    }
  }
  gX+=gMoveX; // these 2 lines move the green ellipse
  
  if (gX>width-radius || gX<radius) { // these two if statements check to see if the green ellipse is still on screen and if not, then reverses the direction in which it is moving
    gMoveX=-gMoveX;
    if(gDirection==1)
    {
      gDirection=-1;
    }
    else
    {
      gDirection=1;
    }
  }
  //fill(0, 255, 0);
  //ellipse(gX, gY, radius, radius);
  image(mouse,gX-25,gY-20);
  shouldDiveGreen=gX;

  
  //////////Bird "PREDATOR" LOGIC
  shouldDiveRed=rX;
  if(moveDownTrigger==0)
  {
    rX+=rMoveX; // these 2 lines move the red ellipse
    tempSaveSpeed=rMoveX;
  //rY+=rMoveY;
  }
  if (rX>width-(radius+40) || rX<(radius+42)) // these two if statements check to see if the red ellipse is still on screen and if not, then reverses the direction in which it is moving
  {
    rMoveX=-rMoveX;
  }
  if(rX-gX<2 && rX-gX>-8)
  {
    if(moveDownTrigger!=1)
    {
      if(rY<420)
      {
        moveDownTrigger=1;
      }
    }
  }
  if(moveDownTrigger==1)
  {
    rMoveX=0;
    rY+=12;
  }
  
  if (rY>497-radius && moveDownTrigger==1)
  {
    moveDownTrigger=2;
    shouldSetSpeed=1;
    rMoveX=tempSaveSpeed;
  }
  if(moveDownTrigger==2)
  {
    if(rY<100 || rY==100)
    {
      rY=100;
      moveDownTrigger=0;
    }
    if(shouldSetSpeed==1)
    {
      rMoveX=tempSaveSpeed;
      shouldSetSpeed=0;
    }
    rX+=rMoveX;
    rY+=-4;
  }
  fill(255, 0, 0); //sets the fill to red so the red ellipse is drawn as red
  image(hawk, rX, rY);
  //ellipse(rX, rY, radius, radius); // draws red ellipse
   
  if(rX<20)
  {
    rX=20;
    rMoveX=random(2,4);
  }
  if(rX>480)
  {
    rX=480;
    rMoveX=-random(2,4);
  }
   
  //////////WHITE "PREY" ELLIPSE LOGIC
  if(pX-gX<50 && pX-gX>-50)
  {
    retreat=1;
  }
  else
  {
    retreat=0;
  }
  {
    if(retreat==1)
    {
      if(pY<530)
      {
        pY+=3;
      }
      else
      {
        pX=random(500);
      }
    }
    if(retreat==0)
    {
      if(pY>490)
      {
        pY-=3;
      }
    }
  }
  image(groundhog,pX-25,pY-25);
  //fill(255,180,180);
  //ellipse(pX, pY, radius/4, radius); // draw the white ellipse
}


