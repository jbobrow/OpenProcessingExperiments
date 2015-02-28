
import ddf.minim.*;

Minim minim;
AudioInput in;

import processing.opengl.*;
import processing.video.*;
int cellsize = 10;
int cols, rows;
Capture video;


void setup()
{
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
  size(960, 720, P2D);
  frameRate(30);

  cols = width/cellsize;
  rows = height/cellsize;
  colorMode(RGB, 255, 255, 255, 100);
  smooth();

  video = new Capture(this, 960, 720);

  background(0);
}


void captureEvent(Capture camera)
{
  video.read();
}

void draw()
{
  for (int k = 0; k < in.bufferSize() - 1; k++) {
    for ( int i = 0; i < cols;i++) {
      for ( int j = 0; j < rows;j++) {
        int x = i*cellsize;
        int y = j*cellsize;
        int loc = (video.width - x - 1) + y*video.width; 
        color c = video.pixels[loc];

        float r = red(video.pixels[loc]);
        float g = green(video.pixels[loc]);
        float b = blue(video.pixels[loc]);

        ellipseMode(CENTER);
        fill(r, g, b);
        //noStroke();
        float p = (4);
        float s = (1);
        int inputSnd = int(10 + in.left.get(k)*50);
        ellipse(x+s, y+s, inputSnd, inputSnd);
      }
    }
  }
}

