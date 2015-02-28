

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer player;
FFT fft;

int t;
float clock;





void setup(){
  
  size(800, 600, P3D);
 
  minim = new Minim(this);
 
  player = minim.loadFile("beat.mp3", 1024);
  player.loop();
  
  fft = new FFT(player.bufferSize(), player.sampleRate());
  println("sampling reate is " +player.sampleRate());
  println("spec size is " +fft.specSize());
  println("bandwidth is: " +fft.getBandWidth());
  
  for (int i = 0; i < fft.specSize(); i++) {
    println(i + " = " + fft.getBandWidth()*i);
  }
  
  rectMode(CENTER);
  frameRate(30);
  
  clock = TWO_PI/30.0;
 
}







void draw(){
  
  background(255);
  
  fft.forward(player.mix);
  
  for (int i = 0;i < player.mix.size()-1;i++) {
    
    if (i % 2 == 0) {
      noFill();
      stroke(0, 0, random(255), 80);
      strokeWeight(2);
    } else {
      noStroke();
      fill(0, 0, 255, 80); 
    }
    
    ellipse(width/2+i*cos(t), height/2-i*sin(t), t + player.mix.get(i)*100, t + player.mix.get(i)*100);
    
    t++;
    if (t > 50) {
      t = 0;
    }
    
  }
  
  filter(BLUR,2);    

}
    
/*
void stop()
{

  player.close();
  minim.stop();
  super.stop();
  
}
*/

