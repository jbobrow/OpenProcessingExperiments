
// Project #2 :: 51-257 Sec A :: Michael Loffredo :: mlloffre
// copyright michael loffredo 2012 

// Code adapted partly from class demonstrations by John Gruen

//////////////// INSTRUCTIONS //////////////////////////////

// As the sphere and cube hit each wall of the screen, they increase the granularity of the video image being captured at the back of the window
// To reset the granularity back to its original setting and to change the speed at which the sphere and cube are moving, press the spacebar

//first time trying 3D shapes!


import processing.video.*;

Capture video;


float sx, sy, sz;
float x, y, z, d;
float p;

int limited;
float r, g, b;
float r2, g2, b2;
int gran=30;
int th =500;





void setup () 
{
  
  size (400, 400, P3D);
  video = new Capture(this, width, height, 15);
  sx = random (0, 10); 
  sy = random (0, 10); 
  sz = random (0, 10);
  
  x = width/2;
  y = height/2;     
  z = 0;
  d = 100;
  
  p = 2;
 
 
}

void draw () 
{
  background(0);
  video.read();
  video.loadPixels();
  gran = (limited/8) + 10;
  for(int x = 0; x < video.width; x+=gran/2) 
  {
    for(int y=0; y < video.height; y+=gran) 
    {
      int i = video.width*y + x;
      color target = video.pixels[i];
      float z = -200;
      r = red(target);
      g = green(target);
      b = blue(target);
      int halfG = int(gran/2);
      if (th > dist(r, g, b, r2, g2, b2)) {
        fill(target); 
      pushMatrix();
        translate (x, y, z);
        noStroke();
        ellipse (0, 0, gran, gran);
      popMatrix();
      }
    }
  }
  
  
  drawBox();
  drawSphere();
   moveShapes ();
  
 
}


void drawBox ()
{
  translate (x, y, z);
  lights();
  noStroke();
  fill (252, 165, 76);
  box (d);
}



void drawSphere ()
{
  noFill();
  lights();
  stroke(73, 225, 232, 150);
  sphere (d);

}

void moveShapes ()
{
  x = x + sx; 
  if (x > width || x < 0)
  {
    limited =  int(constrain( x , p=p+8, p = p+8) );
    sx = -sx;
   
  
  }
 
 y = y + sy;
 if (y > height || y < 0)
 {
   sy = -sy;
   limited =  int(constrain( x , p=p+8, p = p+8) );
 }
 
 z = z + sz;
 if (z > 0 || z < -200)
 {
   sz = -sz;
   
 }
}

void keyPressed ()
{
  if (key == ' ') {
    p =2;
   sx = random (0, 10); 
  sy = random (0, 10); 
  sz = random (0, 10);
  }
}











