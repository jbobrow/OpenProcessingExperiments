
/*Copyright Ben Corwin 2012
 *This is a audio visualizer that I created.
 *Some of the code is take from "Linear Averages" by Damien Di Fede that is found in the example Library of Processing 1.5.1.
*/

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;
int txt = 17;
int w;
int display = 1;

void setup()
{
  size(500, 300);
  background(100);
  rectMode(CENTER);
  textAlign(CENTER,BOTTOM);
  noStroke();
  smooth();
  textSize(txt);
  minim = new Minim(this);
  
  jingle = minim.loadFile("Massive Attack-Teardrop.mp3", 2048);
  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
  fft.linAverages(int(width/8.1));

}

void draw()
{
  prepWindow();
  
  
  if(display == 1){
    rectVis();
  }
  else if(display == 2 ){
    ellipseVis();
  }
  textDis();
  
}
void ellipseVis(){
  fft.forward(jingle.mix);
  int w = int(fft.specSize()/128);
  fill(255,100);
  for(int i = 0; i < fft.avgSize(); i++)
  {
    if(fft.getAvg(i)*15 > height-20){
      fill(255,0,0,75);
    }
    ellipse(i*w+w,height/2-round(fft.getAvg(i)*6),5,5);
    ellipse(i*w+w,height/2+round(fft.getAvg(i)*6),5,5);
  }   
}

void rectVis(){
  fft.forward(jingle.mix); 
  int w = int(fft.specSize()/128); 
  
  fill(255);
  for(int i = 0; i < fft.avgSize(); i++)
  {
    if(fft.getAvg(i)*15 > height){
      fill(255,0,0);
    }
    rect(i*w+w, height/2, w, fft.getAvg(i)*7);
  }
  
}
void prepWindow(){
  if(display == 1){
    fill(100,50);
  }
  if(display == 2){
    fill(100,4);
  }
  rect(width/2,height/2,width,height);
}

void textDis(){
  fill(0);
  text("press 1 & 2 to view different graphics", width/2, height-txt);
  text("press SPACE to stop & press P to play", width/2,height);
}

void keyPressed(){
  background(100);
  if (key == '1'){
    display = 1;
    jingle.loop();
  }
  if (key == '2'){
    display = 2;
    jingle.loop();
  }
  if (key == ' '){
    jingle.pause();
  }
  if (key == 'p'){
    jingle.loop();
  }
}

void stop()
{
  jingle.close();
  minim.stop();
  super.stop();
}

