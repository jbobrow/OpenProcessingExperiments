
float rotation=0;

void setup() {
  size(850, 600, P3D);
  strokeWeight(.5);
  textSize(10);
  stroke(255, 255, 255);
}

void draw() {
  background(0);
  float orbitRadius= 60/2+50;
  float ypos= 50/3;
  float xpos= cos(radians(rotation))*orbitRadius;
  float zpos= sin(radians(rotation))*orbitRadius;
  noFill();
  camera(xpos, ypos, zpos, 0, 0, 0, 0, -1, 0);
  sphere(60);
  fill(zpos*3, xpos*2, 255);
  translate(1, 0, -5);
  box(30);
  translate(3, -20, 15);
  box(20);
  translate(-5, 8, 10);
  box(15);
  translate(13, -14, -18);
  box(10);
  noFill();
  translate(-xpos,49,10);
  sphere(8);
  translate(-zpos,-50,-25);
  sphere(7);
  rotation++;
}


