
void setup() {
  size(640, 360, P3D);
}

float angle = 0;
float increment = 0.1;
float time = 1000;
float timeincrement = 0.01;
int xsize = 20;
int ysize = 20;
float[][] data = new float[xsize][ysize];

void draw() {
  background(0);

  stroke(0);
  fill(100,100);

  translate(width/2, height/2, -200);
  rotateX(-(float)mouseY/height);
  rotateY(angle);
  angle +=0.005;

  float xoff = 0.0;
  
  for (int x = 0; x < xsize; x++) {
    float yoff = 0.0;
    for (int y = 0; y < ysize; y++) {
      float rr = map(noise(xoff, yoff, time), 0, 1, -100, 100);
      data[x][y] = rr;
      yoff += increment;
    }
    xoff += increment;
  }
  time += timeincrement;

  drawPlane(data, xsize, ysize);
}

void drawPlane(float[][] vals, int sizeX, int sizeY) {
  float rectsize = max(width, height)/max(sizeX, sizeY);

  //row by row
  for (int i=0; i<sizeX-1; i++) {
    for (int j=0; j<sizeY-1; j++) {
      pushMatrix();
      beginShape(QUADS);
      //Put grid to the center
      translate( rectsize * (i-(sizeX-1)/2), 0,
      rectsize * (j-(sizeY-1)/2));
      vertex(0, vals[i][j], 0);
      vertex(0, vals[i][j+1], rectsize);
      vertex(rectsize, vals[i+1][j+1], rectsize);
      vertex(rectsize, vals[i+1][j], 0);
      endShape();
      popMatrix();
    }
  }
}
