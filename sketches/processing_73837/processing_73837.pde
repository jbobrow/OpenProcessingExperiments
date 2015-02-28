
//Kelvin Pan
//Computer Programming 1
//Simon 16/17
//10.3.12
//Roating Cube: Rolling Ball
//Website: awxrus.webs.com OR OpenProcessing

/*
Mouse: Controls Camera
 Mouse Left/Right will also zoom out.
W: Rotate the sphere fowards
S: Roatate the sphere backwards
A: Rotate the sphere to the left
D: Rotate the sphere to the right
Space key: Reset the sphere to its original orientation
 */

//variables
float ballx = 0;
float bally = -50;
float ballz = 0;
float rx = 0;
float ry = 0;
float rz = 0;

//setup
void setup() {
  size(1000, 500, P3D);
  background(0);
  strokeWeight(.7);
  smooth();
}

//draw
void draw() {
  background(255, 255, 255);
  camera(mouseX-250, mouseY-125, mouseX-250, 500 + ballx, 350 + bally, 0 + ballz, 0, 1, 0); //CAMERA ROTATION WITH MOUSE

  //OBJECTS
  translate(500, 350, 0);
  box(1000, 10, 1000); //FLOOR
  translate(ballx, bally, ballz); //BALL SETUP
  rotateX(rx); //BALL
  rotateY(ry);
  rotateZ(rz);
  fill(255, 255, 255);
  sphere(50);
}

//movement
void keyPressed() {
  if (key == 'a') {
    ry = ry + 1;
  }
  if (key == 'd') {
    ry = ry - 1;
  }
  if (key == 'w') {
    rx = rx + .3;
  }
  if (key == 's') {
    rx = rx - .3;
  }
  if (key == ' ') {
    rx = 0;
    ry = 0;
  }
}

void keyReleased() {
  if (key == 'a' || key == 'd') {
    ry = ry;
  }
  if (key == 's' || key == 'w') {
    rx = rx;
  }
}
