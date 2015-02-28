
//www.openprocessing.org/visuals/?visualID=16119
//processing.org/learning/basics/distance2d.html
//code.compartmental.net/tools/minim/manual-oscillator/

////////////////////////////////////////////////////////////////
////////////////////////By Chirs Pitt///////////////////////////
////////////////////////////////////////////////////////////////
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
SineWave sine;

float distanceFrequency;
float distanceRotate;
float s;
int x;
int y;
float mx;
float my;
float p;

void setup() {
  size(500, 500);
  smooth(); 
  s=1;
  p=0;
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.7, out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);
}




void draw() {
  
  fill(255, 10);
  noStroke();
  rect(0,0,width,height);
    
  s=random(300,500);
  float freq = map(700 + p, 0, 800 + p, distanceFrequency, 250 + p);
  sine.setFreq(freq);

  x=width/2;
  y=height/2;
  mx=mouseX;
  my=mouseY;
  
  while(mx==0){
    mx=width/2;
    my=height/2;
    x=1;
    y=1;
  }

  distanceFrequency = dist(x, y, mouseX, mouseY) * 3 + 100;
  distanceRotate = dist(x, y, mouseX, mouseY)/250 + distanceRotate;
  translate(mx, my);
  rotate(distanceRotate);
  renderShape();
}
 
void renderShape() {
  fill(0,0,255);
  triangle(0, 0, 15, 75, 120, 152);
}

