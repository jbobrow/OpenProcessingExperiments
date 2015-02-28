
PImage space;

void setup () {
  size (800, 800);
  background(0);
  space = loadImage("http://imgsrc.hubblesite.org/hu/db/images/hs-2010-22-a-large_web.jpg");
}

void draw() {
  tint(100);
  image(space,0,0);
  smooth ();
  noFill ();
  strokeWeight(2);
  stroke (64);

  line (0, 400, 800, 400);
  line (400, 0, 400, 800);
  line (0, 0, 800, 800);
  line (0, 800, 800, 0);

  sun();
  stroke (64);
  ellipse (400, 400, 120, 120);
  p1();
  stroke (64);
  ellipse (400, 400, 250, 250);
  p2();
  ellipse (400, 400, 330, 330);
  p3 ();
  ellipse (400, 400, 550, 550);
  p4();
  ellipse (400, 400, 700, 700);
  p5();
}

void sun () {
  noStroke();
  fill (255, 128, 23);
  beginShape();
  vertex (390, 380);
  vertex (400, 360);
  vertex (410, 380);

  vertex (430, 370);

  vertex (422, 392);
  vertex (440, 400);
  vertex (422, 407);

  vertex (430, 430);

  vertex (410, 420);
  vertex (400, 440);
  vertex (390, 420);

  vertex (372, 430);

  vertex (380, 407);
  vertex (360, 400);
  vertex (380, 392);

  vertex (370, 370);
  endShape();

  fill (247, 213, 40);
  ellipse(400, 400, 50, 50);
  noFill();
}

void p1 () { //10-second period
  float amp1 = 60;
  float per1 = .0001;
  float xPos1 = 400 + amp1 * sin((millis()*per1)*(2*PI));
  float yPos1 = 400 + amp1 * cos(millis()*per1*(2*PI));
  fill (21, 71, 170);
  noStroke();
  ellipse (xPos1, yPos1, 12, 12);
  stroke (64);
  noFill();
}

void p2 () { //20-second period
  float amp2 = 125;
  float per2 = .00005;
  float xPos2 = 400 + amp2 * sin(millis()*per2*(2*PI));
  float yPos2 = 400 + amp2 * cos(millis()*per2*(2*PI));
  fill (175, 0, 41);
  noStroke();
  ellipse (xPos2, yPos2, 28, 28);
  stroke (64);
  noFill();
}

void p3 () { //100-second period
  float amp3 = 165;
  float per3 = .00001;
  float xPos3 = 400 + amp3 * sin(millis()*per3*(2*PI));
  float yPos3 = 400 + amp3 * cos(millis()*per3*(2*PI));
  fill (2, 173, 20);
  noStroke();
  ellipse (xPos3, yPos3, 22, 22);
  stroke (64);
  noFill();
}

void p4 () { //200-second period
  float amp4 = 275;
  float per4 = .000005;
  float xPos4 = 400 + amp4 * sin(millis()*per4*(2*PI));
  float yPos4 = 400 + amp4 * cos(millis()*per4*(2*PI));
  fill (25, 130, 255);
  noStroke();
  ellipse (xPos4, yPos4, 40, 40);
  strokeWeight(6);
  stroke (70,0,185);
  noFill();
  beginShape();
  curveVertex (xPos4, yPos4-8);
  curveVertex (xPos4-21,yPos4-4);
  curveVertex (xPos4-40, yPos4);
  curveVertex (xPos4, yPos4+8);
  curveVertex (xPos4+40, yPos4);
  curveVertex (xPos4+21, yPos4-4);
  curveVertex (xPos4, yPos4-8);
  endShape();
  noFill();
  strokeWeight(2);
  stroke (64);
}

void p5 () { //1000-second period
  float amp5 = 350;
  float per5 = .000001;
  float xPos5 = 400 + amp5 * sin(millis()*per5*(2*PI));
  float yPos5 = 400 + amp5 * cos(millis()*per5*(2*PI));
  fill (185, 0, 140);
  noStroke();
  ellipse (xPos5, yPos5, 50, 50);
  fill (72,0,54);
  ellipse (xPos5-10,yPos5-3, 4,4);
  ellipse (xPos5+9,yPos5-5, 4,4);
  ellipse (xPos5-3,yPos5-9, 4,4);
  ellipse (xPos5+20,yPos5+5, 4,4);
  ellipse (xPos5-15,yPos5-10, 6,6);
  ellipse (xPos5-3,yPos5+15, 8,8);
  ellipse (xPos5+7,yPos5+5, 6,6);
  ellipse (xPos5-14,yPos5+9, 4,4);
  ellipse (xPos5+8,yPos5-15, 4,4);
  noFill();
}
