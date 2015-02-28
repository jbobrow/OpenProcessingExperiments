
 //Code Modified from Roya Ramezani
 //Code modified from Erik Svedäng
  // Skid sound from http://www.findsounds.com

  
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;

AudioPlayer hSound;

 PImage img;
  PImage img0;
  float r = 0;
float centerX;
float centerY;
float dir = 1;


 void setup(){
  size(700,509);
  noStroke();
  img = loadImage("four.png");
 img0 = loadImage("speechbubble.png");
 centerX = width -200;
  centerY = 250;

noStroke();
  
  minim = new Minim(this);
  hSound = minim.loadFile("skid.mp3");
  hSound.play();
 
}


 
 void draw(){
background(#FFFFCC);

 fill(#FF9900,122);
 stroke(0, 0);
for(float i = 0; i < 4 * PI; i += 0.8) {
   arc(centerX, centerY, 1200, 1200, r + i, r + i + PI / 10 + sin(r) * 0.1);
}
 r += 0.1 * dir;
 image (img,0,0);
 }




void mouseDragged(){
   if (mouseX < 300 && mouseX > 10){
 image (img0, 250, 00, 282, 148);
 }
 }
void stop(){

  minim.stop();
  super.stop();
}


