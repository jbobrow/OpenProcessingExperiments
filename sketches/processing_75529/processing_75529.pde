
import ddf.minim.*;
PImage img;

AudioPlayer ap;
Minim minim;

void setup() {
  size(600, 600);
  background(255);
  stroke(255,0,0,0);
  colorMode(HSB,300,380,100);
  smooth();
  minim = new Minim(this);
  ap = minim.loadFile("music.mp3");
  ap.play();
  img = loadImage("pic.png");
}

void draw() {
  image(img,380,460);
  float level = ap.mix.level();
  float rectW = level * width*1.5;
  float radius = 210 + rectW/1.5;
  float circlesize = 30+rectW;
  for(int i = 0; i<= 360; i = i+45)
  {
    ellipse(  radius*sin(radians(i))+300, radius*cos(radians(i))+300, circlesize, circlesize);
  }
//  float d = random(330);
//  ellipse(random(300),random(300),d,d);
  rect(width/2-rectW/2, height/2-rectW/2, rectW, rectW);
  fill(random(360),100,100,120);
  smooth();
}

