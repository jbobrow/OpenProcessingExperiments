
void setup() {
  size(500,500); 
  background(130, 130, 220); 
  smooth();
  noLoop();
}

void draw() {
  circle(10, 0, 10, 100, 10);
  circle(20, 1, 30, 200, 20);
  circle(30, 2, 50, 300, 30);
  circle(40, 3, 70, 400, 40);
  circle(20, 4, 90, 500, 50);
  circle(30, 5, 110, 600, 60);
}

void circle(int gray, int weight, int x , int y, int size) {
  stroke(90, 90, 250);
  fill(250, 100, 10);
  strokeWeight(weight);
ellipse(x, y+100, x+100, y+1);
ellipse(x+100, y+100, x+100, y+100);
ellipse(x+200, y+100, x+100, y+200);
ellipse(x+300, y+100, x+100, y+300);
ellipse(x+400, y+100, x+100, y+400);
}

  
  



