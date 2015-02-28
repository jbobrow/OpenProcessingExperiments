
void setup() {
  size(500, 300);
  smooth();
}

void draw() {
  background(200);
  int x = mouseX; // x-coordinate
  int y = mouseY; // y-coordinate
  int armLength = 170; // Arm Length original 210
  int rad = 100; //radius

  /*click changes arm length*/
  if (mousePressed) {
    if (mouseButton == LEFT) {
      armLength=100;
    } 
    else if (mouseButton == RIGHT) {
      armLength=210;
    } 
    else {
      armLength=170;
    }
  }

  float boosterWidth = armLength/3.5; // Booster Width original 4.2
  int rx = x + armLength; // Right Arm
  int lx = x - armLength; // Left Arm

  /*side bars*/
  stroke(0);
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
  stroke(0, 175);
  fill(50, 240);
  rect(lx+10, y-50, boosterWidth, 100); // left booster
  rect(rx-10-boosterWidth, y-50, boosterWidth, 100); // right booster

  /*fillbars*/
  float w=boosterWidth/3.33;
  int h=100;
  noStroke();
  rect(lx+10, y-50, w, h); // left-left rect
  rect(lx+10+boosterWidth-w, y-50, w, h); // left-right rect
  rect(rx-10-boosterWidth, y-50, w, h); // right-left rect
  rect(rx-10-w, y-50, w, h); // right-right rect

  /*creates circle head*/
  fill(20);
  ellipse(x, y, rad, rad);
  fill(0, 200);
  ellipse(x, y, rad-20, rad-20);

  /*creates face*/
  if (mousePressed) {
    if (mouseButton == RIGHT) {
      fill(206,0,0);
    } 
    else if (mouseButton == LEFT) {
      fill(44,232,55);
    }
  } 
  else {
    fill(199, 199);
  }
  beginShape();
  vertex(x-20, y-20);
  vertex(x+20, y+20);
  vertex(x+20, y-20);
  vertex(x-20, y+20);
  endShape(CLOSE);
}


