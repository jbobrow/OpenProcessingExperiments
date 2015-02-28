
// **Created by Aparna J. Nambiar
//Displays moving circles

import processing.video.*;
MovieMaker mm;

int bColor = 0; //background color

int currentStroke=255;
int centerx,centery;
int radius=1;
int direction = +1;
void setup()
{
  //initialize the screen
  screenWidth=500;
  screenHeight=300;
  size(screenWidth, screenHeight);
  background(bColor);
  smooth();
  noFill();
  //initialize random points
  centerx = (int) random(0,screenWidth);
  
  centery = (int) random(0,screenHeight);
  
//  length2 = Math.pow(x2-x1,2)+Math.pow(y2-y1,2);
  stroke(255);
  ellipse(centerx,centery,radius,radius);
  mm = new MovieMaker(this, width, height, "movingCircle.mov", 30, MovieMaker.ANIMATION, MovieMaker.LOSSLESS);

 
}

void draw()
{
  int x = (int) random(0, radius);
//  x=centerx + (x * ((int)random(0,2)*2-1)); 
x= centerx + (x * direction);
  //midpoint +- something less than length
  if(x<0 ||x >screenWidth){
    x= (x-centerx) *-1 +centerx ; 
  } // ensure that selected point is within bounds
  double y2 =  radius *radius - Math.pow(x-centerx,2);
  int y = (int) ((Math.sqrt(y2)* ((int)random(0,2)*2-1))+centery);
  if(y<0 ||y >screenHeight){
   y= (y-centery) *-1 +centery ;
 }
   centerx = x;
   centery=y;fill(255);
   ellipse(centerx,centery,radius,radius);
    radius +=direction;
   if(frameCount%50 ==0){
      direction*=-1;
   }
   if (frameCount%180==0){
     background(0);
   }
   delay(100);
   
  mm.addFrame();
   
}



