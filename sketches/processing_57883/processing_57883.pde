
float angle = 0.0;
float offset = 500/3; //controls positioning of motion
float scalar = 60; //controls radius of circular motion
float speed = 0.01;
PImage space;

void setup() {
  size(500, 300);
  smooth();
  space = loadImage("spacev01.jpg");
}

void draw() {
  //  background(200);
  image(space, 0, 0, 500, 300);
  //  int x = mouseX; // x-coordinate
  //  int y = mouseY; // y-coordinate
  float x = offset + cos(angle) * scalar; //makes the robot float in a circle
  float y = offset + sin(angle) * scalar;
  angle += speed;
  int armLength = 170; // Arm Length original 210
  int rad = 100; //radius

  /*click changes arm length*/
  if (mousePressed) {
    if (mouseButton == LEFT) {
      armLength=100; //makes arms shorter
    } 
    else if (mouseButton == RIGHT) {
      armLength=210; //makes arms longer
    } 
    else {
      armLength=170;
    }
  }

  float boosterWidth = armLength/3.5; // Booster Width original 4.2
  float rx = x + armLength; // Right Arm
  float lx = x - armLength; // Left Arm

  /*side bars*/
  stroke(139, 162, 173);
  /*left arm*/
  line(lx, y-15, x, y-15);
  line(lx, y-7.5, x, y-7.5);
  line(lx, y, x, y);
  line(lx, y+7.5, x, y+7.5);
  line(lx, y+15, x, y+15);

  /*right arm*/
  line(x, y-15, rx, y-15);
  line(x, y-7.5, rx, y-7.5);
  line(x, y, rx, y);
  line(x, y+7.5, rx, y+7.5);
  line(x, y+15, rx, y+15);

  /*boosters*/
  stroke(157, 157, 157, 175);
  fill(157, 157, 157, 240);
  rect(lx+10, y-50, boosterWidth, 100); // left booster
  rect(rx-10-boosterWidth, y-50, boosterWidth, 100); // right booster

  /*fillbars*/
  float w=boosterWidth/3.33;
  int h=100;
  noStroke();
  fill(120, 120, 120, 200);
  rect(lx+10, y-50, w, h); // left-left rect
  rect(lx+10+boosterWidth-w, y-50, w, h); // left-right rect
  rect(rx-10-boosterWidth, y-50, w, h); // right-left rect
  rect(rx-10-w, y-50, w, h); // right-right rect

  /*creates circle head*/
  stroke(80, 80, 80);
  fill(180, 180, 180);
  ellipse(x, y, rad, rad); //bigger circle
  noStroke();
  fill(232, 232, 232, 200);
  ellipse(x, y, rad-20, rad-20); //smaller circle

  /*creates face*/
  if (mousePressed) {
    if (mouseButton == RIGHT) {
      fill(206, 0, 0); //turns eyes red
    } 
    else if (mouseButton == LEFT) {
      fill(44, 232, 55); //turns eyes green
    }
  } 
  else {
    fill(191, 234, 255, 199);
  }
  beginShape();
  stroke(80, 80, 80);
  vertex(x-20, y-20);
  vertex(x+20, y+20);
  vertex(x+20, y-20);
  vertex(x-20, y+20);
  endShape(CLOSE);
}


