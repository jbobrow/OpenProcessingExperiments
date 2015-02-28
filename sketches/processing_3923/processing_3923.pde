
void setup() {
  size(800, 400);
  fill(126);
  background(102);
  stuff();
}
void stuff() {
  color inside = color(204, 102, 0);
  color middle = color(255,0, 0);
  color outside = color(0, 200, 0);
  color oval = color(10, 200, 9);
  
  fill(outside);
  rect(220,220, 120, 70);
  fill(middle);
  rect(40, 60, 420, 120);
  fill(inside);
  rect(0, 180, 800, 40);
  fill(oval);
  ellipse (650, 110, 200, 120);
  
}
void draw() {
  if(mousePressed) {
    stroke(255);
  } else {
    stroke(0);
  }
  rect(mouseX, mouseY, 6, 6);
}

