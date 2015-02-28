

//Candy Skull, by Juan Pablo Patino

int r = 255;
int g = 255;
int b = 255;

void setup() {
  size(400, 400);
  background(0);

  PImage skull = loadImage("candySkull.png");
  image(skull, 50, 20);
}

void draw() {
  fill(0);
  noStroke();
  ellipse(132, 210, 75, 65); // Left Eye Socket (K)
  ellipse(270, 210, 75, 65); // Right Eye Socket (K)
  float leftEyeX = map(mouseX, 0, width, 112, 150); // horz range for leftEyeX
  float rightEyeX = map(mouseX, 0, width, 250, 288); // horz range for rightEyeX
  float leftEyeY = map(mouseY, 0, height, 205, 220); // vert range for leftEyeY
  float rightEyeY = map(mouseY, 0, height, 205, 220); // vert range for rightEyeY
  fill(255,255,255);
  ellipse(201, 48, 30, 30);
  ellipse(leftEyeX, leftEyeY, 30, 30); //left eye ball
  ellipse(rightEyeX, rightEyeY, 30, 30); //right eye ball
}

//Here's where you know that the skull is ALIVE!!!!!!
//Think Indiana Jones, yeah the last one :P, but without Shia LeButthead.

void mouseMoved() { 
  fill(255,255,0);
  ellipse(201, 48, 25, 25);
}  


