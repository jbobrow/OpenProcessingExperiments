
int smallx = 200;
int bigx = 400;

void setup() {
  size(500,500);
  background(0);
  noStroke();
}

void draw() {
  fill(0, 60, 50);
  rect(0, 0, 500, 500);

  fill(10, 65, 55);
  rect(50, 50, 400, 400);

  fill(20, 70, 60);
  rect(100, 100, 300, 300);

  fill(30, 75, 65);
  rect(150, 150, 200, 200);

  fill(40, 80, 70);
  rect(200, 200, 100, 100);
}


