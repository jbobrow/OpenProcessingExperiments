
float delta = 3;
float r = 200;
int m = -500;
int q = -1000;
boolean isQueenCome = false;
void setup() {
  size(1000, 600, P3D);
}

void calculateHeadVertex(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius *sin(la) *cos(lo);
  cartesian.y = radius *sin(la) *sin(lo);
  cartesian.z = radius *cos(la);
}
void calculateNeckVertex(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius *sin(la) *cos(lo);
  cartesian.y = radius *sin(la) *sin(lo);
  cartesian.z = radius *cos(la);
}
void calculateBodyVertex(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius*cos(lo);
  cartesian.y = radius*sin(lo);
  cartesian.z = radius*cos(la);
}
void calculateBody2Vertex(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius*cos(lo);
  cartesian.y = radius*sin(lo);
  cartesian.z = radius*cos(la);
}
void calculateFootVertex(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius *sin(la) *cos(lo);
  cartesian.y = radius *sin(la) *sin(lo);
  cartesian.z = radius *cos(la);
}

void calculateTopVertex(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius *sin(la) *cos(lo);
  cartesian.y = radius *sin(la) *sin(lo);
  cartesian.z = radius *cos(la);
}
void calculateCrown1Vector(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius *sin(la) *cos(lo);
  cartesian.y = radius *sin(la) *sin(lo);
  cartesian.z = radius *cos(la);
}
void calculateCrown2Vector(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius *sin(la) *cos(lo);
  cartesian.y = radius *sin(la) *sin(lo);
  cartesian.z = radius *cos(la);
}
void calculateQHeadVertex(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius *sin(la) *cos(lo);
  cartesian.y = radius *sin(la) *sin(lo);
  cartesian.z = radius *cos(la);
}
void calculateQNeckVertex(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius *sin(la) *cos(lo);
  cartesian.y = radius *sin(la) *sin(lo);
  cartesian.z = radius *cos(la);
}
void calculateQBodyVertex(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius*cos(lo);
  cartesian.y = radius*sin(lo);
  cartesian.z = radius*cos(la);
}
void calculateQBody2Vertex(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius*cos(lo);
  cartesian.y = radius*sin(lo);
  cartesian.z = radius*cos(la);
}
void calculateQBody3Vertex(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius*cos(lo);
  cartesian.y = radius*sin(lo);
  cartesian.z = radius*cos(la);
}
void calculateQFootVertex(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius *sin(la) *cos(lo);
  cartesian.y = radius *sin(la) *sin(lo);
  cartesian.z = radius *cos(la);
}

void calculateCapeVertex(float radius, float latitude, float longitude, PVector cartesian) {
  float la = radians(latitude);
  float lo = radians(longitude);
  cartesian.x = radius *sin(la) *cos(lo);
  cartesian.y = radius *sin(la) ;
  cartesian.z = radius *cos(la);
}



void draw() {
  lights();
  
  float cameraY = height/2;
  float fov = mouseX/float(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);

  perspective(fov, aspect, cameraZ/5, cameraZ*10);
  translate(width/2+30, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/3 + mouseY/float(height) * PI);
  
  background(200, 200, 200);
  drawChessBoard();
  if (isQueenCome) {
    pushMatrix();
    frameRate(10);
    translate(width/2, height/2+50, m+30); 
    rotateX(radians(270));
    scale(0.5);
    drawQueen();
    popMatrix();
  } else {
    pushMatrix();
    frameRate(60);
    translate(width/2, height/2+100, m);
    rotateX(radians(270));
    scale(0.5);
    drawPawn();
    popMatrix();
  }
}
void keyPressed() {
  println(isQueenCome);
  if (keyCode == ' ') {
    m+=100;
  } else if (key == 'v') {
    isQueenCome =! isQueenCome;
  }
}
void drawPattern(float x, float y, float z, float r, boolean isBlack) {
  if (isBlack) fill(0);
  else fill(255);
  pushMatrix();
  translate(x, y, z);
  scale(1, 0.5, 1);
  box(r); 
  popMatrix();
}
void drawChessBoard() {
  int sz = 100, y = 480;
  for (int x=0; x<800; x+=sz*2) {
    for (int z=-600; z<600; z+=sz*2) {
      drawPattern( x, y, z, sz, true); 
      drawPattern( x + sz, y, z, sz, false); 
      drawPattern( x, y, z + sz, sz, false); 
      drawPattern( x + sz, y, z + sz, sz, true);
    }
  }
}
void drawPawn() {
  fill(#B42626);
  smooth();
 noStroke();
 
 fill(#B42626);
  
  pushMatrix();
    rotateZ(random(0.5,1));
  translate(0, 0, -200);
  scale(0.3);
  drawHead();
  popMatrix();
  
  pushMatrix();
    rotateZ(random(0.1,0.5));
  translate(0, 0, -45);
  scale(0.6);
  drawNeck();
  popMatrix();
  
  pushMatrix();
  scale(0.5);
  rotateZ(random(0.1,0.5));
  translate(0, 0, -195);
  drawBody();
  popMatrix();
  
  pushMatrix();
  scale(0.5);
  rotateZ(random(0.5,1));
  translate(0, 0, 0);
  drawBody2();
  popMatrix();
  
  pushMatrix();
  rotateZ(random(0,100));
  translate(0, 0, 160);
  scale(1);
  drawFoot();
  popMatrix();
  
  color eye = color(255, 255, 255);
  float eyeHeight = 1;
  pushMatrix();
  translate(30, -50, -200);
  if ((sin(radians(frameCount)) > 0.99) || (sin(radians(frameCount)) < -0.99)) {
    eye = color(200, 255);
    eyeHeight = 1;
  } else {
    eye = color(0, 0, 0);
    eyeHeight = 1;
  }
  fill(eye);
  scale(1, eyeHeight, 1);
  sphere(5);
  popMatrix();
  
  pushMatrix();
  translate(-30, -50, -200);
  fill(eye);
  scale(1, eyeHeight, 1);
  sphere(5);
  popMatrix();
}

void drawHead() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 200; // sphere radius
  // create a head
  for (float latitude = 0; latitude<180.0; latitude += 10) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateHeadVertex(r, latitude, longitude, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateHeadVertex(r, latitude+10.0, longitude, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawNeck() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 200; // sphere radius
  for (float latitude = 145; latitude<200.0; latitude += 15) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateNeckVertex(r, latitude, longitude*2, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateNeckVertex(r, latitude+10.0, longitude*2, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawBody() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 100; // sphere radius
  for (float latitude = 0; latitude<180.0; latitude += 10) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateBodyVertex(r, latitude, longitude*2, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateBodyVertex(r, latitude+10, longitude*2, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawBody2() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 125; // sphere radius
  for (float latitude = 0; latitude<180.0; latitude += 10) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateBody2Vertex(r, latitude, longitude*2, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateBody2Vertex(r, latitude+10, longitude*2, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawFoot() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 125; // sphere radius
  for (float latitude = 120; latitude<180.0; latitude += 20) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateFootVertex(r, latitude, longitude*2, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateFootVertex(r, latitude+10.0, longitude*2, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawQueen() {
  smooth();
  noStroke();
  // stroke(255, 0, 0);
  // strokeWeight(1);
  pushMatrix();
  fill(#B42626);
  translate(0, 0, -270);
  scale(0.05);
  drawTop();
  popMatrix();

  pushMatrix();
  rotateZ(random(0.3, 0.5));
  translate(0, 0, -100);
  scale(0.7);
  drawCrown1();
  popMatrix();

  pushMatrix();
  rotateZ(random(0, 0.5));
  translate(0, 0, -70);
  scale(0.9);
  drawCrown2();
  popMatrix();


  fill(255);
  pushMatrix();
  translate(0, 0, -200);
  scale(0.3);
  drawQHead();
  popMatrix();

  pushMatrix();
  translate(0, 0, -30);
  scale(0.7);
  drawQNeck();
  popMatrix();

  pushMatrix();

  scale(0.5);
  translate(0, 0, -195);
  drawQBody();
  popMatrix();

  pushMatrix();
  scale(0.5);
  translate(0, 0, 0);
  drawQBody2();
  popMatrix();

  pushMatrix();
  scale(0.5);
  translate(0, 0, 195);
  drawQBody3();
  popMatrix();

  pushMatrix();
  fill(#B42626);
  rotateZ(random(0, 0.5));
  translate(0, 0, 255);
  scale(1.5);
  drawQFoot();
  popMatrix();

  pushMatrix();
  rotate(random(100, 100.1), random(-401, -400), random(0, 1), random(0, 1));
  translate(0, -50, 0);
  scale(1);
  drawCape();
  popMatrix();

  fill(255);

  color eye = color(255, 255, 255);
  float eyeHeight = 1;
  pushMatrix();
  translate(30, -50, -200);
  if ((sin(radians(frameCount*6)) > 0.99) || (sin(radians(frameCount*6)) < -0.99)) {
    eye = color(200, 255);
    eyeHeight = 1;
  } else {
    eye = color(0, 0, 0);
    eyeHeight = 1;
  }
  fill(eye);
  scale(1, eyeHeight, 1);
  sphere(5);
  popMatrix();

  pushMatrix();
  translate(-30, -50, -200);
  fill(eye);
  scale(1, eyeHeight, 1);
  sphere(5);
  popMatrix();

  color mouth = color(255, 0, 0);
  float mouthHeight = 1;
  pushMatrix();
  translate(0, -50, -170);

  if ((sin(radians(frameCount*4)) > 0.99) || (sin(radians(frameCount*4)) < -0.99)) {
    mouth = color(200, 255);
    mouthHeight = 1;
  } else {
    mouth = color(#B42626);
    mouthHeight = 1;
  }

  fill(mouth);
  scale(5, 1, 2);
  box(5);
  popMatrix();
}
void drawTop() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 200; // sphere radius
  // create a head
  for (float latitude = 0; latitude<180.0; latitude += 10) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateTopVertex(r, latitude*100, longitude, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateTopVertex(r, latitude+10.0, longitude, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawCrown1() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 200; // sphere radius
  // create a head
  for (float latitude = 145; latitude<180.0; latitude += 20) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateCrown1Vector(r, latitude, longitude*25, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateCrown1Vector(r, latitude+10.0, longitude*25, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawCrown2() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 200; // sphere radius
  // create a head
  for (float latitude = 145; latitude<200.0; latitude += 20) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateCrown2Vector(r, latitude, longitude*15, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateCrown2Vector(r, latitude+10.0, longitude*15, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawQHead() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 200; // sphere radius
  // create a head
  for (float latitude = 0; latitude<180.0; latitude += 10) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateQHeadVertex(r, latitude*10, longitude*25, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateQHeadVertex(r, latitude+10.0, longitude*25, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawQNeck() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 200; // sphere radius
  for (float latitude = 145; latitude<200.0; latitude += 20) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateQNeckVertex(r, latitude, longitude*40, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateQNeckVertex(r, latitude+10.0, longitude*40, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawQBody() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 100; // sphere radius
  for (float latitude = 0; latitude<180.0; latitude += 10) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateQBodyVertex(r, latitude, longitude*10, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateQBodyVertex(r, latitude+10, longitude*10, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawQBody2() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 125; // sphere radius
  for (float latitude = 0; latitude<180.0; latitude += 10) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateQBody2Vertex(r, latitude, longitude*10, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateQBody2Vertex(r, latitude+10, longitude*10, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawQBody3() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 150; // sphere radius
  for (float latitude = 0; latitude<180.0; latitude += 10) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateQBody3Vertex(r, latitude, longitude*10, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateQBody3Vertex(r, latitude+10, longitude*10, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawQFoot() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 125; // sphere radius
  for (float latitude = 120; latitude<180.0; latitude += 20) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateQFootVertex(r, latitude, longitude*40, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateQFootVertex(r, latitude+10.0, longitude*40, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}
void drawCape() {
  PVector cart = new PVector(); // cartesian coordinates
  float r = 200; // sphere radius
  // create a half sphere (bowl)
  for (float latitude = 90; latitude<180.0; latitude += 10) { 
    beginShape(QUAD_STRIP); 
    for (float longitude = 0; longitude<=360; longitude += 10) {
      calculateCapeVertex(r, latitude, longitude, cart);
      vertex(cart.x, cart.y, cart.z);
      calculateCapeVertex(r, latitude+10.0, longitude, cart);
      vertex(cart.x, cart.y, cart.z);
    }
    endShape();
  }
}


