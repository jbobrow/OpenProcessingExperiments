
void setup() {
  size(500, 500);
  background(0);
  noStroke();
  fill(102);
}

int a = 0;

void draw() {
  rect(a++%width, 10, 2, 80); 
}

