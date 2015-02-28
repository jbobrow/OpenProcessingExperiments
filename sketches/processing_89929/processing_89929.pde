
//suzanne choi, suzanne1, hw7
//copyrights 2013 suzanne choi. all rights reserved.

int count;
int gameTime;
int startTime;
int gamePhase;
float bx,by,bd,bxSpeed,bySpeed;
PImage mouse;
PImage heart;
PImage got;
PImage cloud;

void setup()
{
  size (400,400);
  count=0;
  startTime=0;
  gamePhase=0;
  gameTime=20000;
  bx=random(width);
  by=random(height);
  bd=30;
  bxSpeed=6;
  bySpeed=10;
  textSize(20);
  textAlign(CENTER);
  mouse= loadImage ("mouse.png");
  heart= loadImage("heart.png");
  got= loadImage("got.png");
  cloud = loadImage ("cloud.jpg");
}

void draw()
{
  background(cloud);
  if (gamePhase == 0 )
  {showInstruction();
  }
  
  else if (gamePhase == 1)
  {
  playgame();
  }
  
  else { score(); }
}

void score()
{
background(51,59,82);
fill(255);
text (" Game Over" , width/2, 170);
text (" you've got" + count + " love points! ", width/2, 200); 
image(got, width/2,height*.5, 150,150);
}
void checkTime()
{
  fill(255);
  text("remaining time : " + (gameTime/1000-(millis()-startTime)/1000), width/2,height*.8);
  if ( (millis()-startTime)>gameTime)
  {gamePhase =2;}
}
 
 
void showScore()
{fill(255);
text(" you've got " + count + " love points!", width/2, height*.9);

}
 
 
void checkHit( )
{
     float d = dist( bx, by, mouseX, mouseY );
     if ( d < bd/2)
     {
       count++;
       fill(255);
       rect(0,0,width,height);
     } 
     
} 
 
  
void drawBounce1(float x, float y, float z)
{ 
  image (heart, x, y, z, z);
}


void moveBounce()
{ 
bx=bx+bxSpeed;
  if (bx>width)
  {bxSpeed=-bxSpeed;}
  else if (bx<0)
  {bxSpeed=-bxSpeed;}

by=by+bySpeed;
  if(by>height)
  {bySpeed=-bySpeed;}
  else if (by<0)
  {bySpeed=-bySpeed;}
}

void drawMolong()
{ image (mouse, mouseX, mouseY, 100,100);}



void playgame()
{
  moveBounce();
  drawBounce1(bx,by,bd);
  drawMolong();
  checkHit();
  showScore();
  checkTime();
}

void showInstruction()
{
  background(51,59,82);
 text("Move your mouse to catch a heart! ", width/2, 180);
 text(" PRESS YOUR MOUSE TO START!", width/2,230); 
}

void mousePressed()
{
  if (gamePhase == 0 )
  {
    gamePhase=1;
    startTime=millis();
  }
}
  


