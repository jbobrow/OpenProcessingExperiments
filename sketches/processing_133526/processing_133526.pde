
//Sam Legros, Exercise 4, Question 1

int x = 5;
int y = 100;
int wide = 20;
int speedx = 15;
int speedy = 15;
int spacing = 10;

void setup() {
  size(800, 500);
}

void draw() { 

  int counter = spacing;

  background(0);
  fill (255);
  rect(x, mouseY, wide, wide);

  while (counter < height) {
    stroke(255);
    strokeWeight(2);
    line(width/2, counter, width/2, counter);
    counter = counter + spacing;
  }

  fill(255);
  rect(0, y, 20, 50);
  rect(width-20, y, 20, 50);

  x = x + speedx;
  y = y + speedy;

  if (x >= width-30 || x <= 0) {
    speedx = -speedx;
  }

  if (y >= height || y <= 0) {
    speedy = -speedy;
  }
}



