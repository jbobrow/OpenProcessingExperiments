
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


myhand Chyhand;
Minim  minim;
AudioPlayer in;

float circleSize;
float angle;
float oscillation;
float xpos, ypos;
float hit;

void setup(){
  size(600,600);
  smooth();
  xpos = width/2;
  ypos = height/2;
  Chyhand = new myhand();
}

void draw(){
  angle = frameCount * 0.1;
  oscillation = sin(angle);
  
  float oscMapped = map(oscillation, -1,1,0,1);
  background(255);
  noStroke();
  fill(random(0,255),random(0,255),random(0,255),random(0,100));
  ellipse(mouseX* oscMapped, mouseY* oscMapped, 50 * oscMapped, 50 * oscMapped);
  Chyhand.init(mouseX,mouseY);
  Chyhand.move();
  
  hit = dist(mouseX* oscMapped,mouseY* oscMapped,mouseX,mouseY);
  if(hit < 10){
    minim = new Minim(this);
    in = minim.loadFile("LASER1.mp3");
    in.play();
  }
  
  
  
}

