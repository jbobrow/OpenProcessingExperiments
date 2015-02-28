
//  Annie Ranttila
//  Carnegie Mellon University, Programming for the Arts
//  Sound effects from "http://www.freesound.org/people/PaulMorek/sounds/196725/" and "http://www.freesound.org/people/AGFX/sounds/43382/"
//  Reproduction of the following code without consent is prohibited


import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

float x1,y1, sz1, dx1, dy1;
float x2, y2, y3, y4, y5, sz2, dy2, dy3, dy4, dy5;
color col1, col2;
PImage img, img2, img3, img4, img5;

//Minim m;
//AudioPlayer s1, s2;

int hits;
int lastCollisionTime;

void setup( )
{
  size( 500, 500 );
//  
//  m = new Minim( this );
//  s1 = m.loadFile( "rooster.wav" );
//  s2 = m.loadFile( "hit.wav" );
  
        x1 = width/6;
        y1 = random( 50, width - 50 );
        sz1 = random( 20, 50 );
        dx1 = width/6;
        dy1 = 1;
        col1 = color( random( 255 ), random( 255 ), random( 255 ) );
      
        x2 = random( 50, width - 50 );
        y2 = random( 50, width - 50 );
        y3 = random( 50, width - 50 );
        y4 = random( 50, width - 50 );
        y5 = random( 50, width - 50 );
        sz2 = random( 20, 50 );
        dy2 = random( 5,10 );
        dy3 = random( 5,10 );
        dy4 = random( 5,10 );
        dy5 = random( 5,10 );
        col2 = color( random( 255 ), random( 255 ), random( 255 ) );  
  
  img3 = loadImage("Chicken.png");
  img2 = loadImage("Chicken2.png");
  img = loadImage("car.png");
  img4 = loadImage("roast.png");
  img5 = loadImage("carup.png");
  
  hits = 0;
  lastCollisionTime = 0;
  rectMode( CENTER );
  smooth( );
  noStroke( ); 
}

void draw( )
{
//  saveFrame("frames/####.tif");
    prepWindow( );
    moveChicken();
    drawChicken1( );
    moveCar( );
    drawCar( );
    moveCar2( );
    drawCar2( );
    moveCar3( );
    drawCar3( );
    moveCar4( );
    drawCar4( );
    checkCollision( );
    showTime( );
    showStats( );
    checkGameover();
} 

//void stop( )
//{
//s1.close( );
//s2.close( );
//m.stop( );
//super.stop( ); 
//}

void showStats( )
{
   fill( 255, 255, 0 );
   textAlign(CENTER);
   text( "Hits: " + hits, width/2, height*.2);                  
}

void showTime( )
{
   fill( 255 );
   textSize(10);
   textAlign (CENTER);
   text( "Time: " + millis( )/1000, width/2, height*.1 );
   int collisionLapsedTime = (millis( ) - lastCollisionTime)/1000;
   text( "Time since last collision: " + collisionLapsedTime,
            width/2, height*.15 );
}

void checkCollision( )
{
  float d1 = dist(x1, y1, 1.5*width/6, y2);
  float d2 = dist(x1, y1, 2.5*width/6, y3);
  float d3 = dist(x1, y1, 3.5*width/6, y4);
  float d4 = dist(x1, y1, 4.5*width/6, y5);
  float colDist = sz1/2 + sz2/2;
  if (d1< (sz1/2 + sz2/2))
  {
//    s2.play( );
//    s2.rewind( );
    hits++;
    lastCollisionTime = millis( );
    fill (255,0,0);
    rectMode(CENTER);
    noStroke();
    rect(width/2, height/2, width, height);
    fill(0,0,0);
    textSize( 50 );
    textAlign( CENTER );
    text ("WINNER WINNER", width*.5, height - 400 );
    text("CHICKEN DINNER", width*.5, height-100);
    imageMode(CENTER);
    image(img4,width/2,height/2,width/3,width/3);   
    x1 = width/6;
        y1 = random( 50, width - 50 );
        sz1 = random( 20, 50 );
        dx1 = width/6;
        dy1 = 1;
        col1 = color( random( 255 ), random( 255 ), random( 255 ) );
  }
  else if (d2< (sz1/2 + sz2/2))
  {
//    s2.play( );
//    s2.rewind( );
    hits++;
    lastCollisionTime = millis( );
    fill (255,0,0);
    rectMode(CENTER);
    noStroke();
    rect(width/2, height/2, width, height);
    fill(0,0,0);
    textSize( 50 );
    textAlign( CENTER );
    text ("WINNER WINNER", width*.5, height - 400 );
    text("CHICKEN DINNER", width*.5, height-100);
    imageMode(CENTER);
    image(img4,width/2,height/2,width/3,width/3);   
    x1 = width/6;
        y1 = random( 50, width - 50 );
        sz1 = random( 20, 50 );
        dx1 = width/6;
        dy1 = 1;
        col1 = color( random( 255 ), random( 255 ), random( 255 ) );
  }
  
    else if (d3< (sz1/2 + sz2/2))
  {
//    s2.play( );
//    s2.rewind( );
    hits++;
    lastCollisionTime = millis( );
    fill (255,0,0);
    rectMode(CENTER);
    noStroke();
    rect(width/2, height/2, width, height);
    fill(0,0,0);
    textSize( 50 );
    textAlign( CENTER );
    text ("WINNER WINNER", width*.5, height - 400 );
    text("CHICKEN DINNER", width*.5, height-100);
    imageMode(CENTER);
    image(img4,width/2,height/2,width/3,width/3);  
   x1 = width/6;
        y1 = random( 50, width - 50 );
        sz1 = random( 20, 50 );
        dx1 = width/6;
        dy1 = 1;
        col1 = color( random( 255 ), random( 255 ), random( 255 ) ); 
  }
  
    else if (d4< (sz1/2 + sz2/2))
  {
//    s2.play( );
//    s2.rewind( );
    hits++;
    lastCollisionTime = millis( );
    fill (255,0,0);
    rectMode(CENTER);
    noStroke();
    rect(width/2, height/2, width, height);
    fill(0,0,0);
    textSize( 50 );
    textAlign( CENTER );
    text ("WINNER WINNER", width*.5, height - 400 );
    text("CHICKEN DINNER", width*.5, height-100);
    imageMode(CENTER);
    image(img4,width/2,height/2,width/3,width/3);   
    x1 = width/6;
        y1 = random( 50, width - 50 );
        sz1 = random( 20, 50 );
        dx1 = width/6;
        dy1 = 1;
        col1 = color( random( 255 ), random( 255 ), random( 255 ) );
  }
}


void moveChicken( )
{
   y1 += dy1;
   if ( y1 > height || y1 < 0 )
   { 
     dy1 = -dy1; 
   }   
}

void moveCar( )
{
   y2 += dy2;
   if ( y2 > height ) y2 = 0; 
}

void moveCar2( )
{
   y3 += dy3;
   if ( y3 > height ) y3 = 0; 
}

void moveCar3( )
{
   y4 -= dy4;
   if ( y4 < 0 ) y4 = height; 
}

void moveCar4( )
{
   y5 -= dy5;
   if ( y5 < 0 ) y5 = height; 
}

void drawCar( )
{
  imageMode(CENTER);
  image(img,1.5*width/6,y2-random(40,50),width/10,height/5);
}

void drawCar2( )
{
  imageMode(CENTER);
  image(img,2.5*width/6,y3 -random(40,50),width/10,height/5);
}

void drawCar3( )
{
  imageMode(CENTER);
  image(img5,3.5*width/6,y4,width/10,height/5);
}

void drawCar4( )
{
  imageMode(CENTER);
  image(img5,4.5*width/6,y5,width/10,height/5);
}

void drawChicken1( )
{
   imageMode(CENTER);
  image(img2,x1,y1,width/7,height/7);
}

void drawChicken2( )
{
   imageMode(CENTER);
  image(img3, x1,y1,width/7,height/7);
}

void prepWindow( )
{
   fill( 39, 131, 21 );
   rect( width/2, height/2, width, height ); 
   stroke(0,0,0);
   strokeWeight(2);
  fill(155,155,155);
   rect(1.5*width/6, height/2, width/7, height);
   rect(2.5*width/6, height/2, width/7, height);
   rect(3.5*width/6, height/2, width/7, height);
   rect(4.5*width/6, height/2, width/7, height);
}

void keyPressed()
{
  if (key == CODED);
  {
    if (keyCode == UP) 
    {
      y1=y1+5;
  }
  else if(keyCode == DOWN) 
  {
  y1=y1-5;
}
  else if(keyCode == RIGHT) 
{
x1=x1+10;
}
  else if(keyCode == LEFT) 
{
x1 = x1-10;
}
else if (keyCode == ENTER)
{
  dy2++;
  dy3++;
  dy4++;
  dy5++;
}
else if (keyCode==TAB)
{
  dy2--;
  dy3--;
  dy4--;
  dy5--;

}
  }}
  
void checkGameover()
{

if (x1 > 5*width/6)
{
  fill(random(255), random(255), random(255));
//  s1.play( );
  
frameRate(20);
rect(width/2, height/2, width, height);
  textSize( 50 );
  fill(255,255,255);
    textAlign( CENTER );
    text ("HAPPY CHICKEN", width*.5, height - 400 );
  image(img3, width/2, height/2, width/2, height/2);
}
} 





