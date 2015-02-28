
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// CHOI Jihye Your Name
// 201420116: Your ID number

void setup() {
  size(600, 600);
  smooth();
  frameRate(1);
  colorMode(RGB);
}

void draw() {
  background(255);
  noStroke();
  int x = second();
  int y = minute();
  int z = hour();
  float x1 = map(x, 0, 60, 0, 599);
  float y1 = map(y, 0, 60, 0, 599);
  float z1 = map(z, 0, 23, 0, 599);

  //seconds bar
  fill(random(255), random(255), random(255), 255);
  rect(0, 50, x1, 30);  
  //minutes bar
  fill(0);
  rect(300, 0, 15, y1); 
  //hours bar
  fill(#FF0000);
  rect(600, 400, -z1, 40); 

  //seconds text
  textSize(35);
  fill(255);
  text(int(x), x1-40, 78);
  //minutes text
  textSize(50);
  fill(0);
  text(int(y), 290, y1+40);
  //hour text
  textSize(100);
  fill(0);
  text(int(z), z1, 460);
}

