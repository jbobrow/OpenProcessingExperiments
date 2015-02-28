

void setup() {
  size(600, 200);
  background(698);
  noStroke();
  fill(152);
}

int a = 0;

void draw() {
  rect(a++%width, 10, 2, 78); 
}
