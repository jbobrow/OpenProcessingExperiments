
int count = 0;

void setup() {
  size(700,700);
  background(255);
}

void draw() {
  if (count<10) {
    noStroke();
    fill(153,33,75);
    triangle(random(width),random(height),random(width),random(height),random(width),random(height));
    count = count + 1;
  }
}
