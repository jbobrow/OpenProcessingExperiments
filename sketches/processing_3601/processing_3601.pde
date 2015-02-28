




FKBox seeSaw;
float rotx = -PI / 2 + PI / 20f;
float roty = -PI / 2 - PI / 10f;

float mouseXwhenNotPressed = width / 2;
float mouseYhenNotPressed = 0;


void setup() {
  size(600, 600, P3D);
  //smooth();
  rectMode(CORNERS);

  int W = color(255);

  seeSaw = new FKBox(this, -50f, -10f, 50f, 10f, 0f, W);			
  addNode(addNode(addNode(addNode(addNode(seeSaw)))));
}

FKBox addNode(FKBox parent) {
  FKBox aNewNode = new FKBox(this, -2f, 0, 2f, 90f, 0f, color(128));
  parent.attach(aNewNode, 0,  parent.h / 2f);
  return aNewNode;
}

void draw() {
  background(99);
  stroke(0);

  // Change height of the camera with mouseY
  float distZ = 575.0f;

  float xCam = 300 + distZ * sin(rotx) * cos(roty);
  float yCam = 300 + distZ * cos(rotx);
  float zCam = distZ * sin(rotx) * sin(roty);

  camera(xCam, yCam, zCam, // eyeX, eyeY, eyeZ
  300f, 300f, 0.0f, // centerX, centerY, centerZ
  0.0f, 1.0f, 0.0f); // upX, upY, upZ

  // Orange point light on the right
  pointLight(150, 100, 0, // Color
  300, -150, 0); // Position

  // Blue directional light from the left
  directionalLight(0, 102, 255, // Color
  -1, 0, 0); // The x-, y-, z-axis direction

  // Yellow spotlight from the front
  spotLight(255, 255, 109, // Color
  400, 250, 375, // Position
  0f, -0.5f, -0.5f, // Direction
  PI, 0.1f); // Angle, concentration

  ellipseMode(CENTER);
  ellipse(width / 2, height / 2, 80, 80);

  translate(width / 2, height / 2);

  strokeWeight(2);

  if (mousePressed == false) {
    mouseXwhenNotPressed = mouseX;
    mouseYhenNotPressed = mouseY;
  }

  if (mousePressed == false || mouseButton == LEFT) {

    float force = (float) (mouseXwhenNotPressed) / (float) (width)
      * 0.4f - 0.2f;
    float decay = (float) (mouseYhenNotPressed) / (float) (height)
      * 0.02f + 0.01f;

    seeSaw.impulse(force, decay);

    float friction = 0.92f;
    seeSaw.move(friction);
  }

  seeSaw.draw();

}


void mouseDragged() {
  float dy = mouseX - pmouseX;
  float dx = mouseY - pmouseY;

  float rate = 0.008f;
  if (abs(dx) > abs(dy)) {
    rotx -= (dx) * rate;
    rotx = java.lang.Math.min(rotx, 0 - 0.01f);
    rotx = java.lang.Math.max(rotx, -PI + 0.01f);

  } 
  else {
    roty += (dy) * rate;
  }

}



