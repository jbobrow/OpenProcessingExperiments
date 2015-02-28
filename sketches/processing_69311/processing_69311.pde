
import peasy.*;
import processing.opengl.*;
float TAU = TWO_PI;
PeasyCam cam;
void setup() {
  size(600, 600, OPENGL);

  cam = new PeasyCam(this, 20);
  cam.setWheelScale(0.2);
  perspective(PI/3, 1, 0.01, 1000);

  cam.setMaximumDistance(100);

  sphereDetail(8);
}

void draw() {
  background(#E5E5E5);

  fill(255);
  noStroke();
  lights();

  cam.lookAt(constrain(cam.getLookAt()[0], -50, 30), constrain(cam.getLookAt()[1], -5, 40), -2, 0);
  float[] rotations = cam.getRotations();
  rotations[0] = constrain(rotations[0], -HALF_PI, HALF_PI); //magic numbers!
  cam.setRotations(rotations[0], rotations[1], rotations[2]);

  if (keyPressed) {
    pushMatrix();
    fill(255, 0, 0);
    float[] lookAt = cam.getLookAt();
    translate(lookAt[0], lookAt[1], max(lookAt[2], -2));
    box(1);
    popMatrix();
  }

  drawFloor();
  drawChalkboards();
  drawAllTables();
  drawFishtank();
  drawRecycleBin();
  drawClock();
  drawFan();
}

void drawFan() {
  pushMatrix();
  translate(-25, 10, 0);
  rotateZ(7*(TAU/8));
  fill(#DED300);
  box(2.75, 0.75, 2.75);
  popMatrix();
}

void drawClock() {
  pushMatrix();
  translate(7.5, 0, 8);

  fill(100);
  drawCylinder(0.75, 0.75, 0.25, 12);
  translate(0, 0.1, 0);
  fill(255);
  drawCylinder(0.75, 0.6, 0.25, 12);
  noFill();

  stroke(255, 0, 0);
  translate(0, 0.25, 0);

  pushMatrix();
  rotateY(norm((millis()/60f)%1000, 0, 1000)*TWO_PI);
  line(0, 0, 0.6, 0);
  popMatrix();

  stroke(0);
  pushMatrix();
  rotateY(47);
  line(0, 0, 0.5, 0);
  popMatrix();

  stroke(0);
  pushMatrix();
  rotateY(56);
  line(0, 0, 0.4, 0);
  popMatrix();

  noStroke();
  popMatrix();
}

void drawFloor() {
  pushMatrix();
  translate(0, 10, -2.5);
  fill(#E5E5E5);
  rect(-200, -200, 400, 400);
  popMatrix();
}

void drawAllTables() {
 // randomSeed(mouseX);
 // println(mouseX);
  randomSeed(37);
  fill(#A26400);
  pushMatrix();
  for (int i=-1; i <= 1; i++) {
    pushMatrix();
    translate((i*9)+5, 0, 0);
    rotate(TAU/4);
    translate(14, 0, 0);
    drawTable(true,i==-1?true:false);
    translate(8, 0, 0);
    drawTable(true,false);
    popMatrix();
  }
  translate(-18, 0, 0);
  rotate(TAU/4);
  translate(14, 0, 0);
  drawTable(false,false);
  drawSpinningGlobeez(true);
  popMatrix();
}

void drawRecycleBin() {
  pushMatrix();

  translate(8, 1, -2);
  fill(50);
  box(1.5, 1, 2.2);

  popMatrix();
}

void drawFishtank() {
  pushMatrix();
  rotate(TAU/4);
  translate(20, 30, 0);
  drawTable(false,false);
  fill(lerpColor(#8BFABC, #2481FF, map(noise(frameCount/50f), 0, 1, 0.2, 0.6)), 150);
  translate(0, 0, 1.5/1.6);
  box(3.8, 1.5, 1.5);
  popMatrix();
}

void drawSpinningGlobeez(boolean globe) {
  pushMatrix();
  fill(#1D89F2);
  scale(1.1);
  translate(0, 0, 1.5);
  sphere(1);
  translate(0, 0, -0.3);
  rotateX((TAU/4)*3);
  fill(200, 200, 200);
  drawCylinder(0, 0.9, 1, 32);

  if (globe) {
    rotateX(TAU/4);
    stroke(0);
    strokeWeight(5);
    noFill();
    scale(1.3);
    beginShape();
    vertex(0, 0, 0.5);
    for (float theta = 0; theta < PI; theta += 0.1) {
      vertex(0, sin(theta)*map(theta, 0, PI, 1.2, 0.5), cos(theta)*1.1);
    }
    endShape();
    noStroke();
  }
  popMatrix();
}

void drawChalkboards() {
  fill(#505050);
  pushMatrix();
  translate(0, 0, 4);
  box(12.25, 0.5, 6);
  translate(15, 0, 0);
  box(12.25, 0.5, 6);
  translate(10, 0, 0);
  rotateZ(TAU/4);
  translate(10, 0, 0);
  box(12.25, 0.5, 6);
  translate(15, 0, 0);
  box(12.25, 0.5, 6);
  popMatrix();
}

void drawTable(boolean addExtraStuff, boolean drawMiniModel) {
  fill(#A26400);

  pushMatrix();
  pushMatrix();
  box(7.5, 3.6, 0.5);

  scale(0.9);
  translate(7.5/2, 3.6/2, -3.75/2);
  box(0.35, 0.35, 3.75);
  translate(0, -3.6, 0);
  box(0.35, 0.35, 3.75);
  translate(-7.5, 0, 0);
  box(0.35, 0.35, 3.75);
  translate(0, 3.6, 0);
  box(0.35, 0.35, 3.75);
  popMatrix();

  if (addExtraStuff) {
    pushMatrix();
    if (random(1) < 0.7) {
      translate(random(-1, 1), random(-1, 1), 0.35);
      fill(random(100, 255), random(100, 255), random(100, 255));
      box(1.5, 1.5, 0.25);
    }
    if (random(0.9) < 0.5) {
      translate(random(-5, 6), random(-1, 1), 0);
      fill(random(100, 255), random(100, 255), random(100, 255));
      box(1.5, 1.5, 0.25);
    }
    popMatrix();

    translate(-2, -3, -1);
    drawChair();
    translate(4, 0, 0);
    drawChair();
  }
  popMatrix();
  
  if(drawMiniModel) {
    pushMatrix();
    fill(#D59733);
    translate(0,0,1);
    box(3.25,2.5,2);
    popMatrix();
  }
}

void drawChair() {
  pushMatrix();
  pushMatrix();
  fill(#0A00AA);
  box(2, 2, 0.3);

  translate(0, -1, 1);
  box(2, 0.3, 2);
  popMatrix();

  scale(0.9);
  translate(-1, -1, -1);
  box(0.2, 0.2, 2);
  translate(0, 2, 0);
  box(0.2, 0.2, 2);
  translate(2, 0, 0);
  box(0.2, 0.2, 2);
  translate(0, -2, 0);
  box(0.2, 0.2, 2);

  popMatrix();
}

//Thanks to Mr. ExampleDude
//Taken from 3D/Form/Verticies
//Had to steal this func. because I can't draw cylinders :P
void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();

  // If it is not a cone, draw the circular top cap
  if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);

    // Center point
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }

  // If it is not a cone, draw the circular bottom cap
  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);

    // Center point
    vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
}


