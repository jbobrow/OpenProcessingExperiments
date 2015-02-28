

void setup() {
  size(600, 400);
  background(58,24,0);
  noStroke();
  fill(98);
}

int a = 0;

void draw() {
  rect(a++%width, 10, 2, 80); 
}
