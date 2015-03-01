
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
PImage mstart;
PImage m0;
PImage m1;
PImage m2;
PImage m3;
PImage m4;
PImage m5;
PImage m6;


Minim minim = new Minim(this);
AudioInput in;


void setup() {
  size(1344, 840);
  noCursor();
  mstart = loadImage("test.png");
  m0 = loadImage("mouths0.png");
  m1 = loadImage("mouths1.png");
  m2 = loadImage("mouths2.png");
  m3 = loadImage("mouths3.png");
  m4 = loadImage("mouths4.png");
  m5 = loadImage("mouths5.png");
  m6 = loadImage("mouths5.png");
  in = minim.getLineIn(Minim.STEREO, 2048);
  background(8,10,9);
}

void draw() {
  float sum = 0;
  for (int i = 0; i < in.bufferSize(); i++) {
    sum += abs(in.left.get(i)) * 100;
  }
  float ave = sum / in.bufferSize();
  
  
  if (ave <= .25) {
    image(m0, width/2 - 190, 0);
  }
  
  else if (ave > .25 & ave <= 1) {
    image(m1, width/2 - 190, 0);
  }
  
  else if (ave > 1 & ave <= 4) {
    image(m2, width/2 - 190, 0);
  }
  
  else if (ave > 4 & ave <= 8) {
    image(m3, width/2 - 190, 0);
  }
  
  else if (ave > 8 & ave <= 13) {
    image(m4, width/2 - 190, 0);
  }
  
  else if (ave > 13 & ave <= 20) {
    image(m5, width/2 - 190, 0);
  }
  
  else if (ave > 20) {
    image(m4, width/2 - 190, 0);
  }
    
  
  
 println(ave);
  /*
  if (ave > .25) // 
  */
  
  //from my earlier sketch
}


