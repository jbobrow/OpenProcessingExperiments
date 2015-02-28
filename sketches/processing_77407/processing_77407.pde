
void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(150);
  float  x1 = map(mouseX, 0, width, 50, 150);
  fill(255,47,0);
  ellipse(x1, 75, 50, 50);  
  float x2 = map(mouseX, 0, width, 0, 200);
  ellipse(x2, 125, 50, 50); 
  float x3 = map(mouseX, 0, width, 0, 300);
  ellipse(x3, 150,50,50); 
  fill(16,150,0);
  float x4 = map(mouseX, 0, width, 0, 400);
  ellipse(x4, 400,50,50); 
  float x5 = map(mouseX, 0, width, 0, 450);
  ellipse(x5, 450,50,50); 
}


