

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer player;
FFT fft;

int c = 255;


void setup(){
  
  size(800, 450, P3D);
 
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
  ellipseMode(CENTER);
  frameRate(60);
 
}







void draw(){
  
  background(0);
  noFill();
  stroke(255);
  
  fft.forward(player.mix);
  
  for(int i = 0; i < player.mix.size()-1; i++){
    if(c > 0){
      c -= 1;
    }else{
      c = 255; 
    }
    noStroke();
    float x = (i + player.mix.get(i)*200)*2;
    float y = random(0,450) + ( player.mix.get(i+1)*200);
    fill(c, c, c, 80);
    ellipse(x, y, player.mix.get(i)*100, player.mix.get(i)*100);
    }


  
  

//---------- red ----------//
  if(key == 'r') {
    background(0);

    for(int i = 0; i < player.mix.size()-1; i++){
      if(c > 0){
        c -= 1;
      }else{
        c = 255; 
      }
      noStroke();
      float x = (i + player.mix.get(i)*200)*2;
      float y = random(0,450) + ( player.mix.get(i+1)*200);
      fill(255, c, 0, 80);
      ellipse(x, y, player.mix.get(i)*100, player.mix.get(i)*100);
    }
  }
  
  
  
  
//---------- green ----------//
  if(key == 'g') {
    background(0);

    for(int i = 0; i < player.mix.size()-1; i++){
      if(c > 0){
        c -= 1;
      }else{
        c = 255; 
      }
      noStroke();
      float x = (i + player.mix.get(i)*200)*2;
      float y = random(0,450) + ( player.mix.get(i+1)*200);
      fill(c, 255, 0, 80);
      ellipse(x, y, player.mix.get(i)*100, player.mix.get(i)*100);
    }
  }  
  

  
  
//---------- blue ----------//
  if(key == 'b') {
    background(0);
    
    for(int i = 0; i < player.mix.size()-1; i++){
      if(c > 0){
        c -= 1;
      }else{
        c = 255; 
      }
      noStroke();
      float x = (i + player.mix.get(i)*200)*2;
      float y = random(0,450) + ( player.mix.get(i+1)*200);
      fill(0, c, 255, 80);
      ellipse(x, y, player.mix.get(i)*100, player.mix.get(i)*100);
    }
  }
  
  
}
  
  

void stop()
{

  player.close();
  minim.stop();
 
  super.stop();
  
}

