
float x=0, y=0, vx=7, vy=7;
int a=70, b=55, value=0;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer daSound;
AudioOutput out;
SineWave sine;

void setup(){
  size(700,400);
  img1=loadImage("nau.jpg");
  img2=loadImage("explosio.jpg");
  img3=loadImage("fondo.jpg");
  img4=loadImage("kamikaze.jpg");
  background(0);
  noCursor();
  minim = new Minim(this);
  daSound = minim.loadFile("explosio.mp3");
    out = minim.getLineOut(Minim.STEREO, 2048);      
    sine = new SineWave(440, 0.2, out.sampleRate());
}

void draw(){
  image(img3,0,0,width,height);
  pushMatrix();
  translate(mouseX,mouseY);
  scale(0.1);
  image(img4,0,0);
  popMatrix();
  if((x<0)||(x>width-a)){
    vx=-vx;
  }
  if((y<0)||(y>height-b)){
    vy=-vy;
  }
  image(img1,x,y,a,b);
  x=x+vx;
  y=y+vy;
}


void mousePressed(){
  if((mouseX>x-a)&&(mouseY>y-b)&&(mouseX<x+a)&&(mouseY<y+b)){
    img1=img2;
    img4=img2;
    vx=0;
    vy=0;
    daSound.play();
  }
}


