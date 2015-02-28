
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//for sound
Minim m =new Minim(this);
AudioPlayer music;
AudioPlayer sound;

//making the images
PImage pikachu;
PImage pokeball;
PImage pikaBg;

//position and velocity vectors
PVector pos;
PVector vel;
 
boolean first = true;  //to start playing the music

//physics of pokeball
final int LENGTH = 150;
final PVector GRAVITY = new PVector(0,1);
final float ELASTICITY = .01;
final float FRICTION = .99;
final int DIAM = 50;

//position of pokeball
int RandomX = (int)(Math.random()*600);
int RandomY = (int)(Math.random()*300);

//the level
int state = 0;
 
void setup() {
  size(700,400);
  smooth();
  
  //making the vectors
  pos = new PVector(width/2,height/2);
  vel = new PVector(0,0);
  
  //choosing the sound files
  sound = m.loadFile("qwop.wav");
  music = m.loadFile("music.wav");
  
  //choosing the image files
  pikachu = loadImage("pikachu.png");
  pokeball = loadImage("pokeball.png");
  pikaBg = loadImage("pika.png");
}
 
void draw() {
  music.play();
  if(first){
    music.loop(10);
    first = false;
  }
  if(state>3 && state<=7){  //second level black background
    background(0);
  }
  else if(state>7 && state<=11){  //third level pika background
    background(pikaBg);
  }
  else if(state==12){  //resetting level
    state = 0;
    background(pikaBg);
  }
  else
    background(255);
    //updating position of string and pokeball
  updatePokeBall();
  drawString();
  drawPokeBall();
  
  //when you hit pikachu, draws new pikachu, plays sound
  if(pos.x>RandomX-25 && pos.x<RandomX+40 &&
  pos.y > RandomY-25 && pos.y < RandomY +80) {
    RandomX = (int)(Math.random()*600);
    RandomY = (int)(Math.random()*300);
    state++;
    sound.play();
    sound.loop(0);
    
  }  
  image(pikachu,RandomX, RandomY);
}
 
 //sourced code
PVector elasticity() {
  float theta = atan2(ydiff(),xdiff());
  float force = force();
  return new PVector(force*cos(theta),force*sin(theta));
}
 
 //sourced code
float force() {
  float d = distance();
  if(d < LENGTH) {
    return 0;
  } else {
    return (d - LENGTH) * ELASTICITY;
  }
}
 
float distance() {
  return sqrt(pow(xdiff(),2) + pow(ydiff(),2));
}
 
float xdiff() {
  return mouseX - pos.x;
}
 
float ydiff() {
  return mouseY - pos.y;
}
 
void updatePokeBall() {
  vel.add(elasticity());
  vel.add(GRAVITY);
  vel.mult(FRICTION);
  pos.add(vel);
}
 
void drawVector(PVector v) {
  stroke(120);
  strokeWeight(1);
  line(width/2,height/2,width/2+v.x,width/2+v.y);
}
 
void drawAngle(float a) {
  pushMatrix();
  translate(width/2,height/2);
  stroke(120);
  strokeWeight(5);
  point(0,0);
  strokeWeight(1);
  line(0,0,50*cos(a),50*sin(a));
  popMatrix();
}
 
void drawString() {
  stroke(0);
  strokeWeight(2);
  line(mouseX,mouseY,pos.x+25,pos.y);

}
 
void drawPokeBall() {
  image(pokeball,pos.x,pos.y,DIAM,DIAM);
}

