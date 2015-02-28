
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioSample bounce;
AudioPlayer bgm;

float x = 100, y = 100;
float xSpeed = random(3, 4);
float ySpeed = random(3, 4);
int   mark = 0;
PImage img;
PFont font,font2,font3;

void setup() {

  size(400, 400);
  noStroke();
  img = loadImage("bg.jpg");
  font = loadFont("AgencyFB-Reg-48.vlw");
  font2 = loadFont("Algerian-48.vlw");
  font3 = loadFont("Boopee-Bold-48.vlw");
  
  minim = new Minim(this);
  bounce = minim.loadSample("sample.mp3");
  bgm = minim.loadFile("music.MP3");
  bgm.loop();
 
}

void draw() {
  //for (int a = 0; a < width-30; a++) {
  noCursor();
  image(img,0,0,width,height);
  textFont(font,23);
  fill(255,255,255);
  text("Your Score:"+mark,20,30);
  textFont(font3,23);
  fill(220,120,0);
  text("Catch the ball the block",20,45);
  textFont(font2,40);
  fill(x,y,182);
  text("Bouncing Ball",50,height/2);
  fill(255);
  fill(x,y,182);
  ellipse(x, y, 10, 10);
  fill(255,255,255);
  rect(mouseX-25, height-40, 50, 10);

  x = x + xSpeed;
  y = y + ySpeed;

  if (xSpeed>0 && x > width-5 || x < 5) {
    bounce.trigger();
    xSpeed = -xSpeed;
  }
  if (ySpeed>0 && y > width-5 || y < 5) {
    bounce.trigger();
    ySpeed = -ySpeed;
  }
  if (ySpeed>0 && x>mouseX-25 && x<mouseX+25 && y+5 > height-40) {
    ySpeed = -ySpeed;
    mark++;
  }
}


