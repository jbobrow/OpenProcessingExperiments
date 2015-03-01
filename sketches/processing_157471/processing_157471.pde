
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

AudioPlayer player;
Minim minim;



boolean rotateClockwise;
boolean rotateCowboy;
int rotX; 
int movX;  
int speed; 
PImage bull;
PImage cowboy;
PImage base;
int cX=0;
int cY=0;
float rotXspeed; 
float movXspeed; 
int time;
int wait; 
int screen;


void setup() {

  size(800, 800);
  background(10);
  bull = loadImage("mechbull.png");
  cowboy=loadImage("cowboy.png");
  base=loadImage("base.png");
  smooth();
  time = millis();//store the current time
  rotXspeed=2;
  movXspeed=2;
  wait=3000;
  speed=10;
  movX=0;
  rotX=0;
  screen=0;

  minim = new Minim(this);
  player = minim.loadFile("countrysong.mp3");
  player.play();
}

void draw() {
  if (screen==0) {
    welcome();
  }
  if (screen==1) {
    play();
  }
  if(screen==3){
    lose();
    
  }
}

void play() {
  background(10);


  image(base, width/2, height/2);

  pushMatrix();
  translate(width/2, height/2);
  //rotate(millis());

  rotate(radians(rotX));
  imageMode(CENTER);
  image(bull, 0, 0);
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(movX));
  imageMode(CENTER);
  image(cowboy, cY, cY);
  popMatrix();





  if ((rotX > 20) || (rotX < -20)) {
    rotateClockwise = !rotateClockwise;
  }

  if (rotateClockwise) {
    rotX-=rotXspeed;
  } else {
    rotX+=rotXspeed;
  }


  if ((movX > 120) || (movX < -120)) {
    rotateCowboy = !rotateCowboy;
  }

  if (rotateCowboy) {
    movX+=movXspeed;
  } else {
    movX-=movXspeed;
  }
  if (millis() - time > wait) {
    movXspeed+=1;
    rotXspeed+=1;
    time=millis();
  }


  if (movX>100 || movX<-100) {
    background(10);
    screen=3;
    rotateCowboy=false;
    rotateClockwise=false;
  }
}


void keyPressed() {

  if (keyCode == RIGHT) {
    rotateCowboy = true;
    movX+=5;
  } 

  if (keyCode == LEFT) {
    rotateCowboy = false;
    movX-=5;
  }
}



void lose() {

  background(0);
  textAlign(CENTER);


  text("you lasted: " + time/1000 +"seconds", width/2, 3* height/7);
  if (time<10000) {
    text("you're a pretty shitty cowboy", width/2, height/2);
  }
  if (time>10000 &&time <20000) {
    text("not too bad...", width/2, height/2);
    text("...but not too good either", width/2, 4*height/7);
  }
  if (time>20000) {
    text("think about joining the rodeo", width/2, height/2);
  }

  minim.stop();
  super.stop();

  if (keyPressed) {
  setup();
  
  
  }
}



  



void welcome() {

  background(0);
  textAlign(CENTER);
  text("MECHA-BULL 3,000", width/2, 3*height/7);
  text("Use Left and Right Arrow Keys to Balance", width/2, height/2);
  if (keyPressed) {
    screen=1;
  }
}








