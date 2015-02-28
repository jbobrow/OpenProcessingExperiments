
PImage ferris1, ferris2;

PFont a;
PFont b;

float centerX = 0;
float centerY = 250;
float vX = 10;
float angle = 0.0;


void setup()
{
  rectMode(CENTER);
  textAlign(CENTER);
  size(500, 500);
  smooth();
  noStroke();
  ferris1 = loadImage("ferris1.png");
  ferris2 = loadImage("ferris2.png");
  a = loadFont("marie.vlw");
  b = loadFont("apple.vlw");

}
 
//every step
void draw()
{
  //paint the background
  background(0,0,0);
 
  //update the center of the circle
  //by adding a vX
  centerX = centerX+vX*2;
  if(frameCount >= 900)
  {
    image(ferris1, 0, 0, ferris1.width*1.7, ferris1.height*1.7);
  }

  if(frameCount >=30 )
  {
  textFont(b);  
  text("\"Yep I've said it before", 250, 50);
  }
  if(frameCount >=150)
  {
  text("and I'll say it again", 250, 100);
  }
  if(frameCount >=175)
  {
      if(centerX>width+1800)
   {
    //then the speed becomes negative
    //because I want it to go backward
    vX = -20;
    }
 
  //is the centerX outside the canvas on the left?
  if(centerX<-1800)
    {
    //then the speed becomes positive
    //because I want it to go forward
    vX = 20;
    }   
  textFont(a);
  fill(255, 255, 255);
  textSize(80);
  text("LIFE", centerX, centerY-50);
  }
  if(frameCount >=300)
  {
  textFont(b);
  text("moves pretty fast", 250, 250);
  }
  if(frameCount >=375)
  {
    text("If you don't stop", 250, 300);
  }
  if(frameCount >=500)
  {
    text("And look around", 250, 350);
  }
  if(frameCount >= 575)
  {
    text("every once in awhile", 250, 400);
  }
  if(frameCount >= 700)
  {
    text("you could miss it.\"", 250, 450);
  }
  
}



