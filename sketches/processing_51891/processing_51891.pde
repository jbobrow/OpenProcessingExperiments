
/*
HAHA this is the first time im writing some shit up here above the code to make it seem
important and official. Anyway here goes.

This is based on the toxi library and some code stolen off the opengl examples to create the 
lines (also the idea about using HSB colours. Haha open source rules I can steal code and 
its completely fine. Ya and if you steal my code il sue your sorry ass. 


*/
import processing.opengl.*;

import ddf.minim.*;
import ddf.minim.analysis.*;

import toxi.geom.*;
import toxi.processing.*;

int NUM_STRIPS = 80;
// number of points per strip
int NUM_POINTS = 100;
// vertical gap between strips
int GAP = 10;

// scale factor for elevation
float ELEVATION_SCALE=10;
// scale factor for mapping elevation to hues
float HUE_SCALE=0.0025;
// hue offset (basically hue at elevation=0)
float HUE_OFFSET=0.5;


Minim audio;
AudioInput in;
FFT fft;

// a list to hold our line strips
ArrayList<LineStrip3D> strips=new ArrayList<LineStrip3D>();

// helper class for drawing
ToxiclibsSupport gfx;

void setup() {
  size(1280, 720, OPENGL);
  enableVSync();
  
  gfx=new ToxiclibsSupport(this);
  
  audio=new Minim(this);
  in = audio.getLineIn(Minim.STEREO, 512);
  
  // FFT = Fast Fourier Transformation
  // turns wave form into frequency spectrum so easy
  fft = new FFT(in.bufferSize(), in.sampleRate());

 initStrips();
}

void draw() {
  background(0);
  strokeWeight(2);
  noFill();

  translate(width/2,height/2,0);
  rotateX(mouseY*0.006);
  rotateY(mouseX*0.006);
  colorMode(HSB, 1.0);

  // transform current wave form into frequency spectrum
  fft.forward(in.mix);

  // how many frequency bands per strip
  float stripsToBandsRatio=(float)fft.specSize()/strips.size();

  // shift all points within strip to the left
  // by copying the Y coordinates of each point
  // to the one on its left (start at 2nd point, i=1)
  for (int i=0; i<strips.size(); i++) {
    LineStrip3D strip = strips.get(i);
    List<Vec3D> verts=strip.getVertices();
    for (int j=1; j<NUM_POINTS; j++) {
      verts.get(j-1).y=verts.get(j).y;
    }

    // get the energy of the strip's related frequency band
    float elevation=fft.getBand((int)(i*stripsToBandsRatio))*ELEVATION_SCALE;
    // update the Y coordinate of the last point in each strip
    verts.get(NUM_POINTS-1).y=elevation;

    // iterate over all points within each strip
    // and map elevation to color hue, draw as line strip
    beginShape();
    for (Vec3D p : strip) {
      // map elevation to hue
      stroke(p.y*HUE_SCALE+HUE_OFFSET, 1.0, 1.0);
      vertex(p.x, p.y, p.z);
    }
    endShape();
  }
}

void initStrips() {
  // first compute horizontal spacing between points
  float scaleF=(float)width/(NUM_POINTS-1);
  
  Vec3D offset=new Vec3D(width/2,0,(NUM_STRIPS*GAP)/2);
  
  // now use double nested loop to create all strips...
  for (int j=0; j<NUM_STRIPS; j++) {
    LineStrip3D strip=new LineStrip3D();
    for (int i=0; i<NUM_POINTS; i++) {
      strip.add(new Vec3D(i*scaleF, 0, j*GAP).sub(offset));
    }
    strips.add(strip);
  }
}

// configures OpenGL to synchronize the frame
// drawing with the actual screen updates on the hardware side
// (this should be done automatically by Processing, but isn't...)
void enableVSync() {
  PGraphicsOpenGL pgl = (PGraphicsOpenGL) g;
  javax.media.opengl.GL gl = pgl.beginGL();
  gl.setSwapInterval(1);
  pgl.endGL();
}

