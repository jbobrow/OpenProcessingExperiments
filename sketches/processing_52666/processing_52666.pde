
void setup() {
  size(700, 700);
}


void draw() {
  background(10, 110, 50);
  translate(width/2, height/2);


  fill( 30, 50, 60);
  rect(-120, -120, 240, 240);

  float theta = 0.0;
  float radius = 245.0;
  int shapeCount = 12;
  float shapeRadius = 90.0;
  for (int i=0; i<shapeCount; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    fill(200, 30, 60);
    ellipse(0, 0, shapeRadius*2, shapeRadius*2);
    popMatrix();
    theta += TWO_PI/shapeCount;
  }
}







