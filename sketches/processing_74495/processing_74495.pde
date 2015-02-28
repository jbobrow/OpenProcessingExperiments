
void setup() {
  size (400, 400);
  smooth();
  fill(0);
  rect(0, 0, width, height);
}
 
void draw() {
  noStroke();
  fill(142,88,23);
  rect(0,0, 20, height);
  rect(0,0, width, 20);
  rect(400-20, 400-20, 20,-400+20);
  rect(400-20, 400-20, -400+20,20);
  
 
  if (mousePressed && (mouseButton == LEFT)) {
 
    stroke(255);
    strokeWeight(5);
 line(mouseX, mouseY, pmouseX, pmouseY);
  }
  else if (mousePressed && (mouseButton == RIGHT)) {
    fill(0);
    rect(0, 0, width, height);
  }
}
