
float _detail = 10;
int _ballRadius = 300;

void setup() {
  size(1024, 768, P3D);
  background(0);
  smooth();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  rotateX(map(mouseY, 0, width, 0, TWO_PI));
  stroke(255);
  noFill();
  beginShape();
  float x, y, z;
  
  for (float zi = -_detail * PI / 2; zi < _detail * PI; zi++) {
    for (float r = 0; r < TWO_PI; r += TWO_PI / _detail) {
      x = cos(r);
      y = sin(r);
      z = zi / _detail;
      float heightMultiplier = sqrt(1 - sq(z-.5));
      curveVertex(x * heightMultiplier * _ballRadius, y * heightMultiplier * _ballRadius, z * _ballRadius - _ballRadius/2);
    }
  }
  endShape();
}


