
PVector position;
PVector velocity;

void setup() {
  size(500, 500); 
  frameRate(25);
  smooth();
  
  position = new PVector(0, 100);
  velocity = new PVector(2, 2);
}

void draw() {
  background(44);

  position.add(velocity);

  noStroke();
  fill(255);

  ellipse(position.x, position.y, 20, 20);
  
  /* Catch the dot if it escapes */
  if(position.x > width || position.y > height) {
     position.x = 0;
     position.y = 100;
  } 
    
  /* Draw vectors (DO NOT COPY)  */
  stroke(255, 0, 0);
  drawVector(velocity, position, 50);
}

void drawVector(PVector vec, PVector base, float len) {
  pushMatrix();
  float arrowSize = 4;
  translate(base.x, base.y);
  rotate(vec.heading2D());
  float lineLength = vec.mag() * len;
  line(0, 0, lineLength, 0);
  line(lineLength, 0,lineLength - arrowSize, arrowSize * 0.5);
  line(lineLength, 0,lineLength - arrowSize,-arrowSize * 0.5);
  popMatrix();
}



