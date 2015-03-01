
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
PFont a;

String text1 = "For a beautiful color EXPERIENCE";
String text2 = "Find and Press the RED pixel";
String displayed ="";

int interval = 2000; // 2s
int time;
int timer;
int wait = 10000;

AudioPlayer player;
PImage img;
Minim minim;


void setup()
{
  timer = millis();
  frameRate(50);
  smooth();
  size(1366, 780);
  background (255);
  minim = new Minim(this);
  player = minim.loadFile("Scream.wav");
  img = loadImage("Spook.jpg");
  img.resize(0, 900);
  a = createFont("Arial-BoldMT-16", 30, true);
  displayed = text1;
  time = millis();
  textFont(a);
  fill(255);
}
void draw() {
  background(0);
  stroke(255);
    noFill();
      rect(400, 200, 600, 400);
  noStroke();
    fill(0, 255, 0);
      ellipse(600, 500, 2, 2);
    fill(0, 0, 255);
      ellipse(900, 300, 2, 2);
    fill(255, 255, 0);
      ellipse(700, 400, 2, 2);

  if (millis() - timer >= wait) {
    noLoop();
    imageMode(CENTER);  
    image(img, 700, 400);
    timer = millis();
    player.cue(0);
    player.play();
  }
  fill(255);
  text(displayed, width/2 - textWidth(displayed)/2, height/2);
  if (millis() - time > interval) {
    displayed = displayed.equals(text1)? text2:text1;
    time  = millis();
  }
}




