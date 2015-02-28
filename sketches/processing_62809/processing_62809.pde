
import processing.opengl.*;

import processing.video.*;

int cellsize = 10;
int cols, rows;

Capture video;


void setup()
{
  size(960, 720, P3D);
  frameRate(30);

  cols = width/cellsize;
  rows = height/cellsize;
  colorMode(RGB, 255, 255, 255, 100);
  smooth();

  video = new Capture(this, 960, 720);
  // video.start();

  background(0);
}


void captureEvent(Capture camera)
{
  video.read();
}

void draw()
{ 
  for ( int i = 0; i < cols;i++) {
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize;
      int y = j*cellsize;
      int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image
      color c = video.pixels[loc];
      
      float r = red(video.pixels[loc]);
      float g = green(video.pixels[loc]);
      float b = blue(video.pixels[loc]);

      ellipseMode(CENTER);
      fill(r,g,b);
      //noStroke();
      float p = random(0, 20);
      float s = random(0, 5);
      ellipse(x+s,y+s,p,p);
    }
  }
}


