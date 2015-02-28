
void setup() {
  size(500, 500);
}

void draw() {
  background(44, 206, 145);

  for ( int i = 400 ; i>0; i--) {
    noStroke();
    fill(600-i);
    ellipse(width/2, height/2, i, i);
  }



  translate(width/2, height/2);
  smooth();
  noFill();
  fill(247, 242, 85);  
  triangle(80, 240, 240, 90, 240, 240);
  triangle(80, -240, 240, -90, 240, -240);
  triangle(-80, 240, -240, 90, -240, 240);
  triangle(-80, -240, -240, -90, -240, -240);

  fill(108, 108, 86);
  triangle(80, 320, 200, 40, 160, 160);
  triangle(80, -320, 200, -40, 160, -160);
  triangle(-80, 320, -200, 40, -160, 160);
  triangle(-80, -320, -200, -40, -160, -160);


  fill(0);
  ellipse( 0, 0, 120, 120);


  float theta = 0.0;
  float radius = 100.0;
  int shapeCount = 4;
  float shapeRadius = 10.0;

  fill(0, 0, 100);
  for (int i=0; i<shapeCount; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    ellipse(0, 0, shapeRadius*2, shapeRadius*2);
    popMatrix();
    theta += TWO_PI/shapeCount;
  }
  theta = 0.0;
  radius = 120.0;
  shapeCount = 12;
  shapeRadius = 10.0;

  fill(42, 229, 225);
  for (int i=0; i<shapeCount; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    ellipse(0, 0, shapeRadius*2, shapeRadius*2);
    popMatrix();
    theta += TWO_PI/shapeCount;
  }

  theta = 0.0;
  radius = 140.0;
  shapeCount = 18;
  shapeRadius = 10.0;

  fill(216, 57, 214);
  for (int i=0; i<shapeCount; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    ellipse(0, 0, shapeRadius*2, shapeRadius*2);
    popMatrix();
    theta += TWO_PI/shapeCount;
  }
}


