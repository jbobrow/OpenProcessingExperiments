
//int[] myNumbers = new int[5]

PVector[][] vertices = new PVector[10][10];

void setup() {
  size(600, 600, P3D);
  stroke(255);
  fill(200);


  for (int j=0; j<10; j++) {
    for (int i=0; i<10; i++) {

      vertices[i][j] = new PVector(i*40, j*40, random(-30, 30));
    }
  }
}

void draw() {
  background(0);
  lights();
  directionalLight(205, 10, 16, 0, -1, 0);
  //Top Light
  directionalLight(16, 10, 205, 0, 1, 0);
  //Back Light
  directionalLight(160, 205, 10, 0, 0.5, -1);
  camera(mouseX, mouseY, 120.0, 100, 100, 0.0, 0.0, 1.0, 0.0);
  scale(0.8);
  for (int j=0; j<5; j++) {
    beginShape(QUAD_STRIP);
    for (int i=0; i<5; i++) {
      vertices[i][j].z += random(-10, 10);
      vertex(vertices[i][j].x, vertices[i][j].y, vertices[i][j].z);
      vertex(vertices[i][j+1].x, vertices[i][j+1].y, vertices[i][j+1].z);
    }
    endShape();
  }
}



