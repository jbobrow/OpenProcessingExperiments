
import processing.video.*;

int cellsize = 5;
int cols, rows;

Capture video;


void setup()
{
  size(320, 240,P3D);
  frameRate(30);
  
  cols = width/cellsize;
  rows = height/cellsize;
  colorMode(RGB, 255, 255, 255, 100);
  smooth();

  video = new Capture(this, 320, 240);
  //video.start();
  
  background(0);
}


void captureEvent(Capture camera)
{
  video.read();
}

void draw()
{ 
   fill(255,50,50);
  float  cellsize= 2.0 + (mouseX / (float) width) * 16.0;
  for ( int i = 0; i < cols;i++) {
    for ( int j = 0; j < rows;j++) {
      
  int x = int(random(video.width));
  int y = int(random(video.height));
      int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image
      color c = video.pixels[loc];
      
  float r = red(video.pixels[loc]);
  float g = green(video.pixels[loc]);
  float b = blue(video.pixels[loc]);
      
      ellipseMode(CENTER);
      fill(g,b,r/2);
      noStroke();
      ellipse(x, y, cellsize, cellsize);
    }
  }
}


