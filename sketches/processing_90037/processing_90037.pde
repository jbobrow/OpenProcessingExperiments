

import processing.opengl.*;
import ddf.minim.*;

Minim minim;
AudioPlayer in;

PFont font;
PFont font2;

float t = 0;
float p;
float buffer = 0;
int h = hour();
int m = minute();
int s = second();
float f = 255;
int clock;
int currentSecond;

/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/68161*@* */
ArrayList ripples;    // List of ripples.
int maxDrops = 100;   // Max number of rain drops.
ArrayList balls;    // List of ripples.
ArrayList birds;    // List of ripples.

void setup() {  
  size(700,500);
  fill(255,0,0);
  noStroke();
  smooth();
  colorMode(RGB);
  frameRate(60);  
  
  minim = new Minim(this);
  in = minim.loadFile("antichamber.mp3", 2048);
  in.play();
  in.loop(); 
  
  font = loadFont("Ayuthaya-64.vlw");
  font2 = loadFont("Ayuthaya-12.vlw");
  textFont(font2);
 
  ripples = new ArrayList();
  balls = new ArrayList();
  birds = new ArrayList();
  
  //in.cue(61000);
} 

void draw(){
  m = minute();
  s = second();
  p = in.position();
//  frame.setTitle(str(frameRate));        // Doesn't work on openProcessing
  
   fill(255);
   rect(0, 0, width, height);
   processTime();
}

 void processTime(){
  if (p < 14200) {
    fill(0);
    rect(0, 0, width, height);
  }
  if (p < 8800){
    drawBalls();
  }
  if ((p > 8800) && (p < 8900)){
  t = 0;
  }
  if ((p > 11500) && (p < 14200)){
    drawText();
  } 
  if ((p > 14200) && (p < 23000)){
   drawBirds(); 
  }
  if ((p > 14200) && (p < 20000)){
    t = 0;
  }
  if ((p > 22500) && (p < 26000)){
   drawFade();
  }
  if ((p > 25500)){
  fill(25);
  rect(0, 0, width, height); 
  }
  if ((p > 23000) && (p < 60000)){
   drawRipple(); 
  }
  if ((p > 48400) && (p < 48700)){
   ripples.add(new Ripple(random(50, width-50), random(50, height-50), 250)); // Blows up ripples
  }
  if ((p > 61000) && (p < 62000)){
    t = 25;  
    textFont(font);
  }
  if ((p > 65500) && (p < 109000)){
    if (p < 80000){
       t = t + 0.5;
        if (t > 255) {
            t = 255;
        }
    }
    drawClock();
    if (p > 100000){
       t = t - 0.5;
          if (t < 25) {
            t = 25;
          }
    }
  }
  if (p > 115000){
    stop();
    exit(); 
  }
}
 
void drawBalls(){
  int maxBalls = h +1;
  int factor;
   while (balls.size() < maxBalls) {
     int temp = int(random(0,10));
     if (temp == 2){
       factor = 0;
     }else{
       factor = 1;
     }
    balls.add(new Ball(random(0, width), random(0, height), factor));
   }
   
  fill(f);
  t = t + .02;
  if (t > 7.5){
  f = f - 2;
  }  
  if (f<0) {
    f = 0;
  }
  
  for (int i = balls.size() - 1; i >= 0; i--) {
    Ball ball = (Ball) balls.get(i);
    ball.update(t);   
    ball.display(f);
  } 
  
  
}
 
void drawText(){
  t = t + .5;
  float right = map(in.mix.level(), 0, .3, 5, 65);
  int locY = height/32;
  int locX = width/32;
  int i = 0;
 while (i < 50) {        // Nested iteration
   fill(right*t);
   text(random(0,200), floor(random(4,27))*locX, floor(random(4,28))*locY);
   i = i + 1;
 }
} 
 
void drawBirds(){
  int maxBirds = m +1;
   while (birds.size() < maxBirds) {
     int temp = int(random(0,3));
     if ((temp == 1) || (temp == 0)){
        birds.add(new Bird (random(-10, 0), random(0, height), random(1,8),random(1,8)));
     } 
     if ((temp == 2) || (temp == 3)){
        birds.add(new Bird (random(0, width), random(-10, 0), random(1,8),random(1,8)));
     }  
   }
 
  for (int i = birds.size() - 1; i >= 0; i--) {
    Bird bird = (Bird) birds.get(i);
    bird.update(); 
    if (bird.finished()) {
      birds.remove(i);
    } else {
      bird.display();
    }  
  } 
} 
 
 void drawFade(){
  t = t + 10;
  fill(25);
  ellipse(width/2,height/2,t,t);
   
 }
 
 void drawRipple(){
   /* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/68161*@* */

  if (ripples.size() < maxDrops && random(100) > 80) {
    ripples.add(new Ripple(random(0, width), random(0, height), random(50, 100)));
  }
  for (int i = ripples.size() - 1; i >= 0; i--) {
    Ripple rip = (Ripple) ripples.get(i);
    rip.update();
    if (rip.finished()) {
      ripples.remove(i);
    } else {
      rip.display();
    }
  } 
   
 }
 
void drawClock(){
 
  if (s != currentSecond){
   clock = clock + 1;
  }
  
  if (clock > 3){
    clock = 0;
  }
  
  fill(t);
  //textFont(font);
  switch(clock) {
  case 0: 
  text("L", width/2, height/2);
  break;
  case 1:
  text("I", width/2, height/2); 
  break;
  case 2: 
  text("F", width/2, height/2);
  break;
  case 3:
  text("E", width/2, height/2);
  break;
  }

  currentSecond = s;
 }
 
void stop(){
  in.close();
  minim.stop();
  super.stop();
}


class Ball {
  float x, y;
  float step;
  float factor;
  
  Ball(float x, float y, float f) {
    this.x = x;
    this.y = y; 
    this.factor = f;   
    this.step = random(1, 2);
  }
  void update(float t) {
    if (this.factor == 0){
    this.x = sin(step*t) * 120 + width/2;
    this.y = cos(step*t) * 120 + height/2;
    } else {
    this.x = sin(step*t) * (110 + sin(.01*t) * 110) + width/2;
    this.y = cos(step*t) * (110 + sin(.01*t) * 110) + height/2;
    }
  }

  void display(float f) {
    fill(f);    
    ellipse(this.x, this.y, 20, 20);
  } 
}

class Bird {
  float x, y;
  float factorx;
  float factory;
  boolean FINISHED = false;
  
  Bird(float x, float y, float f, float g) {
    this.x = x;
    this.y = y; 
    this.factorx = f;
    this.factory = g;   
  }
  
  
  void update() {
    this.x = this.x + factorx;
    this.y = this.y + factory;
    if (this.x > width){
       FINISHED = true;
    } 
    if (this.y > height){
       FINISHED = true;
    }
  }
  
  void display() { 
   fill(0);
   pushMatrix();
   translate(0,height);
   scale(1,-1);
    ellipse(this.x, this.y, 10, 10);
    popMatrix();
  }
  
 boolean finished() {
    return FINISHED;
  }
}
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/68161*@* */

/******************************
* Ripple class
* A ripple gradually expands and fade out after certain cycles.
*/
class Ripple {
  float x, y;
  float max_r, r;
  float step;
  boolean FINISHED = false;
  float max_brightness;
  float thickness;
  
  Ripple(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.max_r = r;
    this.r = 0;
    step = random(0.3, 0.8);
    max_brightness = random(80, 210);
    thickness = random(1, 5);
  }
  
  /*****************************
  * Update object state
  */
  void update() {
    if (r <= max_r) {   // If r is smaller than max radius
      r = r + step;      // then keep expanding,
    } else {
      FINISHED = true;  // otherwise put the object into dead state.
    }
  }

  /*****************************
  * Draw the ripple
  */  
  void display() {
    noFill();
    stroke(max_brightness, 255 * (max_r - r) / max_r);
    strokeWeight(1);
    ellipse(this.x, this.y, this.r, this.r);
  }
  
  /*****************************
  * Return object state
  */
  boolean finished() {
    return FINISHED;
  }
}


