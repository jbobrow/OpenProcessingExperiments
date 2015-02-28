
//Devon Kelley final project-- saw wave player!
//uses sound, interaction, functions and rotations.
//sources used for code-processing.org minum library
//http://code.compartmental.net/minim/examples/AudioOutput/SawWaveSignal/SawWaveSignal.pde
//also referenced function example code on processing.org 
//http://www.processing.org/learning/basics/functions.html

float x,y,dirx,diry,i;

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SawWave saw;

void setup()
{
  size(350, 180, P3D);
  x=0;
  y=0;
  i=0; 
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 2048);
  saw = new SawWave(440, 0.2, out.sampleRate());
  saw.portamento(200);
  out.addSignal(saw);
}

void draw()
{
  background(0);
  stroke(255);
  drawNoise(width*0.25, height*0.4, 200, 4);
  drawNoise(width*0.5, height*0.5, 300, 10);
  drawNoise(width*0.75, height*0.3, 120, 6);
  //saw waves
   x+=dirx;
   y+=diry;
   if(dist(mouseX,mouseY,0,15)<50){
     saw.setFreq(100);
    dirx=-dirx;
    saw.setAmp(.5);
   }else if(dist(mouseX,mouseY,60,15)<50){
     saw.setFreq(200);
    diry=-diry;
    saw.setAmp(.5);
   }else if(dist(mouseX,mouseY,120,15)<50){
     saw.setFreq(300);
    dirx=-dirx;
    saw.setAmp(.5);
   }else if(dist(mouseX,mouseY,180,15)<50){
     saw.setFreq(400);
    diry=-diry;
    saw.setAmp(.5);
   }else if(dist(mouseX,mouseY,240,15)<50){
     saw.setFreq(500);
    dirx=-dirx;
    saw.setAmp(.5);
   }else if(dist(mouseX,mouseY,300,15)<50){
     saw.setFreq(600);
    diry=-diry;
    saw.setAmp(.5);
   }else if(dist(mouseX,mouseY,0,75)<50){
    saw.setFreq(700);
    dirx=-dirx;
    saw.setAmp(.5);
  }else if(dist(mouseX,mouseY,60,75)<50){
    saw.setFreq(800);
    diry=-diry;
    saw.setAmp(.5);
  }else if(dist(mouseX,mouseY,120,75)<50){
    saw.setFreq(900);
    dirx=-dirx;
    saw.setAmp(.5);
  }else if(dist(mouseX,mouseY,180,75)<50){
    saw.setFreq(1000);
    diry=-diry;
    saw.setAmp(.5);
  }else if(dist(mouseX,mouseY,240,75)<50){
    saw.setFreq(1100);
    dirx=-dirx;
    saw.setAmp(.5);
  }else if(dist(mouseX,mouseY,300,75)<50){
    saw.setFreq(1200);
    diry=-diry;
    saw.setAmp(.5);
  }else{
   saw.setAmp(0);
  }
  //rotations
  pushMatrix();
rotate(radians(-10));
fill(118,118,118);
rect(0,15,50,50);
rect(60,15,50,50);
rect(120,15,50,50);
rect(180,15,50,50);
rect(240,15,50,50);
rect(300,15,50,50);
rect(0,75,50,50);
rect(60,75,50,50);
rect(120,75,50,50);
rect(180,75,50,50);
rect(240,75,50,50);
rect(300,75,50,50);
popMatrix();

fill(255,255,255);
stroke(255,0,5);
rect(0,15,50,50);
rect(60,15,50,50);
rect(120,15,50,50);
rect(180,15,50,50);
rect(240,15,50,50);
rect(300,15,50,50);
rect(0,75,50,50);
rect(60,75,50,50);
rect(120,75,50,50);
rect(180,75,50,50);
rect(240,75,50,50);
rect(300,75,50,50);

textSize(20);
fill(255,255,255);
stroke(5,5,5);
text("PUSH MY BUTTONS", 90, 160); 

}

//background visuals
void drawNoise(float x, float y, int size, int num){
  float col=100/num;
  float moves=size/num;
  for(int i=0; i<num; i+=1){
    fill(i*col);
    line(x,y,size-i/moves, size-i*moves);
  }for(int i=0; i<num;i+=2){
    fill(i*col);
    rect(x,y,size-i/moves,size-i/moves);
  }
 
}

void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}

