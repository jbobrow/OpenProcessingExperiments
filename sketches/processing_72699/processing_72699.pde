
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import ddf.minim.*;
AudioPlayer Rocket;
AudioPlayer player;
Minim minim;



int numframes = 14; //10 is arbritrary, I will have more frames later
  int frame=0;
float u=-200;//cloud
float r=0;//rooooooockiiiiiit ship
PImage grass; //for background
float f=5;
float s=600;

PImage[] images = new PImage[numframes];
PImage[] Cloud=new PImage[numframes];
PImage[]cloud=new PImage[numframes];
PImage[]rocket=new PImage[numframes];
PImage[]sun=new PImage[numframes];
PImage[]sign=new PImage[numframes];
void setup() 
{
  if(frame>=numframes){
    frame=frame+1;
  }
  size (1280,960);
frameRate(30);
minim = new Minim(this);
 Rocket=minim.loadFile("Missle_Launch.mp3");
 player = minim.loadFile("space-shuttle-launch.mp3");
  player.play();


images[0]=loadImage ("missile1.png");
rocket[0]=loadImage("Stickman1.png");
rocket[1]=loadImage("Stickman2.png");
Cloud[0]=loadImage("Cloud.png");
sun[0]=loadImage("the-sun.png");
sign[0]=loadImage("Sign.png");
grass=loadImage("Sky.jpg"); //image not loading



}

void draw () {
  background (grass);
  frame=frame+1;
   println(frameCount);
  if(player.isPlaying()){
    text("-(+)-", mouseX,mouseY);
  }
  else{
    text(" ", 5, 15);
  }
  if (mousePressed == true) {
    noCursor();
  } else {
    noCursor();
  }
  
r=r-.5;
image(sun[0], 400, 30);
image(sign[0], 500, 450);
image(images[0], -200, r+500);
  if(r<-1400){
    r=10000;
  }
u=u+1;
image(Cloud[0], u, 50);
if(u>1300){
  u=0;}
f=f+1;
s=s-50;
image (rocket[0], 5, 400);
translate(10,280);{
 
  image (rocket[1], 0, 0);
}

}

void stop()
{
 
  player.close();
  minim.stop();
  
  super.stop();
}
void mousePressed(){

Rocket.play();
}
void mouseReleased() {
  Rocket.play();
}


