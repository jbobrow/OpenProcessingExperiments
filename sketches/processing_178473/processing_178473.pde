
//miso
float delta = 10;
float r = 200;
float X1, Y1=10;
int MAX = 648; 
int posX=0, posY=0; 
int posZ=0;
float h = 0;

float leftArmMoving = 0;
float rightArmMoving = 0;
float leftLegMoving =0;
float rightLegMoving =0;
float LEFT_ARM_MAX = 230, LEFT_ARM_MIN = 120;
float RIGHT_ARM_MAX = 60, RIGHT_ARM_MIN = -50;
float LEFT_LEG_MAX =445, LEFT_LEG_MIN=415;
float RIGHT_LEG_MAX= 445, RIGHT_LEG_MIN=415 ;

void setup() {
  size(600, 600, P3D);
  frameRate(60);
}
void draw() {
  background(255,229,230);
  noStroke();
  lights();
  translate(width/2, height/2, 0);
  scale(0.5);
  
  rotateY(radians(mouseX));
  
  translate(posX, posY, posZ);
  drawLeftArm();
  drawRightArm();
  drawLeftLeg();
  drawRightLeg();
  drawDownBody();
  drawUpBody();
  drawHead();
}

void keyPressed() {
   if (key == CODED) {
  if (keyCode == LEFT) {
    posX+=10;
  } else if (keyCode == RIGHT) {
    posX-=10;
  }
  if (keyCode == UP){
    posZ-=10;
    
  } else if (keyCode == DOWN) {
    posZ+=10;
  }
}
}

void drawHead() {
  pushMatrix();
  translate(0, -height/2);
  rotateY(radians(0));
  if (mouseY>215)
    rotateX(radians(90+215));
  else if (mouseY<150)
    rotateX(radians(90+150));
  else
    rotateX(radians(90+mouseY));
  PVector eyeLP= new PVector(),eyeRP= new PVector();
  
  beginShape(TRIANGLE_STRIP);
  
  for (float deg2 =0; deg2 < 180; deg2 += delta) {
    float phi = radians(deg2);
    for (float deg = 0; deg <= 360; deg +=delta) {
      float theta = radians(deg);
      fill(255);
      setRadius( map(deg2, 0, 360, 0, 10));
      float x = r * sin(phi)*cos(theta);
      float y = r * sin(phi)*sin(theta);
      float z = r * cos(phi);
      vertex(x, y, z);
      
      if(deg2 == 60 && deg == 50)
        eyeLP = new PVector(x - 30,y,z);
      else if(deg2 == 60 && deg == 130)
        eyeRP = new PVector(x + 30,y,z);
      float phi2 = radians(deg2+delta);
      setRadius( map(deg2+delta, 0, 360, 0, 10));
      x = r * sin(phi2)*cos(theta);
      y = r * sin(phi2)*sin(theta);
      z = r * cos(phi2);
      vertex(x, y, z);
    }
  }
  endShape(CLOSE);
  
  drawEye(eyeLP);
  drawEye(eyeRP);
  
  popMatrix();
}

void drawEye(PVector eyeP){
  pushMatrix();
  fill(0);
  translate(eyeP.x, eyeP.y, eyeP.z);
  sphere(20); 
  popMatrix();
}

void drawUpBody() {
  pushMatrix();
  scale(1.5);
  translate(0, height/2.2);
  rotateY(radians(0));
  rotateX(radians(-90 ));
  fill(0, 155, 140);
  beginShape(TRIANGLE_STRIP);
  for (float deg2 =150; deg2 < 180; deg2 += delta) {
    float phi = radians(deg2);
    for (float deg = 0; deg <= 360; deg +=delta) {
      float theta = radians(deg);

      setBodyRadius(map(deg2, 0, 360, 0, 10));
      float x = r * sin(phi)*cos(theta);
      float y = r * sin(phi)*sin(theta);
      float z = r * cos(phi);
      vertex(x, y, z);
      float phi2 = radians(deg2+delta);

      setBodyRadius(map(deg2+delta, 0, 360, 0, 10));
      x = r * sin(phi2)*cos(theta);
      y = r * sin(phi2)*sin(theta);
      z = r * cos(phi2);
      vertex(x, y, z);
    }
  }
  endShape(CLOSE); 
  popMatrix();
}

void drawDownBody() {
  pushMatrix();
  scale(1.5);
  translate(0, height/1.8);
  rotateY(radians(0));
  rotateX(radians(-90 ));

  fill(255, 100, 0);
  beginShape(TRIANGLE_STRIP);

  for (float deg2 =150; deg2 < 160; deg2 += delta) {
    float phi = radians(deg2);
    for (float deg = 0; deg <= 360; deg +=delta) {
      float theta = radians(deg);

      setBodyRadius(map(deg2, 0, 360, 0, 10));
      float x = r * sin(phi)*cos(theta);
      float y = r * sin(phi)*sin(theta);
      float z = r * cos(phi);
      vertex(x, y, z);
      float phi2 = radians(deg2+delta);

      setBodyRadius(map(deg2+delta, 0, 360, 0, 10));
      x = r * sin(phi2)*cos(theta);
      y = r * sin(phi2)*sin(theta);
      z = r * cos(phi2);
      vertex(x, y, z);
    }
  }
  endShape(CLOSE); 
  popMatrix();
}

void drawLeftArm() {
  pushMatrix();

  translate(-width/20, -height/10, 25);
  rotateY(radians(250));

  leftArmMoving = map(mouseY, 0, height, LEFT_ARM_MIN, LEFT_ARM_MAX);
  if (leftArmMoving>LEFT_ARM_MAX)
    rotateX(radians(LEFT_ARM_MAX));
  else if (leftArmMoving<LEFT_ARM_MIN)
    rotateX(radians(LEFT_ARM_MIN));
  else
    rotateX(radians(leftArmMoving));

  rotateZ(radians(0));

  scale(1, 1, 2);
  noStroke();

  PVector lastP = new PVector();

  fill(0, 155, 140);
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
  fill(255, 230, 203);
  scale(1, 1, 0.8);
  translate(lastP.x, lastP.y, lastP.z);
  sphere(50);

  popMatrix();
}
void drawRightArm() {
  pushMatrix();

  PVector lastP = new PVector();
  translate(width/20, -height/10, 25);
  rotateY(radians(300));
  rightArmMoving = map(mouseY, 0, height, RIGHT_ARM_MAX, RIGHT_ARM_MIN);
  if ( rightArmMoving>RIGHT_ARM_MAX)
    rotateX(radians(RIGHT_ARM_MAX));
  else if (rightArmMoving<RIGHT_ARM_MIN)
    rotateX(radians(RIGHT_ARM_MIN));
  else
    rotateX(radians(rightArmMoving));

  rotateZ(radians(0));

  scale(1, 1, 2);
  noStroke();

  fill(0, 155, 140);
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
  fill(255, 230, 203);
  scale(1, 1, 0.8);
  translate(lastP.x, lastP.y, lastP.z);
  sphere(50);
  popMatrix();
}

void drawLeftLeg() {
  pushMatrix();

  PVector lastP = new PVector();
  
  translate(width/200, -height/550, 25);
  rotateZ(radians(-70));
  
  //moveLeg
  leftLegMoving = map(mouseX , 0, width, LEFT_LEG_MAX, LEFT_LEG_MIN);
    rotateY(radians(14));
  if ( leftLegMoving>LEFT_LEG_MAX)
    rotateY(radians(LEFT_LEG_MAX));
  else if (leftLegMoving<LEFT_LEG_MIN)
    rotateY(radians(LEFT_LEG_MIN));
  else
    rotateY(radians(leftLegMoving));

  scale(1, 1, 2.4);
  noStroke();
  fill(255, 230, 203);
  
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
  
  noStroke();
  // FOOT
  fill(67, 46, 24);
  translate(lastP.x, lastP.y, lastP.z);
  scale(2, 1, 2);
  sphere(20);
  popMatrix();
}

void drawRightLeg() {
  pushMatrix();

  PVector lastP = new PVector();
  translate(width/400, -height/550, 25);
  rotateZ(radians(-110));
  rightLegMoving = map(mouseX, 0, width, RIGHT_LEG_MIN, RIGHT_LEG_MAX);
  
  rotateY(radians(14));
  if ( rightLegMoving>RIGHT_LEG_MAX)
    rotateY(radians(RIGHT_LEG_MAX));
  else if (rightLegMoving<RIGHT_LEG_MIN)
    rotateY(radians(RIGHT_LEG_MIN));
  else
    rotateY(radians(rightLegMoving));
 
  scale(1, 1, 2.4);
  noStroke();
  fill(255, 230, 203);
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
  // FOOT
  fill(67, 46, 24);
  translate(lastP.x, lastP.y, lastP.z);
  scale(2, 1, 2);
  sphere(20);
  popMatrix();
}

void setBodyRadius(float a) {
  if (a <4)
    r = 300 * map(a * a, 0, 1000, 0, 10);
  else
    r = 300 * map(a * a * a, 0, 1000, 0, 10);
}
void setRadius(float a) {

  if (a>4.5) {
    fill(255, 0, 0);
    r = 200 * map(a * a * a, 0, 1000, 0, 10);
  } else if (a>2) {
    r = 200 * map(a *a, 0, 100, 1, 2);
    fill(67, 46, 24);
  } else {
    fill(255, 230, 203);
    r = 200;
  }
}



