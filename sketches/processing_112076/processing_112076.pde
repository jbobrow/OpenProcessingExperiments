
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

float x = random(100,250);
float y = random(80,150);
float xSpeed = random(3, 4);
float ySpeed = random(3, 4);
int a = 0;
int b = 3;
PImage img;
Minim minim;
AudioPlayer bgsound;
AudioSample hit;
AudioSample boo;
PFont font;



void setup() {
  size (500, 500);
  noStroke();
  noCursor();
  img=loadImage("galaxy2.jpg");
  minim = new Minim(this);
  bgsound = minim.loadFile("starwars.mp3");
  bgsound.loop();
  hit = minim.loadSample("ding.wav");
  boo = minim.loadSample("boo.wav");
  font = loadFont("Jokerman-Regular-48.vlw");
  textFont(font);
}


void draw() {

  background (img);
  textSize(25);
  text ("Score =" + " " + a,25,45);
  text ("Lives = " + " "+ b, 350, 45);
 
  ellipse(x, y, 15, 15);
  x = x + xSpeed;
  y = y + ySpeed;

  if (x > width || x < 0) {
    xSpeed = -xSpeed;
   
  }

  if (ySpeed<0 && y < 0) {
    ySpeed = -ySpeed;
  }
  
  if (ySpeed > 0 && y > height) {
    ySpeed = -ySpeed;
    b--;
    boo.trigger();
  }

  rect (mouseX, height-100, 75, 15);
  if (x > mouseX && x-mouseX <75 && y > height-100 && y < height-85 && ySpeed > 0) {
    //xSpeed = -xSpeed;
    a++;
    hit.trigger();
 
  } 
  
  if (x > mouseX && x-mouseX <75 && y > height-100 && y < height-85) {
    //xSpeed = -xSpeed;
    ySpeed = -ySpeed;
  }

   if (b == -1){
    x = 501;
    xSpeed = 0;
    ySpeed = 0;
    background (0);
    fill(255);
    text("Game Over", 180, 250);
    text("Your score is " + a, 140, 300);
    
   }
}

