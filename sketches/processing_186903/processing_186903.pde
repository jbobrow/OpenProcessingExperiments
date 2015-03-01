
float r = 0;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  colorMode(RGB);
}
void draw() {

  // rectangle that draws over animation everytime
  fill(random(255), random(255), random(255), 50);  //opacity
  rect(0, 0, width, height);

  fill(255);
  // center of canvas
  translate(width/2, height/2);

  rotate(r);
  float circle_size = random(5, 15);
  ellipse(100 + r, 10, circle_size, circle_size);
  r = r + 0.2;


  // if r grows too big start from 0 again
  if (r > 100) {
    r = 0.2;
  }
}  








