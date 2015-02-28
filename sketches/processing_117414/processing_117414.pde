
//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;

// October 21st 
// Lincoln He
// Processing for the arts
// Copyright Carnegie Mellon University 2013
// Homework 8 



float x1,y1, sz1, dy1, dx1;
float x2, y2, sz2, dy2, dx2;
color col1, col2;
PImage img1, img2, bg;
PFont f1;

int counts;
int lastCollisionTime;

//Minim m;
//AudioPlayer s1;
void setup()
{
  size( 500, 700);
  bg = loadImage("bg.jpg");
  img1 = loadImage("banana.png");
  img2 = loadImage("gorilla.png");
  
//  m= new Minim (this);
//  s1= m.loadFile("sound.wav");
  
  x1 = random( 50, width - 50 );
  y1 = random( 50, width - 50 );
  sz1= 40;
  dy1 = random( 16, 20 );
  
  x2 = random( 50, width - 50 );
  y2 = height*.85;
  sz2= 40;
  dx2 = random( 5, 20 );
  
  f1= loadFont("BrainFlower-48.vlw");
  textFont(f1,30);
  counts = 0;
  lastCollisionTime= 0;
  imageMode(CENTER);
  
}


void draw()
{
  prepScreen();
  
  drawBanana();
  moveBanana();
  
  drawGorilla();
  moveGorilla();
  
  checkCollision();
  showTime();
  showStats();
  
}

void showStats()
{
  fill(0, 125, 255);
  text("Bananas Harvested:" + counts, width*.5, height*.032);
}
void showTime()
{
  fill(0, 125, 255); 
  text("Time:" + millis()/1000, width*.2,height*.032);
}

void checkCollision()
{
  float d=dist(x1, y1, x2, y2);
  float colDist=sz1/2 +sz2/2;
  if (d <= colDist)
  {
//        s1.play();
//        s1.rewind();
        counts++;
        lastCollisionTime = millis( );
        fill(255, 218, 5);
        noStroke();
        ellipse( width/2, height/2, width, height );
        
        
        x1 = random( 50, width - 50 );
        y1 = random( 50, width - 50 );
        sz1 = 40;
        dy1 = random( 16, 20 );
        
        x2 = random( 50, width - 50 );
        y2 = height*.85;
        sz2 = 40;
        dx2 = random( 5, 20 );
   
    }  
}


void prepScreen()
{
  image( bg, width/2,height/2,width,height);
}

void drawBanana()
{
  image(img1, x1,y1);
}

void moveBanana()
{
  //x1 = random(0, width-20);
  y1 += dy1;
   if ( y1 > height ) 
   {x1= random (10, width-50);
   
   y1 = 0;} 
}

void drawGorilla()
{
  image(img2, x2,y2);
}

void moveGorilla()
{
  x2 += dx2;
   if ( x2 > width-150 || x2 < 0 )
   { 
     //s1.play( );
     //s1.rewind( ); 
     dx2 = -dx2; 
    x2 += dx2; 
   }     
}

void keyPressed()
{
  if ( key == LEFT)
  {
    dx2 += 1;
  }
    
  else if ( key == RIGHT)
  {
    dx2 -= 1;
  }
}



