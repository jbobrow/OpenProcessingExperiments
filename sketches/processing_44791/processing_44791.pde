
//Code borrowed from David Zwarg
//http://www.openprocessing.org/visuals/?visualID=9036

import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
PImage img;
Spark[][] sparks;
int idx;
int n=0;
 
void setup(){
  size(800, 600, P3D);
  noStroke();
  img = loadImage("IMG_2256.jpg");
  minim = new Minim(this);
  mySound = minim.loadFile("volt.mp3");
  mySound.play();
  mySound.loop();
  sparks = new Spark[width][];
  idx = 0;
  background(img);
}

void draw(){
 image(img,0,0);
  fill(255);

for(int i = 0; i < mySound.bufferSize() - 1; i++)  {
  }
  n++;

// draw all sparks
  for (int i=0;i<sparks.length;i++) {
    if (sparks[i] != null) {
      for (int j=0;j<sparks[i].length;j++)
        sparks[i][j].draw();
    }
  }
}
 
void mouseDragged() {
  // create a new set of sparks for the current position
  sparks[idx] = new Spark[50];
  for (int i=0;i<sparks[idx].length;i++) {
     sparks[idx][i] = new Spark(mouseX, mouseY, pmouseX, pmouseY);
  }
  // increment the count of sparks
  idx = (idx + 1) % sparks.length;
}
 
class Spark {
  color from = color(#FDFCDC);
  color to = color(#8B8378,0);
  // position
  float x, y;
  // velocity
  float u, v;
  // intensity
  float i;
  // age
  int age;
   
  public Spark(int mX, int mY, int pX, int pY) {
    i = random(sqrt((mX-pX)*(mX-pX)+(mY-pY)*(mY-pY)));
    x = (mX + pX) / 2;
    y = (mY + pY) / 2;
    // random dir for sparks
    u = random(-10,10);
    v = random(-10,10);
  }
     
  public void draw() {
    float x1 = i * cos(u);
    float y1 = i * sin(v) + 0.05 * age * i;
    // if the position won't move by 1 px or more, don't draw
    if ( x1 < 1 && y1 < 1 )
      return;
    // if the spark is too old, don't draw
    if ( age > 100 )
      return;
       
    color lerped = lerpColor(from,to, age/100f);
    stroke(lerped);
    beginShape(LINES);
    vertex((int)x,(int)y);
 
    // the next x coordinate
    x += x1;
    y += y1;
    i *= 0.99;
     
    vertex((int)x,(int)y);
    endShape();
 
    // age a little
    age++;
  }

}
 


 
void stop(){

  minim.stop();
  super.stop();
}

