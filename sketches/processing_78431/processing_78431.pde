
import ddf.minim.*;
AudioPlayer music;
Minim minim;

int time = 0;
PImage[] images = new PImage[4];
int frame = 1;
PFont font;

float x1;
float x2;
float x3;
float x4;
float x5;
float x6;
float y1;
float y2;
float y3;
float y4;
float y5;
float y6;
float mx1;
float mx2;
float mx3;
float mx4;
float mx5;
float mx6;
float my1;
float my2;
float my3;
float my4;
float my5;
float my6;

void setup() {
  size(960, 600);
  background(100);
  frameRate(7);
  font = loadFont ("OctoberCrow-72.vlw");
  textFont(font, 72);
  images[0] = loadImage("sad.png");
  images[1] = loadImage("bb1.png");
  images[2] = loadImage("bb2.png");
  images[3] = loadImage("bb3.png");

  x1 = random(5, 825);
  x2 = random(5, 818);
  x3 = random(5, 790);
  x4 = random(5, 825);
  x5 = random(5, 745);
  x6 = random(5, 765);
  y1 = random(490, 580);
  y2 = random(490, 580);
  y3 = random(490, 580);
  y4 = random(490, 580);
  y5 = random(495, 580);
  y6 = random(495, 580);
  mx1 = random(-8, 8);
  mx2 = random(-8, 8);
  mx3 = random(-8, 8);
  mx4 = random(-20, 20);
  mx5 = random(-20, 20);
  mx6 = random(-20, 20);
  my1 = random(-8, 8);
  my2 = random(-8, 8);
  my3 = random(-8, 8);
  my4 = random(-20, 20);
  my5 = random(-20, 20);
  my6 = random(-20, 20);

  minim = new Minim(this);
  music = minim.loadFile("poetry.wav", 1024);
  music.loop();
}

void draw() {
  time = time + 1;

  image(images[0], 350, 200);

  if (time > 80) {
    frame = frame + 1;  
    image(images[frame], 325, 150);
    if (frame > 2) {
      frame = 0;
    }
  }

  fill(0);
  rect(0, 425, 960, 425);
  noStroke();

  fill(random(255), random(255), random(255), 50);
  triangle(80, -10, -40, 425, 200, 425);
  fill(0);
  rect(60, 0, 40, 60);

  fill(random(255), random(255), random(255), 50);
  triangle(280, -10, 160, 425, 400, 425);
  fill(0);
  rect(260, 0, 40, 60);

  fill(random(255), random(255), random(255), 50);
  triangle(480, -10, 360, 425, 600, 425);
  fill(0);
  rect(460, 0, 40, 60); //

  fill(random(255), random(255), random(255), 50);
  triangle(680, -10, 560, 425, 800, 425);
  fill(0);
  rect(660, 0, 40, 60);

  fill(random(255), random(255), random(255), 50);
  triangle(880, -10, 760, 425, 1000, 425);
  fill(0);
  rect(860, 0, 40, 60);

  if (time < 80) {
    fill(255);
    
    x1 = x1 + mx1;
    x2 = x2 + mx2;
    x3 = x3 + mx3;
    y1 = y1 + my1;
    y2 = y2 + my2;
    y3 = y3 + my3;
    
    if(x1 > 825 || x1 < 5) {
      mx1 = -mx1;
    }
    if(y1 > 580 || y1 < 490) {
      my1 = -my1;
    }
    if(x2 > 818 || x2 < 5) {
      mx2 = -mx2;
    }
    if(y2 > 580 || y2 < 490) {
      my2 = -my2;
    }
    if(x3 > 790 || x3 < 5) {
      mx3 = -mx3;
    }
    if(y3 > 580 || y3 < 490) {
      my3 = -my3;
    }
    
    text("soft", x1, y1);
    text("slow", x2, y2);
    text("boring", x3, y3);
  }

  if (time > 80) {
    fill(255);
    
    x4 = x4 + mx4;
    x5 = x5 + mx5;
    x6 = x6 + mx6;
    y4 = y4 + my4;
    y5 = y5 + my5;
    y6 = y6 + my6;
    
     if(x4 > 825 || x4 < 5) {
      mx4 = -mx4;
    }
    if(y4 > 580 || y4 < 490) {
      my4 = -my4;
    }
    if(x5 > 745 || x5 < 5) {
      mx5 = -mx5;
    }
    if(y5 > 580 || y5 < 495) {
      my5 = -my5;
    }
    if(x6 > 765 || x6 < 5) {
      mx6 = -mx6;
    }
    if(y6 > 580 || y6 < 495) {
      my6 = -my6;
    }
    
    text("FAST", x4, y4);
    text("BRUTAL", x5, y5);
    text("INTENSE", x6, y6);
  }

if(time > 278){
  background(100);
  time = 0;
}

}


