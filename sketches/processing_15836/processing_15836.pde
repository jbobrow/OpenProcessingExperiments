

eye [] myEyes;
int x;
int y;
int Anzahl=20;


void setup() 
{
 myEyes = new eye [Anzahl];
 
 for(int i= 0;i<Anzahl;i++)
{
  int randomXPosition = int(random(95,(width-95)));
  int randomYPosition = int(random(35,(height-35)));
  int randomXMove = int(random(-3,5));
  int randomYMove = int(random(1,5));
  eye myEye = new eye(randomXPosition, randomYPosition, randomXMove, randomYMove);
  myEyes[i] = myEye;
} 
  size(500,500);
  background(0);
  smooth();
  stroke(0);
   for(int i= 0;i<Anzahl;i++)
{
  int randomXPosition = int(random(95,(width-95)));
  int randomYPosition = int(random(35,(height-35)));
  int randomXMove = int(random(-3,5));
  int randomYMove = int(random(1,5));
  eye myEye = new eye(randomXPosition, randomYPosition, randomXMove, randomYMove);
  myEyes[i] = myEye;
   myEyes[i].draw_my_eye(mouseX/2-(myEyes[i].giveX()),mouseY/2-(myEyes[i].giveY()),mouseX, mouseY);
} 
}

void draw() 
{
  frameRate(200);
  background(0);
  for(int i =0; i<Anzahl;i++)
  {
  this.bounce(myEyes[i],i);
  myEyes[i].move(x,y);
  myEyes[i].draw_my_eye(myEyes[i].giveX()/4,myEyes[i].giveY()/4,mouseX, mouseY);
  }
}

void keyPressed() //closes the eyelids
{  for(int i =0; i<Anzahl;i++)
  {
  frameRate(7);
  myEyes[i].closeEye();
  }
}


void bounce(eye myEye, int i)
{
 int positionX=myEye.positionX;
 int positionY=myEye.positionY;
 x = myEye.giveMoveX();
 y = myEye.giveMoveY();
 if(positionX<=95)
 {
   x=1;
   y=int(random(-3,5));
 }
 else if(positionX>=width-95)
 {
   x=-1;
   y=int(random(-3,5));
 }
 if(positionY<=35)
 {
   y=1;
   x=int(random(-3,5));
 }
 else if(positionY>=height-35)
 {
   y=-1;
   x=int(random(-3,5));
 }

}
 
/*int bounceY(eye myEye)
{
 int positionX=myEye.giveX();
 int positionY=myEye.positionY;
 if(positionX<=95)
 {
   //x=1;
   y=int(random(-2,2));
 }
 if(positionY<=35)
 {
   y=1;
   //x=int(random(-2,2));
 }
 if(positionX>=width-95)
 {
   //x=-1;
   y=int(random(-2,2));
 }
 if(positionY>=height-35)
 {
   y=-1;
   //x=int(random(-2,2));
 }
 else
 {
   y = myEye.giveMoveY();
 }
 return y;

}*/
//copyright 2010 by Nick Byerly
//take it easy mofagel

