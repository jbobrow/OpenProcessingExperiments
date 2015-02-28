
//Taj Mahal (I hope)
float camX = 200;
float camY = 200;
float camZ = (200) / tan(PI*30.0 / 180.0);
float centerX = 200;
float centerY = 200;
boolean left = false;
boolean right = false;
boolean up = false;
boolean down = false;
boolean left2 = false;
boolean right2 = false;
boolean up2 = false;
boolean down2 = false;
boolean back = false;
boolean forward = false;


void setup() {
  size(400, 400, P3D);
}

void draw() {
  camera(camX, camY, camZ, centerX, centerY, 0, 0, 1, 0);

  lights();
  background(255);

  pushMatrix();
  translate(200, 350, -80);
  box(400, 20, 200);
  popMatrix();


  pushMatrix();
  translate(200, 275, 35);
  box(240, 100, 30);
  popMatrix();

  pushMatrix();
  translate(30, 250, 15);
  box(20, 175, 20);
  popMatrix();


  pushMatrix();
  translate(370, 250, 15);
  box(20, 175, 20);
  popMatrix();

  pushMatrix();
  translate(30, 250, -100);
  box(20, 175, 20);
  popMatrix();


  pushMatrix();
  translate(370, 250, -100);
  box(20, 175, 20);
  popMatrix();

  pushMatrix();
  translate(30, 150, 15);
  noStroke();
  sphere(12);
  stroke(0);
  popMatrix();


  pushMatrix();
  translate(370, 150, 15);
  noStroke();
  sphere(12);
  stroke(0);
  popMatrix();

  pushMatrix();
  translate(30, 150, -100);
  noStroke();
  sphere(12);
  stroke(0);
  popMatrix();


  pushMatrix();
  translate(370, 150, -100);
  noStroke();
  sphere(12);
  stroke(0);
  popMatrix();

  pushMatrix();
  translate(130, 215, 35);
  box(20);
  popMatrix();

  pushMatrix();
  translate(130, 195, 35);
  noStroke();
  sphere(20);
  stroke(0);
  popMatrix();

  pushMatrix();
  translate(260, 215, 35);
  box(20);
  popMatrix();

  pushMatrix();
  translate(260, 195, 35);
  noStroke();
  sphere(20);
  stroke(0);
  popMatrix();

  pushMatrix();
  translate(200, 215, 15);
  box(40);
  popMatrix();

  pushMatrix();
  translate(200, 175, 25);
  noStroke();
  sphere(40);
  stroke(0);
  popMatrix();

  movement();
}

void keyPressed() {
  switch(key) {
  case'a':
    left = true;
    break;
  case 'd':
    right = true;
    break;
  case 'w':
    up = true;
    break;
  case 's':
    down = true;
    break;
  case'j':
    left2 = true;
    break;
  case 'l':
    right2 = true;
    break;
  case 'i':
    up2 = true;
    break;
  case 'k':
    down2 = true;
    break;
  case 't':
    back = true;
    break;
  case 'g':
    forward = true;
    break;
  }
}

void keyReleased() {
  switch(key) {
  case'a':
    left = false;
    break;
  case 'd':
    right = false;
    break;
  case 'w':
    up = false;
    break;
  case 's':
    down = false;
    break;
  case'j':
    left2 = false;
    break;
  case 'l':
    right2 = false;
    break;
  case 'i':
    up2 = false;
    break;
  case 'k':
    down2 = false;
    break;
  case 't':
    back = false;
    break;
  case 'g':
    forward = false;
    break;
  }
}


void movement() {
  if (up)camY -= 3;
  if (down)camY += 3;
  if (left)camX -= 3;
  if (right)camX += 3;
  if (up2)centerY -= 3;
  if (down2)centerY += 3;
  if (left2)centerX -= 3;
  if (right2)centerX += 3;
  if (back)camZ -= 3;
  if (forward) camZ += 3;
}



