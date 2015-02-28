
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioOutput out;
SineWave sine;
SineWave sine2;

float y;
float x;

float n;
float theta = 0;
PGraphics pg;

float phase = 0;
float phasevar;

void setup() {
 size(700, 400);
 background(0); 

 pg = createGraphics(700, 410, P3D);
 pg.beginDraw();
 pg.background(0);

 pg.endDraw();
 
 m = new Minim(this);
  out = m.getLineOut(Minim.STEREO);
sine = new SineWave(150, 0.5, out.sampleRate());
sine2 = new SineWave(50, 1, out.sampleRate());
  out.addSignal(sine);
  out.addSignal(sine2);
    sine.portamento(80);
    sine2.portamento(20);
    

}

void draw() {
  
  float freq = map(y + sin(phase)*10, -10, height + 10, 60, 600);
  float freq2 = map(y + sin(phase)*10, -10, height + 10, 60, 600);
  sine.setFreq(freq/1.5);
  sine2.setFreq(freq2/3.5);
  
  pg.beginDraw();
  pg.noStroke();
  pg.fill(0, 0, 0, 0.5);
  pg.rect(0, 0, width, (height + 10));
  pg.pushMatrix();
  pg.translate(width/2, (height/2+5)); 
  theta = n*PI/180;
  pg.rotate(-theta);
  
   
  pg.stroke(255);
  pg.strokeWeight(5);
  pg.line(0, 0, 0, -y/2 + sin(phase)*10);
  
  pg.stroke(255);
  pg.strokeWeight(3);
  pg.line(0, 0, 0, y/3 + sin(phase)*8); 
  pg.popMatrix();
  
  pg.endDraw();
  
  
  

  phase = phase+phasevar/500.0;
    
  if(phase <= 0){
    phasevar = 0;    
  }
  
  phase = constrain(phase, 0, 200);
      
    
  if(!mousePressed){
    y = y+((mouseY-y)/15.0);
    phasevar = phasevar + 0;
    phase = phase + 0;
  }else if (mouseButton == LEFT){
     phasevar = phasevar +  5;
     }
      else if (mouseButton == RIGHT){
     phasevar = phasevar -  5;
     }
  
  
  
 
  pushMatrix();
  translate(width/2, height/2); 
  rotate(theta);
  translate(-width/2, -height/2); 
  image(pg, 0, 0);
  popMatrix();
  
   n = n + 1;
   
}

void keyPressed(){
   
    setup();
    phasevar = 0;
    phase = 0;
  
}

/*void mousePressed(){
    if(mouseButton == LEFT){
    phasevar = phasevar +  (mouseY-width/2)/550.0;
     }
      else if (mouseButton == RIGHT){
     phasevar = phasevar -  (mouseY-width/2)/550;
     }
  
}



  /*translate
    rotate
    pushMatrix
    popMatrix
    PGraphics
    Polyphonic sound
    drag interaction
    layer
    rightclick action?
  */

