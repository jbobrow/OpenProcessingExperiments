
eye myEye;
int x;
int y;

void setup() 
{ 
  x=-1;
  y=0;
  myEye = new eye (200,200); 
  size(400,400);
  background(0);
  stroke(0);
  smooth();
  frameRate(70);
  myEye.draw_my_eye(mouseX,mouseY);
}

void draw() 
{
  frameRate(70);
  background(0);
  bounce();
  myEye.move(x,y);
  myEye.draw_my_eye(mouseX,mouseY);
}

void keyPressed() //closes the eyelids
{ 
  myEye.closeEye();
  frameRate(7);
}


void bounce()
{
 int positionX=myEye.giveX();
 int positionY=myEye.positionY;
 if(positionX<=95)
 {
   x=1;
   y=int(random(-2,2));
 }
 if(positionY<=35)
 {
   y=1;
   x=int(random(-2,2));
 }
 if(positionX>=width-95)
 {
   x=-1;
   y=int(random(-2,2));
 }
 if(positionY>=height-35)
 {
   y=-1;
   x=int(random(-2,2));
 }

}
//copyright 2010 by Nick Byerly
//take it easy mofagel

