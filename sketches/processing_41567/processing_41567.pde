
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioOutput out;
SineWave sine;

float y;

float n;
float theta = 0;
PGraphics pg;

float phase = 0;

void setup() {
 size(700, 400);
 background(0); 
// frameRate(10);

 pg = createGraphics(700, 400, P3D);
 pg.beginDraw();
 pg.background(0);

 pg.endDraw();
 
 m = new Minim(this);
  out = m.getLineOut(Minim.STEREO);
sine = new SineWave(100, 0.5, out.sampleRate());
  out.addSignal(sine);
    sine.portamento(30);
    
    colorMode(HSB);
// tone = m.loadFile("tone.wav");
}

void draw() {
  
  float freq = map(y + sin(phase)*10, -10, height+10, 60, 600);
  sine.setFreq(freq);
 
  pg.beginDraw();
  pg.noStroke();
  pg.fill(0, 0, 0, 1.01);
  pg.rect(0, 0, width, height);
  pg.pushMatrix();
  pg.translate(width/2, height/2); 
  theta = n*PI/100;
  pg.rotate(-theta);
  
   
  pg.stroke( map(y + sin(phase)*10, -10, height+10, 0, 255),200,100);
  pg.strokeWeight(5);
  pg.line(0, 0, 0, -y/2 + sin(phase)*10);
  pg.popMatrix();
  
  pg.endDraw();
  
  phase = phase+mouseX/500.0;
  
 
  
  y = y+(mouseY-y)/15.0;
  
  pushMatrix();
  translate(width/2, height/2); 
  rotate(theta);
  translate(-width/2, -height/2); 
  image(pg, 0, 0);
  popMatrix();
  
   n = n + 1;
 
 
   // playTone();
   
  /*translate
    rotate
    pushMatrix
    popMatrix
    PGraphics
  */
}


