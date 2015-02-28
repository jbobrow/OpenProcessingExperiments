
void setup() {
  size(600, 600);
}


void draw() {
  background(250, 10, 10);
  translate(width/2, height/2);
  rect(-250, -250, 500, 500);
  fill(250, 0, 0);
  ellipse(250, 250, 150, 150);
  ellipse(-250, -250, 150, 150);
  ellipse(-250, 250, 150, 150);
  ellipse(250, -250, 150, 150);
  fill(250);
  ellipse(250, 250, 100, 100);
  ellipse(-250, -250, 100, 100);
  ellipse(-250, 250, 100, 100);
  ellipse(250, -250, 100, 100);
  fill(225, 10, 50);
  ellipse(250, 250, 50, 50);
  ellipse(-250, -250, 50, 50);
  ellipse(-250, 250, 50, 50);
  ellipse(250, -250, 50, 50);
  fill(235, 10, 87);
  ellipse(0, 0, 600, 600);
  fill(250);
  ellipse(0, 0, 500, 500);
  fill(200, 10, 85);
  ellipse(0, 0, 300, 300);
  fill(250);
  rect(-120, -120, 240, 240);
  fill(200, 0, 0);
  ellipse(0, 0, 240, 240);
  fill(250, 0, 0);
  rect(-50, -50, 100, 100);
  fill(200, 10, 50);
  ellipse(60, 60, 50, 50);
  ellipse(-60, -60, 50, 50);
  ellipse(60, -60, 50, 50);
  ellipse(-60, 60, 50, 50);
  ellipse(0, -80, 50, 50);
  ellipse(0, 80, 50, 50);
  ellipse(80, 0, 50, 50);
  ellipse(-80, 0, 50, 50);
  fill(250);
  ellipse(0, 0, 100, 100);
  fill(250, 0, 0);
  ellipse(0, 0, 60, 60);
  fill(230, 11, 50);
  ellipse(0, 0, 50, 50);
  fill(250, 0, 0);
  ellipse(0, 0, 35, 35);



  float theta = 0.0;
  float radius = 215.0;
  int shapeCount = 15;
  float shapeRadius = 55.0;
  for (int i=0; i<shapeCount; i++) {
    pushMatrix();
    stroke(250);
    fill(230, 10, 9);
    translate(cos(theta)*radius, sin(theta)*radius);
    ellipse(0, 0, shapeRadius*2, shapeRadius*2);
    popMatrix();
    theta += TWO_PI/shapeCount;
  }

  float theta1 = 0.0;
  float radius1 = 300.0;
  int shapeCount1 = 20;
  float shapeRadius1 = 20.0;
  for (int i=0; i<shapeCount1; i++) {
    pushMatrix();
    fill(200, 12, 50);
    translate(cos(theta1)*radius1, sin(theta1)*radius1);
    ellipse(0, 0, shapeRadius1*2, shapeRadius1*2);
    popMatrix();
    theta1 += TWO_PI/shapeCount1;
  }


  float theta2 = 0.0;
  float radius2 = 50.0;
  int shapeCount2 = 10;
  float shapeRadius2 = 12.0;
  for (int i=0; i<shapeCount2; i++) {
    pushMatrix();
    fill(235, 0, 55);
    translate(cos(theta2)*radius2, sin(theta2)*radius2);
    ellipse(0, 0, shapeRadius2*2, shapeRadius2*2);
    popMatrix();
    theta2 += TWO_PI/shapeCount2;
  }

  float theta3 = 0.0;
  float radius3 = 100.0;
  int shapeCount3 = 8;
  float shapeRadius3 = 25.0;
  for (int i=0; i<shapeCount3; i++) {
    pushMatrix();
    fill(235, 0, 55);
    translate(cos(theta3)*radius3, sin(theta3)*radius3);
    ellipse(0, 0, shapeRadius3*2, shapeRadius3*2);
    popMatrix();
    theta3 += TWO_PI/shapeCount3;
  }


  float theta5 = 0.0;
  float radius5 = 150.0;
  int shapeCount5 = 8;
  float shapeRadius5 = 50.0;
  for (int i=0; i<shapeCount5; i++) {
    pushMatrix();
    fill(235, 0, 55);
    translate(cos(theta5)*radius5, sin(theta5)*radius5);
    ellipse(0, 0, shapeRadius5*2, shapeRadius5*2);
    popMatrix();
    theta5 += TWO_PI/shapeCount5;
  }
}


