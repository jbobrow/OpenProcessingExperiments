

import ddf.minim.*;
import ddf.minim.signals.*;

int[] x=new int [10];
PImage pg;
boolean active;

Minim minim;

AudioOutput out;
SineWave sine;

void setup(){
  
size(530,500);
pg = loadImage("CHAIR.jpg");
stroke(41,64,255);
smooth();
rectMode(CENTER);
ellipseMode(CENTER);

 for(int i = 0; i<10; i++){
    x[i] = int(random(100));


minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);

  sine = new SineWave(440, 0.5, out.sampleRate());

  sine.portamento(80);

 out.addSignal(sine);
 
 out.setGain(-200);

}
}

void draw(){
  background(255);
  stroke(153,255,111);
    for(int i = 0; i<10; i++){
   // ellipse(x[i], 50, 20,20); // now the x value will change
    // accoriding to setup's for loop
    ellipse(int(random(500)), 400, 20,20); 
    
  }
  
  
  stroke(41,64,255);
    for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
  
  
  
  //stroke(227,137,255);
      for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 150 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 250 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
  
  
  
  
  
  
  
 // if(mousePressed){
 // image(img,0,0);             if i uncomment this and put "pg" the image will show
 // }
 
 //check the color of a certain part of this image using a color variable named c
 //get the color wherever the mouse is, and make a rect with that color using c val
 color c = pg.get(mouseX,mouseY); //get in Pixels reference
 fill(c);
// rect(25,25,50,50);
// rect(100,25,50,50);
 
   for(int i=30; i<500; i=i+40) {
   ellipse(25,i,30,30);
  }
  
   for(int i=30; i<500; i=i+40) {
   rect(65,i,30,30);
  }
  
   for(int i=30; i<500; i=i+40) {
   ellipse(105,i,30,30);
  }
  
   for(int i=30; i<500; i=i+40) {
   rect(145,i,30,30);
  }
  
   for(int i=30; i<500; i=i+40) {
   ellipse(185,i,30,30);
  }
  
   for(int i=30; i<500; i=i+40) {
   rect(225,i,30,30);
  }
  
   for(int i=30; i<500; i=i+40) {
   ellipse(265,i,30,30);
  }
  
   for(int i=30; i<500; i=i+40) {
   rect(305,i,30,30);
  }
  
   for(int i=30; i<500; i=i+40) {
   ellipse(345,i,30,30);
  }
  
   for(int i=30; i<500; i=i+40) {
   rect(385,i,30,30);
  }
  
   for(int i=30; i<500; i=i+40) {
   ellipse(425,i,30,30);
  }
  
   for(int i=30; i<500; i=i+40) {
   rect(465,i,30,30);
  }
  
   for(int i=30; i<530; i=i+40) {
   ellipse(505,i,30,30);
  }
 
 
 println(c);
 
 
 
 float bVal = brightness(c);
 
 //float redVal =red(c); should extract the red vals
 
 
 println(c);
 if(c ==9603208){
   print("active");
 }
 



 //below is how you turn of the sinewaves sound (or just make it really quiet)
 
// out.setGain(-200);
 
}

void mouseMoved()
{

  float freq = map(mouseY, 0, height, 1500, 60);
  sine.setFreq(freq);

  float pan = map(mouseX, 0, width, -1, 1);
  sine.setPan(pan);    
}

void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}

