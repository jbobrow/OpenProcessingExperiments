
//homework 7
//Copyright Paul Bracchitta Semptember 2011 Pittsburgh, PA 15289


float x, y ,deltaX,dia,deltaY;
color col;
PImage pic;

void setup()
{
  smooth();
  size(400,400);
  x = width/2;
  y = height/2;
  deltaX = 2;
  deltaY = 2;
  dia = 40;
  col = color(200,200,0,10);
  pic = loadImage("meteor.png");
  frameRate(60);

  
  
  
 
  
}

void draw( )
{
  
  prepScreen();
  moveCircle();
  drawCircle();
  speedChangeX();
  speedChangeY();
  speedCounter();
}


void keyPressed()
{
  deltaX = 0;
  deltaY = 0;
  x = width/2;
 y = width/2; 
  
  
}



void speedCounter()
{
  fill(255);
  textAlign(CENTER);
  
  text("Horizontal Speed: " + deltaX, 200, 50);
  text("Vertical Speed: " + deltaY, 200,65);
  
  
}

void speedChangeY()
{
  
  
    deltaY = (mouseY-200)/20;
  
  //if(deltaY >= 10)
  {
   //deltaY = -deltaY;
  }
}


void speedChangeX( )
{
  
  
    deltaX = (mouseX-200)/20;
  
//  while(deltaX <= 20)
//  {
//    deltaX = mouseX/10;
//  }
}


void moveCircle()
{
  y = y + deltaY;
  x = x + deltaX;
  
  //too far right:
  if(x > width + dia/2)
  {
    x=-dia/2;
  }
  
  //too far left:
  if(x < -dia/2)
  {
    x = width + dia/2;
  }
  
  //too far up:
  if(y > height + dia/2)
  {
    y = -dia/2;
  }
  
  //too far down:
  if(y < -dia/2)
  {
    y = height + dia/2;
  }
}


void drawCircle( )
{
  //fill(0,0,200);
  //ellipse(x,y,dia,dia);
  //dia = 50;
  
  imageMode(CENTER);
  
  //NULL POINTER EXCEPTION?!?!?!?!?!? 
  image(pic,x,y,2*dia,2*dia);
}


void prepScreen( )
{
  fill(0,14,29);
  rect(0,0,width,height);
}


