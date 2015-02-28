
PImage img;
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup(){
img = loadImage("water.JPG");
minim = new Minim(this);
player = minim.loadFile("tapwater.mp3", 2048);
player.play();
size(425,275);
smooth();
noStroke();
colorMode(HSB, 255);
}

void draw(){
  image(img, 0,0);
  stroke(#CEF0FF,50);
  strokeWeight(70);
  line(225, 250, 225, 130);
  
  stroke(#CEF0FF,60);
  strokeWeight(40);
  line(225, 250, 225, 113);
  
  stroke(#CEF0FF,80);
  strokeWeight(30);
  line(200, 250, 200, 110);
  
  stroke(#CEF0FF,80);
  strokeWeight(30);
  line(250, 250, 250, 110);
  
  stroke(#CEF0FF,100);
  strokeWeight(10);
  line(200, 270, 200, 100);
  
  stroke(#CEF0FF,100);
  strokeWeight(10);
  line(205, 270, 205, 100);
  
  stroke(#CEF0FF,100);
  strokeWeight(10);
  line(210, 270, 210, 100);
  
  stroke(#CEF0FF,100);
  strokeWeight(10);
  line(215, 270, 215, 100);
  
  stroke(#CEF0FF,100);
  strokeWeight(10);
  line(220, 270, 220, 100);
  
  stroke(#CEF0FF,100);
  strokeWeight(10);
  line(225, 270, 225, 100);
  
  stroke(#CEF0FF,100);
  strokeWeight(10);
  line(230, 270, 230, 100);
  
  stroke(#CEF0FF,100);
  strokeWeight(10);
  line(235, 270, 235, 100);
  
  stroke(#CEF0FF,100);
  strokeWeight(10);
  line(240, 270, 240, 100);
  
  stroke(#CEF0FF,100);
  strokeWeight(10);
  line(245, 270, 245, 100);
  
  stroke(#CEF0FF,100);
  strokeWeight(10);
  line(250, 270, 250, 100);
  
  stroke(#CEF0FF,100);
  strokeWeight(10);
  line(255, 270, 255, 100);
  
  stroke(255,90);
  strokeWeight(5);
  line(190, 270, 190, 90);
  
  stroke(255,90);
  strokeWeight(5);
  line(200, 270, 200, 95);
  
  stroke(255,90);
  strokeWeight(5);
  line(210, 270, 210, 100);
  
  stroke(255,90);
  strokeWeight(5);
  line(220, 270, 220, 100);
  
  stroke(255,90);
  strokeWeight(5);
  line(230, 270, 230, 100);
  
  stroke(255,90);
  strokeWeight(5);
  line(240, 270, 240, 100);
  
  stroke(255,90);
  strokeWeight(5);
  line(250, 270, 250, 100);
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}

