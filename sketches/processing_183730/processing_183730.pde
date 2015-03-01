
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

int timer = 4000;

int keys;
float size1;
float size2;
float size3;
float size4;
float size5;
float size6;
float size7;

int keys2;
float size8 = 0 ;
float size9 = 0;
float size10 = 0;
float size11 = 0;
float size12 = 0;
float size13 = 0;
float size14 = 0;

void setup() { 
  size(1000, 700);

  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(0, 20, out.sampleRate());
  out.addSignal(sine);

  ellipseMode(CENTER);
  stroke(255);
}

void draw() {
  Ripple myRipple = new Ripple();

  background(0);
  fill(255,20);
  rect(0, 350, 143, 350);
  rect(143, 350, 143, 350);
  rect(286, 350, 143, 350);
  rect(429, 350, 143, 350);
  rect(572, 350, 143, 350);
  rect(715, 350, 143, 350);
  rect(858, 350, 143, 350);

  fill(255, 20);
  rect(71.5, 350, 143, 175);
  rect(214.5, 350, 143, 175);
  rect(500.5, 350, 143, 175); 
  rect(643.5, 350, 143, 175);
  rect(786.5, 350, 143, 175);

  fill(255);
  textSize(20);
  text("click and move", 360, 330);
  noFill();
  if (mousePressed && mouseY>350) {
    timer = 6000;
    size1 = 0;
    size2 = 0;
    size3 = 0;
    size4 = 0;
    size5 = 0;
    size6 = 0;
    size7 = 0;
  }

  if (timer == 6000 && size1>=0 && size1<1500) {
    sine.setFreq(keys*100);
    myRipple.display();
  } else {
    timer = 5000;
  }

  if (size1 > 1470 && size1 < 1530 && timer == 6000) {
    keys2 = keys;
    size8 = 0;
    size9 = 0;
    size10 = 0;
    size11 = 0;
    size12 = 0;
    size13 = 0;
    size13 = 0;
  }

  if (timer == 5000) {
    if (size8 < 1500) {
      myRipple.repeat();
    } else {
      size8 = 0;
      size9 = 0;
      size10 = 0;
      size11 = 0;
      size12 = 0;
      size13 = 0;
      size13 = 0;
    }
  }

  strokeWeight(mouseX/100);
  line(0, mouseX*-0.7+700, 1000, mouseX*-0.7+700);
  strokeWeight(3);

  if ((mouseX>0 && mouseX<143 && mouseY>525) || (mouseX>0 && mouseX<72 && mouseY>350)) {
    keys = 1;
  }

  if (mouseX>72 && mouseX<215 && mouseY>350 && mouseY<525) {
    keys = 2;
  }

  if (mouseX>143 && mouseX<286 && mouseY>525) {
    keys = 3;
  }

  if (mouseX>215 && mouseX<358 && mouseY>350 && mouseY<525) {
    keys = 4;
  }

  if ((mouseX>286 && mouseX<429 && mouseY>525) || (mouseX>358 && mouseX<429 && mouseY>350)) {
    keys = 5;
  }

  if ((mouseX>429 && mouseX<572 && mouseY>525) || (mouseX>429 && mouseX<501 && mouseY>350)) {
    keys = 6;
  }

  if (mouseX>501 && mouseX<644 && mouseY>350 && mouseY<525) {
    keys = 7;
  }

  if (mouseX>572 && mouseX<715 && mouseY>525) {
    keys = 8;
  }

  if (mouseX>644 && mouseX<787 && mouseY>350 && mouseY<525) {
    keys = 9;
  }

  if (mouseX>715 && mouseX<858 && mouseY>525) {
    keys = 10;
  }

  if (mouseX>787 && mouseX<929 && mouseY>350 && mouseY<525) {
    keys = 11;
  }

  if ((mouseX>858 && mouseX<1000 && mouseY>525) || (mouseX>929 && mouseX<1000 && mouseY>350)) {
    keys = 12;
  }
}

class Ripple {
  void display() {
    noFill();
    stroke(255);
    ellipse(375, 350, size1-12, size1-12);
    ellipse(625, 350, size1-12, size1-12);
    size1 = size1 + keys*3;

    ellipse(375, 350, size2-12, size2-12);
    ellipse(625, 350, size2-12, size2-12);
    size2 = size2 + keys*4;

    ellipse(375, 350, size3-12, size3-12);
    ellipse(625, 350, size3-12, size3-12);
    size3 = size3 + keys*5;

    ellipse(375, 350, size4-12, size4-12);
    ellipse(625, 350, size4-12, size4-12);
    size4 = size4 + keys*6;

    ellipse(375, 350, size5-12, size5-12);
    ellipse(625, 350, size5-12, size5-12);
    size5 = size5 + keys*7;

    ellipse(375, 350, size6-12, size6-12);
    ellipse(625, 350, size6-12, size6-12);
    size6 = size6 + keys*8;

    ellipse(375, 350, size7-12, size7-12);
    ellipse(625, 350, size7-12, size7-12);
    size7 = size7 + keys*9;
  }

  void repeat() {
    noFill();
    stroke(255);
    ellipse(375, 350, size8-12, size8-12);
    ellipse(625, 350, size8-12, size8-12);
    size8 = size8 + keys2*3;

    ellipse(375, 350, size9-12, size9-12);
    ellipse(625, 350, size9-12, size9-12);
    size9 = size9 + keys2*4;

    ellipse(375, 350, size10-12, size10-12);
    ellipse(625, 350, size10-12, size10-12);
    size10 = size10 + keys2*5;

    ellipse(375, 350, size11-12, size11-12);
    ellipse(625, 350, size11-12, size11-12);
    size11 = size11 + keys2*6;

    ellipse(375, 350, size12-12, size12-12);
    ellipse(625, 350, size12-12, size12-12);
    size12 = size12 + keys2*7;

    ellipse(375, 350, size13-12, size13-12);
    ellipse(625, 350, size13-12, size13-12);
    size13 = size13 + keys2*8;

    ellipse(375, 350, size14-12, size14-12);
    ellipse(625, 350, size14-12, size14-12);
    size14 = size14 + keys2*9;
  }
}

