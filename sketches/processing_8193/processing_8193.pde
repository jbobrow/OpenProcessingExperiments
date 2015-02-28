

import ddf.minim.*;
import ddf.minim.signals.*;
import codeanticode.protablet.*;

Tablet tablet;

Minim minim;
AudioOutput out;
SineWave sine;
SawWave saw;
//for modulator // float j = 0;

void setup()
{  
  size(1008, 504);
  smooth();
  background(255);
  frameRate(100);
  measures();
  cursor(CROSS);
  
  tablet = new Tablet(this); 
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  
  sine = new SineWave(440, 0, out.sampleRate());
  sine.setAmp(0);
  sine.noPortamento(); 
  out.addSignal(sine);
  
  saw = new SawWave(440, 0, out.sampleRate());
  saw.setAmp(0);
  saw.noPortamento();
  out.addSignal(saw); 
}


void draw()
{
  if (mousePressed) {

    float pX = (sq(map(constrain(mouseY,0,height),0,height,0,1)))*(30*noise(pmouseX));
    float pY = (sq(map(constrain(mouseY,0,height),0,height,0,1)))*(30*noise(pmouseY));
    float X = (sq(map(constrain(mouseY,0,height),0,height,0,1)))*(30*noise(mouseX));
    float Y = (sq(map(constrain(mouseY,0,height),0,height,0,1)))*(30*noise(mouseY));

    strokeWeight(20 * tablet.getPressure());
    stroke(0);
    line(pmouseX+pX, pmouseY+pY, mouseX+X, mouseY+Y);
  
    float col = ((tablet.getPressure()) - (random(tablet.getPressure()/8 , tablet.getPressure()))/2);    
    
    stroke( 255*col , random(10)*col , random(100)*col , 200*(tablet.getPressure()));
    fill(255);
    ellipse(mouseX+X,mouseY+Y,20 * tablet.getPressure(),20 * tablet.getPressure());
  
    port();
    frequency();
    amplify();
  }
  
  keys();
}


void port(){
  sine.portamento(200);
  saw.portamento(200);
}

void frequency(){
  float freq = 27.5*(pow(2,map(constrain(mouseX,0,width), 0, width, 0, 6)));
  sine.setFreq(freq);
  saw.setFreq(freq);
}  

void amplify(){
  float amp = sq(map(constrain(mouseY,0,height),0,width,0,1));
  sine.setAmp((1-amp)*tablet.getPressure());
  saw.setAmp(amp*tablet.getPressure());
  
/*  float mod = sq(sin(j/1));
  j += tablet.getPressure();
  sine.setAmp((1-amp)*mod);
  saw.setAmp(amp*mod);
*/

}

void mouseReleased()
{
  sine.setAmp(0);
  saw.setAmp(0);
}


void keys()
{
  if(keyPressed == true) {
    if (key == 's' || key == 'S') {
      save("img."+int(random(1000,10000))+".png");
    } 
    if (key == 'c' || key == 'C') {
      background(255);
    } 
    if (key == 'x' || key == 'X'){
      measures();
    }      
    else {
      fill(255,15);
      noStroke();
      rect(0,0,width,height);
    }          
  } 
}


void measures() 
{
  for (int i = 0; i < width; i = i+width/6) {
    stroke(240);
    strokeWeight(9);
    line(i+(3*(width/72)),0,i+(3*(width/72)),height);
  }  

  strokeWeight(1);
 
  for (int i = 0; i < width; i = i+width/72) {
    stroke(210);
    line(i,0,i,height);
  }  

  for (int i = 2*(width/72); i < width; i = i+width/6) {
    stroke(128);
    line(i,height-60,i,height);
  }
  for (int i = 3*(width/72); i < width; i = i+width/6) {
    stroke(128);
    line(i,height-60,i,height);
  }
  for (int i = 5*(width/72); i < width; i = i+width/6) {
    stroke(128);
    line(i,height-60,i,height);
  }
  for (int i = 7*(width/72); i < width; i = i+width/6) {
    stroke(128);
    line(i,height-60,i,height);
  }
  for (int i = 8*(width/72); i < width; i = i+width/6) {
    stroke(128);
    line(i,height-60,i,height);
  }
  for (int i = 10*(width/72); i < width; i = i+width/6) {
    stroke(128);
    line(i,height-60,i,height);
  }
  for (int i = 12*(width/72); i < width; i = i+width/6) {
    stroke(128);
    line(i,height-60,i,height);
  }  

}


void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}

