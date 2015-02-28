
import ddf.minim.*;
AudioPlayer music;
Minim minim;
 
int time = 0;
PImage[] images = new PImage[4];
int frame = 1;
PFont font;
//int STAGE_WIDTH = 960;
//int STAGE_HEIGHT = 600;
 
float a1;
float a2;
float a3;
float a4;
float a5;
float a6;

float b1;
float b2;
float b3;
float b4;
float b5;
float b6;

float cx1;
float cx2;
float cx3;
float cx4;
float cx5;
float cx6;

float dy1;
float dy2;
float dy3;
float dy4;
float dy5;
float dy6;
 
void setup() {
  size(960, 600);
  background(100);
  frameRate(7);
  font = loadFont ("VinerHandITC-48.vlw");
textFont(font,72);
  images[0] = loadImage("niceboy.png");
  images[1] = loadImage("DK1.PNG");
  images[2] = loadImage("DK2.png");
  images[3] = loadImage("immortal1.png");

  a1 = random(10, 825);
  a2 = random(10, 818);
  a3 = random(10, 790);
  a4 = random(10, 825);
  a5 = random(10, 745);
  a6 = random(10, 765);
  
  b1 = random(480, 590);
  b2 = random(480, 590);
  b3 = random(480, 590);
  b4 = random(480, 590);
  b5 = random(485, 590);
  b6 = random(485, 590);
 
  cx1 = random(-5, 5);
  cx2 = random(-5, 5);
  cx3 = random(-5, 5);
  cx4 = random(-25, 25);
  cx5 = random(-25, 25);
  cx6 = random(-25, 25);
  
  dy1 = random(-8, 8);
  dy2 = random(-8, 8);
  dy3 = random(-8, 8);
  dy4 = random(-20, 20);
  dy5 = random(-20, 20);
  dy6 = random(-20, 20);
 
  minim = new Minim(this);
  music = minim.loadFile("CoastEntombed.mp3", 1024);
  music.loop();

}
 
void draw() {
  time = time + 1;
  if (time > 80) {
    frame++;
    image(images[3], (960 / 2) - (images[3].width / 2), 150);
    if (frame == 1) image(images[1], 80, 150);
    if (frame == 2) image(images[2], 960 - images[frame].width - 80, 150);
    if (frame > 2) {
      frame = 0;
    }
  } else {
    image(images[0], (960 / 2) - (images[0].width / 2), 200);
  }
 
  fill(118,69,8);
  rect(0, 425, 960, 425);
  noStroke();
 
  fill(random(250), random(250), random(250), 55);
  triangle(80, -10, -40, 425, 200, 425);
  fill(0);
  rect(60, 0, 40, 60);
 
  fill(random(250), random(250), random(250), 55);
  triangle(280, -10, 160, 425, 400, 425);
  fill(0);
  rect(260, 0, 40, 60);
 
  fill(random(250), random(250), random(250), 55);
  triangle(480, -10, 360, 425, 600, 425);
  fill(0);
  rect(460, 0, 40, 60); //
 
  fill(random(250), random(250), random(250), 55);
  triangle(680, -10, 560, 425, 800, 425);
  fill(0);
  rect(660, 0, 40, 60);
 
  fill(random(250), random(250), random(250), 55);
  triangle(880, -10, 760, 425, 1000, 425);
  fill(0);
  rect(860, 0, 40, 60);
 
  if (time < 80) {
    fill(255);
     
    a1 = a1 +cx1;
    a2 = a2 + cx2;
    a3 = a3 + cx3;
    b1 = b1 + dy1;
    b2 = b2 + dy2;
    b3 = b3 + dy3;
     
    if(a1 > 825 || a1 < 5) {
      cx1 = -cx1;
    }
    if(b1 > 580 || b1 < 490) {
      dy1 = -dy1;
    }
    if(a2 > 818 || a2 < 5) {
      cx2 = -cx2;
    }
    if(b2 > 580 || b2 < 490) {
      dy2 = -dy2;
    }
    if(a3 > 790 || a3 < 5) {
      cx3 = -cx3;
    }
    if(b3 > 580 || b3 < 490) {
      dy3 = -dy3;
    }
  
    text("Nice", a1, b1);
    text("Cute", a2, b2);
    text("Sweet", a3, b3);
  }
 
  if (time > 80) {
    fill(255);
     
    a4 = a4 + cx4;
    a5 = a5 + cx5;
    a6 = a6 + cx6;
    b4 = b4 + dy4;
    b5 = b5 + dy5;
    b6 = b6 + dy6;
     
     if(a4 > 825 || a4 < 5) {
      cx4 = -cx4;
    }
    if(b4 > 580 || b4 < 490) {
      dy4 = -dy4;
    }
    if(a5 > 745 || a5 < 5) {
      cx5 = -cx5;
    }
    if(b5 > 580 || b5 < 495) {
      dy5 = -dy5;
    }
    if(a6 > 765 || a6 < 5) {
      cx6 = -cx6;
    }
    if(b6 > 580 || b6 < 495) {
      dy6 = -dy6;
    }
     
    text("HEAVY", a4, b4);
    text("FUCKING", a5, b5);
    text("METAL", a6, b6);
  }
 
  if(time > 278) {
    background(100);
    time = 0;
  }
 
}


