
//Space Hopper Alien, Hopper, Processing Module, Jura McKay
//29/2/2012
//start

import ddf.minim.* ;
Minim minim;

AudioPlayer shootSound, failSound;

Alien HopperAlien; //class name, object
PImage a; 


  void setup() {
    size(400, 400);
   a = loadImage("galaxy.jpg");  //loading background image into pde
   minim = new Minim(this) ; 
   shootSound = minim.loadFile("bloop_x.wav");
   failSound = minim.loadFile("pacman_dies_y.wav");
    HopperAlien = new Alien(); //object = new class
  }

  void draw() {
    fill(255,0,0);
    image(a, 0, 0); 
    HopperAlien.display(); // calls display void to run
    HopperAlien.score(); // score
    HopperAlien.play();
  }

class Alien {

int xpos;
int ypos;
int xlong;
int ylong;
int score;
int timer;
int changer;
int highscore;
boolean doOnce;

  Alien(){ // inital variable values used in class
  xpos = 200;
  ypos = 200;
  xlong = 50;
  ylong = 50;
  score = 0;
  changer = 2000;
  // xpos-xlong/2 = 125
   }

 
   
  void display() { //Contrusts the alien display
  
  if (mousePressed & changer > 100) {
    changer = changer - 20;

  } else {
    stroke(0);
  }
  
  // get(mouseX,mouseY)== color(0, 255, 0)
  if (score > highscore) {
    highscore = score;
  }
  

    if (mousePressed && doOnce == false && mouseIsCircle(xpos,ypos,xlong)) {
    fill (255,0,0);
    score = score + 1;
    doOnce = true;
    shootSound.rewind();
    shootSound.play();
  } 
  
  if (mousePressed == false ) {
    doOnce = false;
  }
  
  if (mousePressed && mouseIsCircle(xpos,ypos,xlong) == false) {
    score = 0;
    changer = 2000;
    failSound.rewind();
    failSound.play();
    delay(4000);
  }
  
  
  
    smooth();
    fill(32,165,70);
    noStroke();
      
    ellipse (xpos,ypos,xlong,ylong);
    fill(200,20,20);
    rect (xpos-xlong/3,ypos,xlong/20,ylong/5);
    rect (xpos+xlong/3,ypos,xlong/20,ylong/5);
    fill(255,255,255);
    rect (xpos-xlong/2,ypos-ylong/40,xlong,ylong/20);
    rect (xpos-xlong/3.5,ypos-xlong/3, xlong/5, ylong/5);
    rect (xpos+xlong/10,ypos-xlong/3, xlong/5, ylong/5);
    fill (0,0,0);
    ellipse (xpos-xlong/5.5,ypos-xlong/5.5, xlong/15, ylong/15);
    ellipse (xpos+xlong/5.5,ypos-xlong/5.5, xlong/15, ylong/15);
    fill(32,165,70);
    rect (xpos+xlong/5.5,ypos-xlong,xlong/15,ylong-xlong/2.5);
    rect (xpos-xlong/5.5,ypos-xlong,xlong/15,ylong-xlong/2.5);
    fill((int) random (0,255),(int) random (0,255),(int) random (0,255));
    ellipse (xpos+xlong/4.7, ypos-xlong, xlong/7, ylong/7);
    ellipse (xpos-xlong/6.5, ypos-xlong, xlong/7, ylong/7);
   }
   
 
   void score() {
  stroke(5);
  fill(100,100,255);
  textSize(20);
  textSize(17);
  text("SCORE = " + score, 150, 20);
  text("if you miss the alien, your score resets!", 40,390);
  textSize(12);
  fill(188,25,36);
  text("HIGHSCORE = " + highscore, 147, 36);
  fill(255,255,255);
  textSize(10);
   text(mouseX, 10, 10);
  text(mouseY, 10, 20);
  text(xpos, 380, 10);
  text(ypos , 380, 20);
  noStroke();
   }
   
   void play() {
     if (millis() - timer >= changer)  {// if time is 500
     xpos = (int) random (20,380);
     ypos = (int) random (20,380);
      timer = millis();
      
      
     }
  
     
     
   }
     
   boolean mouseIsCircle(int x, int y, float diameter) {
  return (dist(mouseX, mouseY, x, y) < diameter*0.5);
}
}


 void stop() {
  minim.stop() ; 
  super.stop() ;
}

