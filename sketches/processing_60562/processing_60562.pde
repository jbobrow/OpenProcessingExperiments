
void setup() {
  size(500, 500);
  smooth();
}


void draw() {
  background(30);
  noStroke();


  draw2dCoordinateSystem(200);
  
  fill(128, 255, 0);
  rect(0, 0, 30, 30); // Green
  

  pushMatrix();
  
  rotate( 0.25 * PI);
  translate(350, 0);

  draw2dCoordinateSystem(200);

  fill(255, 128, 0);
  rect(0, 0, 30, 30); // Orange

  popMatrix();


  translate(250, 20);
  scale(0.5);

  draw2dCoordinateSystem(200);

  fill(0, 128, 255);
  rect(0, 0, 30, 30); // Blue
}



void draw2dCoordinateSystem(float theSize) {

  pushStyle();
  
  noFill();

  /* Grid X */
  stroke(255, 60);
  for (int i = 0; i < 10; i++) {
    line(0, i * theSize * 0.1, theSize, i * theSize * 0.1);
  }

  /* Grid Y */
  stroke(255, 180);
  for (int i = 0; i < 10; i++) {
    line(i * theSize * 0.1, 0, i * theSize * 0.1, theSize);
  }

  /* X */
  stroke(255, 0, 0);
  line(0, 0, theSize, 0);
  line(theSize, 0, theSize - 10, 5);
  line(theSize, 0, theSize - 10, -5);

  /* Y */
  stroke(0, 255, 0);
  line(0, 0, 0, theSize);
  line(0, theSize, 5, theSize - 10);
  line(0, theSize, -5, theSize - 10);
  
  popStyle();
}
