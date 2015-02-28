
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer bgsou;
AudioSample hit;

PImage img;
PFont font;
float mark = 0;
float xPos;
float speed;
float xDir;

void setup() {
  size(600, 600);
  noStroke();
  smooth();
  img = loadImage ("92511421.jpg");
  font = loadFont("Biondi-Light-48.vlw");

  minim = new Minim(this);
  hit = minim.loadSample("383716_SOUNDDOGS__to.mp3");
  bgsou = minim.loadFile("preview.mp3");
  bgsou.loop();
  
  hit = minim.loadSample("383716_SOUNDDOGS__to.mp3");

}
float circleA = 200;
float circleB = 100;
float speedA = random(4,5);
float speedB = random(4,5);
float score = 0;

boolean lost=false;

int lives=5;


void draw() {
  image(img, 0, 0,width,height);
  fill(68,190,250);
  rect(mouseX-30, height-40, 60, 20);
  ellipse(circleA, circleB, 20, 20);
  fill(120, 93, 250);
  textFont(font,40);
  text("score = "+mark, 30, 40);
  

  circleA = circleA + speedA;
  circleB = circleB + speedB;

  if (speedA > 0 && circleA > width-10 || circleA < 5) {
    hit.trigger();
    speedA = -speedA;
  }
  if (speedB > 0 && circleB > height-10 || circleB < 5) {
    hit.trigger();
    speedB = -speedB;
  }  

if (speedB>0 && circleA >mouseX-30 && circleA<mouseX+30 && circleB+10 > height-40) {
    speedB = -speedB;
    mark++;
  }
 
 if (circleB > height-10){
   lives--;
 }


  if (lives<=0)
  {
    lost=true;
    noLoop();
    fill(110,250,147);
    textSize(30);
    text("Click to Restart", width/2-150, height/2);
    textSize(13);
  }
}
void mousePressed()
{
  if (dist(mouseX, mouseY, xPos, 200)<=20)
  {
    speed=speed+1;
    score=score+speed;
  }
  else
  {
    lives=lives-1;
  }
  if (lost==true)
  {
    speed=1;
    lives=5;
    score=0;
    xPos=width/2;
    xDir=1;
    lost=false;
    loop();
  }
}


