
float delta = 5;
float degree = 0;
float degree2 = 0;
PFont font;

float cnt = 0;
float r = 10; // bear radius
float r2 = 800; // background radius

boolean rotate = true;
boolean button1 = false;
boolean button2 = false;
boolean button3 = false;
boolean button4 = false;

int x = 340;
int y = -280;
int z = 0;
int x2 = 400;
int y2 = -280;
int x3 = 460;
int y3 = -280;
int x4 = 460;
int y4 = 280;
int sz = 35;

void setup() {
  size(600, 600, P3D);
  frameRate(60);
}


void draw() {
  background(150);
  font = loadFont("AdobeGothicStd-Bold-20.vlw");
  translate(width/2, height/3, 0); // makes the screen center as (0,0,0) 
  rotate(PI/2);
  scale(0.7);

  drawButton();

  if (button4) {
    rotateX(radians(mouseX));
  }

  rotateX(radians(270));
  drawBody();
  drawLeftArm();
  drawRightArm();
  drawLeftLeg();
  drawRightLeg();


  ////////////////////////////////////////////////
  //button setting


    if (!button1 && !button2 && !button3) {
    drawHead();
  } else if (button1 && !button2 && !button3) { 
    cnt = 0.3;
    moveHead();
  }

  if (!button1 && !button2 && !button3) {
    drawHead();
  } else if (button2 && !button1 && !button3) {
    cnt = 0.77;
    moveHead();
  }

  if (!button1 && !button2 && !button3) {
    drawHead();
  } else if (button3 && !button1 && !button2) {
    cnt = 1.8;
    moveHead();
  }
}


void drawHead() {
  pushMatrix();
  translate(0, 0, 0);
  fill(255);
  noStroke();
  sphere(110);
  popMatrix();

  //Eye
  pushMatrix();
  translate(30, -100, 40);
  fill(0);
  noStroke();
  sphere(8);
  popMatrix();

  pushMatrix();
  translate(30, -100, -40);
  fill(0);
  noStroke();
  sphere(8);
  popMatrix();

  //Nose
  pushMatrix();
  translate(60, -65, 0);
  fill(245);
  noStroke();
  sphere(52);
  popMatrix();

  pushMatrix();
  translate(60, -120, 0);
  fill(0);
  noStroke();
  sphere(10);
  popMatrix();

  //Ear
  pushMatrix();
  translate(-50, -20, 90);
  fill(245);
  noStroke();
  sphere(50);
  popMatrix();

  pushMatrix();
  translate(-50, -20, -90);
  fill(245);
  noStroke();
  sphere(50);
  popMatrix();
}

void drawBody() {
  pushMatrix();
  translate(200, 50, 0);
  fill(255);
  noStroke();
  sphere(140);
  popMatrix();
}



boolean isUp = true;


void drawLeftArm() {


  pushMatrix();

  translate(130, 0, -70);

  if (button1 || button2 || button3) {

    for (int i =0; i<90; i++)
    {


      if (isUp == true) {

        if (degree <= 1.2) {
          degree += 0.001*cnt;
          rotateZ(radians(degree));
        } else isUp = false;
      } else if (isUp == false) {
        if (degree >= 0) {
          degree -= 0.001*cnt;
          rotateZ(radians(degree));
        } else isUp = true;
      }
    }
  }

  rotateY(radians(0.02));

  rotateY(radians(-320));

  rotateZ(radians(0));

  scale(0.7, 0.7, 1);
  noStroke();

  PVector lastP = new PVector();

  fill(252);
  beginShape(TRIANGLE_STRIP);
  for (float deg2 =0; deg2 < 180; deg2 += delta) {
    float phi = radians(deg2);
    for (float deg = 0; deg <= 360; deg +=delta) {
      float theta = radians(deg);
      float a = map(deg2, 0, 360, 0, 10);
      r = 160 * map(a * a * a, 0, 1000, 0, 10);
      float x = r * sin(phi)*cos(theta);
      float y = r * sin(phi)*sin(theta);
      float z = r * cos(phi);
      vertex(x, y, z);
      float phi2 = radians(deg2+delta);
      a = map(deg2+delta, 0, 360, 0, 10);
      r = 160 * map(a * a * a, 0, 1000, 0, 10);
      x = r * sin(phi2)*cos(theta);
      y = r * sin(phi2)*sin(theta);
      z = r * cos(phi2);
      vertex(x, y, z);
      lastP = new PVector(x, y, z);
    }
  }
  endShape(CLOSE);

  // hand
  fill(250);
  scale(1, 1, 0.8);
  translate(lastP.x, lastP.y, lastP.z);
  sphere(50);

  popMatrix();
}

void drawRightArm() {
  pushMatrix();

  translate(120, 0, 70);
  rotateY(radians(230));
  rotateZ(radians(0));

  scale(0.7, 0.7, 1);
  noStroke();

  PVector lastP = new PVector();

  fill(252);
  beginShape(TRIANGLE_STRIP);
  for (float deg2 =0; deg2 < 180; deg2 += delta) {
    float phi = radians(deg2);
    for (float deg = 0; deg <= 360; deg +=delta) {
      float theta = radians(deg);
      float a = map(deg2, 0, 360, 0, 10);
      r = 160 * map(a * a * a, 0, 1000, 0, 10);
      float x = r * sin(phi)*cos(theta);
      float y = r * sin(phi)*sin(theta);
      float z = r * cos(phi);
      vertex(x, y, z);
      float phi2 = radians(deg2+delta);
      a = map(deg2+delta, 0, 360, 0, 10);
      r = 160 * map(a * a * a, 0, 1000, 0, 10);
      x = r * sin(phi2)*cos(theta);
      y = r * sin(phi2)*sin(theta);
      z = r * cos(phi2);
      vertex(x, y, z);
      lastP = new PVector(x, y, z);
    }
  }
  endShape(CLOSE);

  // hand
  fill(250);
  scale(1, 1, 0.8);
  translate(lastP.x, lastP.y, lastP.z);
  sphere(50);

  popMatrix();
}

void drawLeftLeg() {
  pushMatrix();

  translate(280, 40, -70);
  rotateY(radians(-300));

  rotateX(radians(-460));

  scale(0.8, 0.8, 1);
  noStroke();

  PVector lastP = new PVector();

  fill(252);
  beginShape(TRIANGLE_STRIP);
  for (float deg2 =0; deg2 < 180; deg2 += delta) {
    float phi = radians(deg2);
    for (float deg = 0; deg <= 360; deg +=delta) {
      float theta = radians(deg);
      float a = map(deg2, 0, 360, 0, 10);
      r = 160 * map(a * a * a, 0, 1000, 0, 10);
      float x = r * sin(phi)*cos(theta);
      float y = r * sin(phi)*sin(theta);
      float z = r * cos(phi);
      vertex(x, y, z);
      float phi2 = radians(deg2+delta);
      a = map(deg2+delta, 0, 360, 0, 10);
      r = 160 * map(a * a * a, 0, 1000, 0, 10);
      x = r * sin(phi2)*cos(theta);
      y = r * sin(phi2)*sin(theta);
      z = r * cos(phi2);
      vertex(x, y, z);
      lastP = new PVector(x, y, z);
    }
  }
  endShape(CLOSE);

  // foot
  fill(250);
  scale(1.25, 1.25, 0.9);
  translate(lastP.x, lastP.y, lastP.z);
  sphere(48);

  popMatrix();
}

void drawRightLeg() {
  pushMatrix();

  translate(280, 40, 70);
  rotateY(radians(-300));
  rotateX(radians(-460));

  scale(0.8, 0.8, 1);
  noStroke();

  PVector lastP = new PVector();

  fill(252);
  beginShape(TRIANGLE_STRIP);
  for (float deg2 =0; deg2 < 180; deg2 += delta) {
    float phi = radians(deg2);
    for (float deg = 0; deg <= 360; deg +=delta) {
      float theta = radians(deg);
      float a = map(deg2, 0, 360, 0, 10);
      r = 160 * map(a * a * a, 0, 1000, 0, 10);
      float x = r * sin(phi)*cos(theta);
      float y = r * sin(phi)*sin(theta);
      float z = r * cos(phi);
      vertex(x, y, z);
      float phi2 = radians(deg2+delta);
      a = map(deg2+delta, 0, 360, 0, 10);
      r = 160 * map(a * a * a, 0, 1000, 0, 10);
      x = r * sin(phi2)*cos(theta);
      y = r * sin(phi2)*sin(theta);
      z = r * cos(phi2);
      vertex(x, y, z);
      lastP = new PVector(x, y, z);
    }
  }
  endShape(CLOSE);

  // foot
  fill(250);
  scale(1.25, 1.25, 0.9);
  translate(lastP.x, lastP.y, lastP.z);
  sphere(48);

  popMatrix();
}

void moveHead() {
  
  if (isUp == true) {

    if (degree2 <= 28) {
      degree2 +=2*cnt;
      rotateZ(radians(degree2));
      drawHead();
    } else {
      isUp = false;
    }
  } else if (isUp == false) {
    if (degree2 >= -25) {
      degree2 -=2*cnt;
      rotateZ(radians(degree2));
      drawHead();
    } else {
      drawHead();
      isUp = true;
    }
  }
}


void drawButton() {
  pushMatrix();
  translate(x, y, z);
  fill(255, 0, 0, 100);
  box(sz);
  popMatrix();

  pushMatrix();
  translate(x2, y2, z);
  fill(0, 255, 0, 100);
  box(sz);
  popMatrix();

  pushMatrix();
  translate(x3, y3, z);
  fill(0, 0, 255, 100);
  box(sz);
  popMatrix();

  pushMatrix();
  translate(x4, y4, z);
  fill(255, 255, 0, 100);
  sphere(sz/2);
  popMatrix();
}

void mousePressed() {
  if (mouseX > 480 && mouseX < 510 && mouseY > 425 && mouseY < 455) {
    button1 = !button1;
  }

  if (mouseX > 480 && mouseX < 510 && mouseY > 470 && mouseY < 500) {
    button2 = !button2;
  }

  if (mouseX > 480 && mouseX < 510 && mouseY > 510 && mouseY < 540) {
    button3 = !button3;
  }

  if (mouseX > 90 && mouseX < 120 && mouseY > 510 && mouseY < 540) {
    button4 = !button4;
  }
}


