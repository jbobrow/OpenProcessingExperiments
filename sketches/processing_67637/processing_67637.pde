
float square_x = 50;
float square_y = 50;

void setup() {
  size(600, 600);
  background(200, 0, 200);
  fill(150, 0, 250);
  smooth();
  rectMode(CENTER);
}
void draw() {
  fill(random(256), random(256), random(256));
  ellipse(mouseX, mouseY, mouseX, mouseY);
  noStroke();
  fill(200, 0, 200);
  rect(square_x, square_y, 100, 100);
  square_x = square_x + 10;
  if(square_x > width) {
    square_y = square_y + 100;
    square_x = 50;
  }
  if(square_y > height) {
    square_y = 50;
  }
}


