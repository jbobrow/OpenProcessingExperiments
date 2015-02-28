
//Youshin Song. CC-SecB

void setup() {
  size(500, 500);
  noStroke();
  smooth();
}
 

// Create 3 shapes that move together.
// Create overlap of shapes and colors, vary transparency.
void draw() {
 
  int x = round (map(mouseX, 0, width, 0, 255));
  int y = round (map(mouseY, 0, height, 0, 255));
  int ellipse_a = round (map(mouseX, 0, width-50, width+50, 0));
  int rect_b = round (map(mouseY, 0, height-50, height+50, 0));
  background(255, x, 255);
  fill(255);
  rect (100, 100, 300, 300);
  
  fill(x, y, y, 200);
  ellipse (ellipse_a, 150, 50, 50);
  fill(x, x, y, 200);
  ellipse (ellipse_a, 250, 50, 50);
  fill(y, x, y, 200);
  ellipse (ellipse_a, 350, 50, 50);

  fill(x, y, x, 200);
  rect (125, rect_b, 50, 50);  
  fill(y, x, x, 200);
  rect (225, rect_b, 50, 50);
  fill(y, y, x, 200);
  rect (325, rect_b, 50, 50);
}
