
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
PImage img;
Minim minim;
AudioPlayer player;
PFont font;



void setup() {
  size (500, 500);
  noStroke();
  noCursor();
  img=loadImage("galaxy2.jpg");
  minim = new Minim(this);
  player = minim.loadFile("starwars.mp3");
  player.loop();
  font = loadFont("Jokerman-Regular-48.vlw");
  textFont(font);
}

void draw() {

  background (img);
  textSize(25);
  text ("Score =" + " " + a,25,45);
 
  ellipse(x, y, 15, 15);
  x = x + xSpeed;
  y = y + ySpeed;

  if (x > width || x < 0) {
    xSpeed = -xSpeed;
  }

  if ((ySpeed > 0 && y > height) || (ySpeed<0 && y < 0)) {
    ySpeed = -ySpeed;
  }

  rect (mouseX, height-100, 75, 15);
  if (x > mouseX && x-mouseX <75 && y > height-100 && y < height-85 && ySpeed > 0) {
    //xSpeed = -xSpeed;
    a++;
  } 
  
  if (x > mouseX && x-mouseX <75 && y > height-100 && y < height-85) {
    //xSpeed = -xSpeed;
    ySpeed = -ySpeed;
  }

}

