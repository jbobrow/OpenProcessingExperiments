
float theta = PI/4;
int n = 10;

void setup() {
  size(1000, 500);
  noFill();
  strokeWeight(0.3);
}

void draw() {
  background(255);
  theta = map(mouseX, 0, width, PI/2, 0);
  n = (int)map(mouseY, 0, height, 16, 0);
  drawRect(450, 400, 100, n);
}

void drawRect(float x, float y, float a, int n) {
  translate(x, y);
  rect(0, 0, a, a);

  if (n>1) {
    float newA1 = a * cos(theta);
    float newA2 = a * sin(theta); 

    pushMatrix();
    rotate(-theta);
    drawRect(0, -newA1, newA1, n-1);
    popMatrix();

    pushMatrix();
    rotate(PI/2-theta);
    drawRect(0, -newA1-newA2, newA2, n-1);
    popMatrix();
  }
}

