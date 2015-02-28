
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim = new Minim(this);
AudioSample car;
int x=-880;
PImage a;
int count =0;
void setup() {
  size(400, 300);
  smooth();
  a=loadImage("front_street_calming.jpg");
   car = minim.loadSample("Slow.mp3");
   
}
void draw() {
  background(255);

  if (keyPressed) {
  }
  if (key==CODED) {
    if (keyCode==LEFT) {
      if(count==0){
car.trigger();
count=1;
      }
      image(a, x+=4, -600);
      rectMode(CORNER);
      translate(0, -20);
      rotate(PI/30);
      rect(100, 90, 20, 10);
      fill(255, 38, 0);
      quad(50, 100, 55, 140, 340, 140, 340, 100);
      fill(10);
      ellipse(100, 140, 40, 40);
      ellipse(270, 140, 40, 40);
      fill(200);
      ellipse(100, 140, 20, 20);
      ellipse(270, 140, 20, 20);
      fill(0);
      ellipse(100, 140, 2, 2);
      ellipse(270, 140, 2, 2);
      fill(170);
      quad(160, 100, 180, 60, 270, 63, 300, 100);
      line(230, 110, 237, 110);
      fill(0);
      quad(167, 100, 180, 64, 250, 68, 270, 100);
      line(160, 100, 160, 140);
      line(240, 100, 240, 140);
      fill(255);
      quad(53, 141, 57, 141, 57, 130, 53, 130);
      quad(338, 141, 342, 141, 342, 130, 338, 130);
    }
    else if (keyCode==RIGHT) {
      //PImage a;
      //a=loadImage("front_street_calming.jpg");
      car.stop();
      count=0;
      image(a, x-=3, -600);
      rect(100, 90, 30, 10);
      fill(255, 38, 0);
      quad(50, 100, 55, 140, 340, 140, 340, 100);
      fill(10);
      ellipse(100, 140, 40, 40);
      ellipse(270, 140, 40, 40);
      fill(200);
      ellipse(100, 140, 20, 20);
      ellipse(270, 140, 20, 20);
      fill(0);
      ellipse(100, 140, 2, 2);
      ellipse(270, 140, 2, 2);
      fill(170);
      quad(160, 100, 180, 60, 270, 63, 300, 100);
      line(230, 110, 237, 110);
      fill(0);
      quad(167, 100, 180, 64, 250, 68, 270, 100);
      line(160, 100, 160, 140);
      line(240, 100, 240, 140);
      fill(255);
      quad(53, 141, 57, 141, 57, 130, 53, 130);
      quad(338, 141, 342, 141, 342, 130, 338, 130);
    }
    else {
      image(a, x, -600);
      rect(100, 90, 30, 10);
      fill(255, 38, 0);
      quad(50, 100, 55, 140, 340, 140, 340, 100);
      fill(10);
      ellipse(100, 140, 40, 40);
      ellipse(270, 140, 40, 40);
      fill(200);
      ellipse(100, 140, 20, 20);
      ellipse(270, 140, 20, 20);
      fill(0);
      ellipse(100, 140, 2, 2);
      ellipse(270, 140, 2, 2);
      fill(170);
      quad(160, 100, 180, 60, 270, 63, 300, 100);
      line(230, 110, 237, 110);
      fill(0);
      quad(167, 100, 180, 64, 250, 68, 270, 100);
      line(160, 100, 160, 140);
      line(240, 100, 240, 140);
      fill(255);
      quad(53, 141, 57, 141, 57, 130, 53, 130);
      quad(338, 141, 342, 141, 342, 130, 338, 130);
    }
  }
  else {
    image(a, x, -600);
    rect(100, 90, 30, 10);
    fill(255, 38, 0);
    quad(50, 100, 55, 140, 340, 140, 340, 100);
    fill(10);
    ellipse(100, 140, 40, 40);
    ellipse(270, 140, 40, 40);
    fill(200);
    ellipse(100, 140, 20, 20);
    ellipse(270, 140, 20, 20);
    fill(0);
    ellipse(100, 140, 2, 2);
    ellipse(270, 140, 2, 2);
    fill(170);
    quad(160, 100, 180, 60, 270, 63, 300, 100);
    line(230, 110, 237, 110);
    fill(0);
    quad(167, 100, 180, 64, 250, 68, 270, 100);
    line(160, 100, 160, 140);
    line(240, 100, 240, 140);
    fill(255);
    quad(53, 141, 57, 141, 57, 130, 53, 130);
    quad(338, 141, 342, 141, 342, 130, 338, 130);
  }
}


