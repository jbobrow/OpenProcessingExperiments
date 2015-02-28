
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: JU Hwiyeon
// ID: 201420109

float x = 0;
float y = 0;
float xspeed = 5;
float yspeed = 7;
float i = 0;
float j = 0;
float ispeed = 4;
float jspeed = 3;
float x1Pos = 0;
float x2Pos = 0;
float y1Pos = 0;
float y2Pos = 0;
float diameter = 30;
float xdestination;
float ydestination;
float angle;
float angleN = 0.01;

void setup() {
  size (600, 600);
  smooth();
}

void draw() {
  background (#020203);

  float xdistance = xdestination - x2Pos;
  float ydistance = ydestination - y2Pos;
  x = x + xspeed;
  y = y + yspeed;
  i = i + ispeed;
  j = j + jspeed;
  x1Pos = x1Pos + 1;
  y1Pos = y1Pos + 1; 
  x2Pos = x2Pos + xdistance / 60;
  y2Pos = y2Pos + ydistance / 60;
  xdestination = width + diameter * 2;
  ydestination = height + diameter * 2;

  if (x1Pos > width + diameter) {
    x1Pos = -diameter;
  }

  if (y1Pos > height + diameter) {
    y1Pos = -diameter;
  }

  if (x2Pos > width + diameter) {
    x2Pos = -diameter;
  }

  if (y2Pos > height + diameter) {
    y2Pos = -diameter;
  }

  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }

  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }

  if ((i > width) || (i < 0)) {
    ispeed = ispeed * -1;
  }

  if ((j > height) || (j < 0)) {
    jspeed = jspeed * -1;
  }
  //Rect
  rectMode(CENTER);
  for (float H = 0; H <= width; H = H +50) {
    rect (x1Pos, H, diameter, diameter);
    rect (H, y1Pos, diameter, diameter);
    rect (x2Pos, height / 3, diameter, diameter);
    rect (width / 3, y2Pos, diameter, diameter);
  }
  strokeWeight(5);

  //Rotate Circles
  fill(random(255));
  pushMatrix();
  translate(width/4, height/4);
  angle = angle + angleN;
  rotate (angle);
  stroke(0);
  for (float a = 0; a <= width/4; a = a+ 30) { 
    for (float b = 0; b <= height/4; b = b+ 30) { 
      ellipse (a, b, 50, 50);
    }
  }
  popMatrix();

  Zoo(400, 400);


  stroke(255);
  strokeWeight(10);
  fill (#15982A, 120);
  triangle (x, y, width-x, height-y, x/2, y);
  fill (#DBA100, 120);
  triangle (x, y, width-x, height-y, x, y/2);
  fill (#7888ED, 120);
  triangle (i, j, width, height, width-i, height-j);
}

void Zoo (float a, float b) {
  pushMatrix();
  fill(0);
  stroke(255);
  translate(a, b);
  rotate (-angle);
  for (int i = 75; i < width/4; i = i + 10) {
    for (int j = 75; j < height/4; j = j + 10) {
      rotate(3.0);
      rotate(6.0);
      ellipse(i, 30, 30, 30);
    }
  }
  popMatrix();
}

