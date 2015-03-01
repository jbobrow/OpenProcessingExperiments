
void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  rotateZ(map(mouseY, 0, height, 0, -TWO_PI));
  strokeWeight(5);
  translate(0, -40, 0);
  drawCylinder(10, 180, 200, 16); // Draw a mix between a cylinder and a cone
  //drawCylinder(70, 70, 120, 64); // Draw a cylinder
  //drawCylinder(0, 180, 200, 4); // Draw a pyramid
}

void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  
  fill(255, mouseX, mouseY,120);
  stroke(200,200,mouseY,60);
  beginShape(TRIANGLE_FAN);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle)*14, tall*12, bottomRadius*sin(angle)*14);
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

  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    // Center point
    vertex(0, tall, 0);
    for (int i = 0; i < sides+1; i++) {
      vertex(bottomRadius * cos(angle), tall*(mouseX/600), bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }

  fill(mouseX, mouseY, mouseY,120);
  stroke(mouseY,200,200,60);
  beginShape(TRIANGLE_FAN);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*-cos(angle), 0, topRadius*-sin(angle));
    vertex(bottomRadius*-cos(angle)*14, -tall*12, bottomRadius*-sin(angle)*14);
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
      vertex(topRadius * -cos(angle), 0, topRadius * -sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }

  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    // Center point
    vertex(0, -tall, 0);
    for (int i = 0; i < sides+1; i++) {
      vertex(bottomRadius * -cos(angle), -tall*(mouseX/600), bottomRadius * -sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }  
  
}


