
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//HW_7
//copyright Joanne Lo jylo 2014
//try to avoid the dark orange fish. Your cursor is the yellow fish.
//You get 45 seconds and 5 tries to avoid the fish. Good luck!

float x, y, dx,dy, wd, ht, diam, easingCoef;
float h, i;
float deltaX, deltaY;
float a,b;
float dim, rad;
float easingCoefficient; 
int startTime, currentTime, timeLimit, timeLapsed;
int collisions,hit;
int game;
int fishCol = color(247,203,44);
color bgColor, fishCol1;
PFont font;
PImage img;
Minim m;
AudioPlayer s1;


void setup()
{  
  size( 400, 400 );
  background( 92,142,224);
  noCursor();
  startTime=45;
  timeLimit=45;
  collisions=5;
  hit=0;
  easingCoef=0.3;
  m = new Minim(this);
  dx=10;
  dy=10;
  h = random( width );
  i = random( height );
  
  smooth();
  frameRate(7);
 
}
void draw()
{
   
  prepareWindow( );
 
  backgroundFish(x,y,wd,ht);
  otherBackgroundFish(x,y,wd,ht);
  dodge();
  backgroundFishToAvoid( );
  drawBackground();
  
  
  showInstructions();
  play();
  displayScore();
  showLoseScreen();
  showWinScreen();
  loseScreen();
  winScreen();
  
//screens
if ( game == 0 )
  {
    showInstructions( );
  }
  else if ( game == 1 )
  {
    play();
  }
  else if (game==2)
  {
    showWinScreen( );
  }
  else if (game==3)
  {
    showLoseScreen();
  }
}
void drawFish()
{
  easingCoef = 1;
  wd = 40;
  ht = 40;
  
  //draw the fish figure
 noStroke();
  
  smooth( );
  fill( fishCol );
  ellipse( mouseX, mouseY, wd, ht/2 );
  fill( 0 );
  ellipse( mouseX + 11, mouseY +4, wd * .1, ht * .1 );
  fill( fishCol );
  triangle(mouseX,mouseY,mouseX-wd,mouseY+ht/4,mouseX-wd,mouseY-ht/4 );

}
    
void backgroundFishToAvoid ()
{
  easingCoef=10;
  fishCol1= color(206,106,18);
  a=random(0,400);
  b= random(0,400);
  frameRate( 4 );
  {
  fill( fishCol1);
  noStroke( );
  triangle(a,b,a-wd,b+ht/4,a-wd,b-ht/4 );
  ellipse( a,b, wd, ht/2 );
  fill(0);
  ellipse( a+12,b+3, wd * .1, ht * .1 );
  x=x+dx;
  }
}
void backgroundFish(float x, float y, float wd,float ht)
{
  {
   noStroke();
  smooth( );
  fill( 234,161,149);
  triangle(x,y+70,x-wd,(y+ht/4)+66,x-wd,(y-ht/4)+64 );
  ellipse( x, y+66, wd, ht/2 );
  fill( 0 );
  ellipse( x + 11, y+70, wd * .1, ht * .1 );
  }
   if(x>width)
  {
  dx=-dx;
  }
  else if (x<0)
  {
    dx=-dx;
  }
}
  void otherBackgroundFish(float x, float y, float wd,float ht)
  {
    x=dy+x;
     if ( x > width )
  {
  x=0;
}
    noStroke();
  smooth( );
  fill( 209,149,234);
  triangle(x+200,y+300,x-wd+200,(y+ht/4)+296,x-wd+200,(y-ht/4)+294 );
  ellipse( x+200, y+296, wd, ht/2 );
  fill( 0 );
  ellipse( x + 211, y+300, wd * .1, ht * .1 );
  
   
 
  
}

  
 void drawBackground ()
  {
    fill(92,142,224);
    rect(0,0,width,height);
    fill(226,208,156);
    rect(0,9*height/10, width, height);//seafloor
    img=loadImage("a.png");
    image(img,0,150);
    img=loadImage("a.png");
    image(img,260,150);
  }
 
void prepareWindow( )
{
 bgColor= color( 92,142,224);
  rectMode(CORNER);
  fill( bgColor );
  rect( 0, 0, width, height );
}
 void showInstructions( )
{
   background( 0 );
   fill( 255 );
   font =loadFont ("AmericanTypewriter-Bold-48.vlw");
   textFont(font, 12);
   textAlign(CENTER);
   textFont(font, 25);
   text("DODGE THE FISH", width/2, 70 );
   textFont(font, 12);
   text("You have "+ collisions + " tries and " + timeLimit + " seconds to dodge the dark orange fish.", width/2, 160 );
   text("Press any key to start the game.", width/2, 250);
  
}
void play( )
{
  dodge();
  drawBackground();
  backgroundFishToAvoid();
   backgroundFish(x,y,wd,ht);
   otherBackgroundFish(x,y,wd,ht);
  drawFish();
  displayScore( ); 
}

void keyPressed( )
{
   if ( game == 0 )
   {
      game = 1;
     loop( ); 
   startTime = millis( );     
   }
}
   

void displayScore( )
{
  fill(255);
  font =loadFont ("AmericanTypewriter-48.vlw");
   textFont(font, 14);
   textAlign(CENTER);
  text( "Tries remaining: " + (collisions-hit), width/2, height-50 ); 
  currentTime = millis( );
  timeLapsed = (currentTime - startTime)/1000; 
  text( "Time: " + (timeLimit-timeLapsed), width/2, height - 80 );
}

void showLoseScreen()
{
  fill(0);
  rect(0,0,width, height);
  fill(255,0,0);
  textAlign(CENTER);
  text("You Lost.", width/2, height/2-.1*height);
}

void showWinScreen()
{
  fill(0);
  rect(0,0,width, height);
  fill(255,0,0);
  textAlign(CENTER);
  text("You Won!", width/2, height/2-.1*height);
}

void dodge( )

{
  s1=m.loadFile("button-6.mp3", 1024);
    float d = dist( a,b, mouseX, mouseY );
     if ( d <= 35)
     {
      hit++;
      s1.play( );
      fill( 255,0, 0 );
      rect( 0, 0, width, height );
      mouseX=0;
      mouseY=0;
     }   
}

void loseScreen()
{
if (collisions<=0|| hit>=5)
  {
  game=3;
  showLoseScreen();
  }
}
void winScreen()
{
  if (collisions<= 5 && collisions>=0 && timeLapsed==timeLimit)
  {
    game=2;
   showWinScreen();
  }
}
void stop()
{
  s1.close();
  super.stop();
}


