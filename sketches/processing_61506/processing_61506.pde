
// Project #1 :: 51-257 Sec A :: Michael Loffredo :: mlloffre
// copyright michael loffredo 2012 

// Code adapted partly from Daniel Shiffman's book "Learning Processing" & class demonstrations by John Gruen
// slider code adapted from Jim Roberts 

//////////////// INSTRUCTIONS //////////////////////////////

// Use the corresponding arrow keys to rotate the video image three-dimensionally, up, down, left or right
// The "up" arrow key rotates the screen so that the top of the screen comes forward, the "left" arrow key rotates the screen left, etc. 
// Move the slider (by clicking and dragging the mouse) to the right to decrease the granularity as well as move the 2D video into 3D

///// DESCRIPTION ////// 

// The video image becomes 3D based on the brightness of the recording. The brighter colors of the image move forward in space, while the darker ones sink back 
// I coded it so that the slider stays fixed rather than rotating with the rest of the image, and also coded it so that it always remains as the farthest object in the front, or in other words no color value is bright enough to move in front of the slider
// I've also coded it so that all rotations are from the center rather than the upper left hand corner 

import processing.video.*;
Capture video;


int gran = 30;
int th = 500;
color videoColor;

 
float rX, rZ; 

float r, g, b;
float r2, g2, b2;

int threshHold;
int sliderX, sliderY, sliderWidth, sliderHeight;


void setup()
{
   size( 600, 750, P3D );
   video = new Capture( this, width, height, 15 ); 
   noStroke (); 
   
   
   
   sliderX = 20;
   sliderY = height-50;
   sliderWidth = width - sliderX*2;
   sliderHeight = 10;
   
   threshHold = 0;
   
 
}

void draw( )
{
  background( 0 );
  video.read( );

  video.loadPixels();
  gran = (threshHold/8) + 10;
  for(int x = 0; x < video.width; x+=gran/2) 
  {
    for(int y=0; y < video.height; y+=gran) 
    {
      int i = video.width*y + x;
      color target = video.pixels[i];
      float z = (threshHold/255.)*(brightness (video.pixels[i])-100.0);
      r = red(target);
      g = green(target);
      b = blue(target);
      int halfG = int(gran/2);
      if (th > dist(r, g, b, r2, g2, b2)) {
        fill(target); 
      pushMatrix();
        
       translate(width/2,0,0);
       translate(0,height/2,0);
       rotateX(rX);
        rotateZ(rZ);
       translate(-width/2,0,0);
       translate(0,-height/2,0);
        translate (x, y, z);
        if(x%gran == 0)
         {
           triangle(0,halfG,halfG,-halfG,-halfG,-halfG);
         }
        else
         { 
           triangle(0,-halfG,-halfG,halfG,halfG,halfG);
         }
      popMatrix();
      }
    }
  }
  
 
  drawSlider ();
  keyControls ();
  
  
}



void drawSlider( )
{
  pushMatrix();
       translate(width/2,0,0);
       translate(0,height/2,0);
       scale(.10);
       translate(-width/2,0,0);
       translate(0,-height/2,0);
       
       translate(0,0,5800);

   fill(255,100,threshHold);
   rect( sliderX, sliderY, sliderWidth, sliderHeight); 
   int barX = int( map( threshHold, 0, 255, sliderX, sliderX+sliderWidth) );
   
   ellipse( barX, sliderY+sliderHeight/2, 40, 40);
   fill( 0 );
   popMatrix();
   
}
void mouseDragged( )
{
   threshHold =  int(constrain( map( mouseX, sliderX, sliderX + sliderWidth, -1, 256 ) , 0, 255) );
   
}

void keyControls() { 
  {
    if (keyPressed)
      if (keyCode == DOWN) {
        rX += PI/100;
      } 
      else if (keyCode == UP) {
        rX -= PI/100;
      } 
      else if (keyCode == RIGHT) {
        rZ += PI/100;
      } 
      else if (keyCode == LEFT) {
        rZ -= PI/100;
      } 
  }
}







