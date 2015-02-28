
void setup() {
  size(700, 500);
  smooth();
  noFill();
}

int verti = 30;//number of curveVertex per ring
float angle = radians(360/(verti));
float rad = 80;//radius
float a = 33;//noise location

void draw() {
  background(10, 20, 30);
  translate(width/2, height/2);
  noStroke();
  fill(255, 255, 200, 9);
  for (int j = 0; j < 25; j++) {
    beginShape();
    for (int i = 1; i < verti+3; i++) {
      float xDis = map(noise(a*i), 0, 1, -3, 3)*5*j;
      float yDis = map(noise(a*i), 0, 1, -3, 3)*5*j;
      float x = sin(angle*i)*((rad + j*8) + xDis);
      float y = cos(angle*i)*((rad + j*8) + yDis);
      curveVertex(x, y);
    }
    endShape();
  }
  fill(10, 20, 30, 100);
  ellipse(0, 0, 160, 160);
  fill(10, 20, 30);
  ellipse(0, 0, 157, 157);
  a+=0.002;
}
