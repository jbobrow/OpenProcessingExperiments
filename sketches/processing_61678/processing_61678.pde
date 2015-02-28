
float h0 = 0f, v0 = 0f;
float h1 = 1f, v1 = 1f;
int hRes = 20, vRes = 20;
float gridSize = 20f;

void setup() {
  size(800, 800);
  stroke(255);
}

void draw() {
  background(30);
  translate(width/2, height/2);
  for (int i = 0; i < hRes; i++) {
    for (int j = 0; j < hRes; j++) {
      float x0 = i*h0 + j*pow(h1, j)*gridSize;
      float y0 = j*v0 + i*pow(v1, i)*gridSize;
      float x1 = i*h0 + (j+1)*pow(h1, j+1)*gridSize;
      float y1 = (j+1)*v0 + i*pow(v1, i)*gridSize;
      float x2 = (i+1)*h0 + j*pow(h1, j)*gridSize;
      float y2 = j*v0 + (i+1)*pow(v1, i+1)*gridSize;
      line(x0, y0, x1, y1);
      line(x0, y0, x2, y2);
    }
  }
}

void mouseMoved() {

    h0 = map(mouseX, 0, width, -gridSize*2, gridSize*2);
    v0 = map(mouseY, 0, height, -gridSize*2, gridSize*2);

}

void mouseDragged() {
    v1 = map(mouseY, 0, height, 0.5f, 1.5f);
    h1 = map(mouseX, 0, width, 0.5f, 1.5f);
}




