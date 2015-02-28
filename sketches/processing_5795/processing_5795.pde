
// define shapes
PShape cup_, head_, wheel_, eye_, buttons, cupholder, speaker, drop;
PShape ball, ball1, ball2, ball3;
PShape music1, music2, music3, cd;
PImage bg, bg2, drop2;

// button colors
color clear = color (200, 255, 255, 100);
color red = color (237, 34, 36);
color yellow = color (246, 235, 22); 
color purple = color (143, 80, 160); 
color green = color (113, 192, 91); 
color blue = color (69, 85, 165); 
color orange = color (249, 159, 27); 
color white = color (255); 
color magenta = color (206, 76, 140); 
color teal = color (68, 195, 211);

// variables
float w, h, e, a, s, x, z, d, d1, d2;
int y = 338;
float angle = 0.0;
float wangle = 0.0;
float speed;



void setup() {
  size(320, 480);
  smooth();
  strokeCap(ROUND);

  // load shapes & images
  cup_ = loadShape("cup.svg");
  cupholder = loadShape("cupholder.svg");
  head_ = loadShape("head.svg");
  wheel_ = loadShape("wheel.svg");
  speaker = loadShape("wheel2.svg");
  eye_ = loadShape("eye.svg");
  ball = loadShape("ball.svg");
  ball1 = loadShape("ball1.svg");
  ball2 = loadShape("ball2.svg");
  ball3 = loadShape("ball3.svg");
  cd = loadShape("cd.svg");
  music1 = loadShape("music1.svg");
  music2 = loadShape("music2.svg");
  music3 = loadShape("music3.svg");
  buttons = loadShape("buttons.svg");
  bg = loadImage("bgimg.png");
  bg2 = loadImage("bgimg2.png");
  drop2 = loadImage("drop.png");
}


void draw() {
  background(255);
  bg();
  robot();
}


void robot() {          // DRAWING THE ROBOT
  music();
  translate(160, 0);
  neck1();
  head1();
  antenna1();
  eyes1();
  discoball();
  cup1();
  drink1();
  drops();
  buttons1();
  cd();
  wheel1();
}


void bg() {          // BACKGROUNND
  float mx = map(mouseX, 0, 320, 0, -430);
  image(bg, mx, 0);
}


void neck1() {          // NECK
  strokeWeight(map(mouseX, 0, constrain(mouseX, 200, 320), 14, 80));
  stroke(80);
  line(0, 202, 0, y);

  strokeWeight(4);
  stroke(0);
  line(map(mouseX, 0, constrain(mouseX, 200, 320), 7, 40), 202, map(mouseX, 0, constrain(mouseX, 200, 320), 7, 40), y+20);
  line(map(mouseX, 0, constrain(mouseX, 200, 320), -7, -40), 202, map(mouseX, 0, constrain(mouseX, 200, 320), -7, -40), y+20);
}


void head1() {          // HEAD
  pushMatrix();
  translate(0, map(mouseX, 0, constrain(mouseX, 200, 320), 142, 122));
  shape(head_, h-72.5, 0); 
  popMatrix();
}


void antenna1() {          // ANTENNA
  // stick
  if(mouseX < 10) {
    stroke(95);
  } 
  pushMatrix();
  strokeWeight(5);
  translate(27, map(mouseX, 0, constrain(mouseX, 200, 320), 161, 141));
  rotate(PI * 1.083);
  line(0, 0, 0, map(mouseX, 0, constrain(mouseX, 200, 320), 0, 63));

  // red light
  translate(0, map(mouseX, 0, constrain(mouseX, 200, 320), 0, 63));
  strokeWeight(2);
  fill(237, 28, 36);
  ellipse(0, 0, map(mouseX, 0, constrain(mouseX, 200, 320), 0, 10), map(mouseX, 0, constrain(mouseX, 200, 320), 0, 10));
  popMatrix();
}


void discoball() {          // DISCO BALL
  // head opening
  pushMatrix();
  translate(0, map(mouseX, 0, constrain(mouseX, 200, 320), 0, -20));
  shape(cupholder, -24.5, 107); 

  // disco ball
  shapeMode(CENTER);
  pushMatrix();
  strokeWeight(3);
  stroke(0);
  translate(0, 160);
  line(0, 0, 0, map(mouseX, constrain(mouseX, 0, 120), constrain(mouseX, 200, 320), 0, -52));
  popMatrix();
  if(mouseX < 200) {
    noStroke();
  }  
  strokeWeight(2);
  fill(random(100, 200));
  z = z + 1;
  if(z > 0) {
    ellipse(0, 107, map(mouseX, constrain(mouseX, 0, 200), 320, 0, 50), map(mouseX, constrain(mouseX, 0, 200), 320, 0, 50));
    shape(ball, 0, 107, map(mouseX, constrain(mouseX, 0, 200), 320, 0, 60), map(mouseX, constrain(mouseX, 0, 200), 320, 0, 60)); 
  }  
  if(z > 3) {
    ellipse(0, 107, map(mouseX, constrain(mouseX, 0, 200), 320, 0, 50), map(mouseX, constrain(mouseX, 0, 200), 320, 0, 50));
    shape(ball1, 0, 107, map(mouseX, constrain(mouseX, 0, 200), 320, 0, 60), map(mouseX, constrain(mouseX, 0, 200), 320, 0, 60)); 
  }  
  if(z > 6) {
    ellipse(0, 107, map(mouseX, constrain(mouseX, 0, 200), 320, 0, 50), map(mouseX, constrain(mouseX, 0, 200), 320, 0, 50));
    shape(ball2, 0, 107, map(mouseX, constrain(mouseX, 0, 200), 320, 0, 60), map(mouseX, constrain(mouseX, 0, 200), 320, 0, 60)); 
  }  
  if(z > 9) {
    ellipse(0, 107, map(mouseX, constrain(mouseX, 0, 200), 320, 0, 50), map(mouseX, constrain(mouseX, 0, 200), 320, 0, 50));
    shape(ball3, 0, 107, map(mouseX, constrain(mouseX, 0, 200), 320, 0, 60), map(mouseX, constrain(mouseX, 0, 200), 320, 0, 60)); 
  }  
  if(z > 12) {
    z = 0;
  }
}


void cup1() {          // CUP
  translate(0, map(mouseX, constrain(mouseX, 0, 100), constrain(mouseX, 200, 320), 0, 58.1504/2) + (58.1504 / 2));
  shape(cup_, 0, 107, map(mouseX, constrain(mouseX, 0, 100), constrain(mouseX, 200, 320), 48, 0), map(mouseX, constrain(mouseX, 0, 100), constrain(mouseX, 200, 320), 58.1504, 0)); 
  popMatrix();
  pushMatrix();
  translate(0, map(mouseX, 0, constrain(mouseX, 200, 320), 0, -20));
  translate(0, map(mouseX, constrain(mouseX, 0, 200), 320, 60/2, 0) + (60/2));
  popMatrix();
  shapeMode(CORNER);
}


void drink1() {          // DRINK
  pushMatrix();
  translate(0, map(mouseX, 0, constrain(mouseX, 200, 320), 0, -20));
  stroke(0);
  strokeWeight(0);

  color water = color (200, 255, 255, 100 - mouseX);
  fill(water);
  noStroke();
  beginShape();
  vertex(h-19, 128);
  bezierVertex(h-19, 128, h-8, 124, h-1, 125);
  bezierVertex(h+6, 126, h+8, 128, h+12, 126);
  bezierVertex(h+16, 125, h+20, 126, h+19, 128);
  bezierVertex(h+19, 128, h+14, 162, h+14, 162);
  bezierVertex(h+10, 163, h-5, 164, h-14, 162);
  bezierVertex(h-14, 162, h-19, 128, h-19, 128);
  endShape();

  beginShape();
  vertex(h-19, 128);
  bezierVertex(h-19, 128, h-8, 124, h-1, 125);
  bezierVertex(h+6, 126, h+8, 128, h+12, 126);
  bezierVertex(h+16, 125, h+20, 126, h+19, 128);
  bezierVertex(h+19, 128, h+20, 131, h+12, 131);
  bezierVertex(h+4, 131, h-1, 130, h-7, 132);
  bezierVertex(h-14, 134, h-19, 128, h-19, 128);
  endShape();
  stroke(0);
}


void drops() {          // DROPLETS  
  tint(255, map(mouseX, 0, constrain(mouseX, 100, 320), 255, 0));
  if(d < 125) {
    float speed = map(mouseY, 0, 480, random(1), random(10));
    d = d + speed;
    image(drop2, 0, d);
  }
  if(d1 < 125) {
    float speed1 = map(mouseY, 0, 480, random(2), random(11));
    d1 = d1 + speed1;
    image(drop2, 5, d1);
  }
  if(d2 < 125) {
    float speed2 = map(mouseY, 0, 480, random(3), random(12));
    d2 = d2 + speed2;
    image(drop2, -3, d2);
  }
  if(d > 125) {
    d = 0;
  }
  if(d1 > 125) {
    d1 = 0;
  }
  if(d2 > 125) {
    d2 = 0;
  }
  noTint();
  popMatrix();
}


void wheel1() {          // WHEEL & SPEAKER
  pushMatrix();
  translate(0, map(mouseX, 0, constrain(mouseX, 200, 320), y, (y + 20)));
  rotate(-mouseX);
  if(mouseX < 200) {
    rotate(wangle);
    shape(wheel_, -48.5, -48.5);
    wangle = wangle - map(mouseY, 0, 480, 0, -.1);
  }
  if(mouseX > 199) {
    shapeMode(CENTER);
    float r = map(mouseY, 0, 480, random(83, 93), random(102, 120));
    shape(speaker, 0, 0, r, r);
    shapeMode(CORNER);
  }
  popMatrix();
}


void eyes1() {          // EYES
  // shape
  pushMatrix();
  translate(0, map(mouseX, 0, constrain(mouseX, 200, 320), 210.5, 210.5-20));
  shape(eye_, e-51.5, 0); 
  shape(eye_, e+35.5, 0);
  popMatrix();
}


void buttons1() {          // BUTTONS
  pushMatrix();
  translate(0, map(mouseX, 0, constrain(mouseX, 200, 320), 0, -20));
  noStroke();
  float q = map(mouseY, 0, 480, 0, 255);
  fill(random(0, 255), random(0, 255), random(0, 255), q);
  rect(e-9, 226, 5, 5);
  fill(random(0, 255), random(0, 255), random(0, 255), q);
  rect(0, 226, 5, 5);
  fill(random(0, 255), random(0, 255), random(0, 255), q);
  rect(e+9, 226, 5, 5);
  fill(random(0, 255), random(0, 255), random(0, 255), q);
  rect(e-9, 235, 5, 5);
  fill(random(0, 255), random(0, 255), random(0, 255), q);
  rect(0, 235, 5, 5);
  fill(random(0, 255), random(0, 255), random(0, 255), q);
  rect(e+9, 235, 5, 5);
  fill(random(0, 255), random(0, 255), random(0, 255), q);
  rect(e-9, 244, 5, 5);
  fill(random(0, 255), random(0, 255), random(0, 255), q);
  rect(0, 244, 5, 5);
  fill(random(0, 255), random(0, 255), random(0, 255), q);
  rect(e+9, 244, 5, 5);

  shapeMode(CENTER);
  shape(buttons, 0, 235);
  shapeMode(CORNER);
  popMatrix();
  stroke(0);
}


void cd() {          // CD
  // box
  strokeWeight(2);
  if(mouseX < 5) {
    noStroke();
    noFill();
  }
  pushMatrix();
  translate(0, 275);
  fill(50);
  rectMode(CENTER);
  rect(0, 0, map(mouseX, 0, constrain(mouseX, 200, 320), 0, 60), map(mouseX, 0, constrain(mouseX, 200, 320), 0, 60));

  // cd
  strokeWeight(1);
  fill(200);
  shapeMode(CENTER);
  if(mouseX < 310 && mouseX > 200) {
    fill(random(0, 255), random(0, 255), random(0, 255));
  }
  if(mouseX < 200) {
    noStroke();
    noFill();
  }
  rotate(angle);
  ellipse(0, 0, map(mouseX, constrain(mouseX, 0, 200), 320, 0, 50), 50);
  shape(cd, 0, 0, map(mouseX, constrain(mouseX, 0, 200), 320, 0, 50), 50);
  angle = angle - map(mouseY, 0, 480, .01, .2);
  shapeMode(CORNER);
  fill(255);
  ellipse(0, 0, map(mouseX, constrain(mouseX, 0, 200), 320, 0, 17), 17);
  fill(50);
  ellipse(0, 0, map(mouseX, constrain(mouseX, 0, 200), 320, 0, 7), 7);
  noFill();
  ellipse(0, 0, map(mouseX, constrain(mouseX, 0, 200), 320, 0, 50), 50);
  popMatrix();
}


void music() {          // MUSIC NOTES
  if(mouseX > 300) {
    shape(music1, random(220, 225), random(265, 266));
    shape(music2, random(50, 55), random(248, 249));
    shape(music3, random(80, 85), random(282, 285));
  }
}



