
void setup() {
  size(400,400);
  background(200);
  smooth();
  noLoop();
}

 
void draw() {
  tire(130, 290);
  tire(270, 290);
  car1(100,200);
  car2(125, 120);
  window(150, 140);
  light(135, 250);
  light(265, 250);
  grill(171, 235);
  grill1(174, 237);
  grill1(184, 237);
  grill1(194, 237);
  grill1(204, 237);
  grill1(214, 237);
  grill1(224, 237);
  tire(100,300);
  tire(300,300);
  
}

void tire(int x, int y) {
  smooth();
  noStroke();
  fill(50);
  ellipse(x, y, 40, 70);
  
}

void car1(int x, int y) {
  smooth();
  noStroke();
  fill(200, 12, 100);
  rect(x, y, 200, 100);
}

void car2(int x, int y) {
  smooth();
  noStroke();
  fill(200, 12, 100);
  rect(x, y, 150, 80);
}

void window(int x, int y) {
  smooth();
  noStroke();
  fill(250, 200, 0);
  rect(x, y, 100, 60);
}

void light(int x, int y) {
  smooth();
  noStroke();
  fill(200,200,0);
  ellipse(x,y, 40, 40);
  }
  
void grill(int x, int y) {
  smooth();
  noStroke();
  fill(100);
  rect(x,y, 60, 30);
}

void grill1(int x, int y) {
  smooth();
  noStroke();
  fill(85);
  rect(x, y, 5, 25);
}


