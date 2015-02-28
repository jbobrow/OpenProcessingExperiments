



float x = 0;
//float c = 20;
void setup() {
  size(400, 400);
  background(0);

  strokeWeight(7);
}

void draw() {

  
  
    fill(100,0,0,50);
  ellipse(200, 200, x, x);
  x = x + 50;
  if (x > 400) {
    x = x -350;
  }
  fill(100,0,100,50);
ellipse(200, 200, x, x);
  x = x + 30;
  if (x > 400) {
    x = x -200;

  }

  }
