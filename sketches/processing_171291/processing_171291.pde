
float angle;
int dis;
int dim;


void setup() {
  size (600, 600);
  smooth();
}

void draw() {
  angle += 2.0f;
  dis=60;
  dim=15;
  
  fill(30);
  rect(0, 0, width, height);

  for (int i=0; i<10; i++) {
    for (int j=0; j<10; j++) {
      fill(30, 140, 250);
      ellipseMode(CORNER);
      noStroke();
      ellipse(i*dis, j*dis, dis, dis);
    }
  }

  for (int i=-1; i<10; i++) {
    for (int j=-1; j<10; j++) {
      fill(124, 252, 0);

      pushMatrix();
      translate(((i+1)*dis)-dim, ((j+1)*dis)-dim);
      rotate(radians(angle));
      rect(0, 0, -dim, -dim);
      popMatrix();

      pushMatrix();
      translate(((i+1)*dis)+dim, ((j+1)*dis)+dim);
      rotate(radians(angle));
      rect(0, 0, dim, dim);
      popMatrix();

      pushMatrix();
      translate(((i+1)*dis)-dim, ((j+1)*dis)+dim);
      rotate(radians(angle));
      rect(0, 0, -dim, dim);
      popMatrix();

      pushMatrix();
      translate(((i+1)*dis)+dim, ((j+1)*dis)-dim);
      rotate(radians(angle));
      rect(0, 0, dim, -dim);
      popMatrix();
    }
  }
}



