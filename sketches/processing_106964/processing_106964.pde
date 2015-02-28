
void setup() {
  size(600, 400);
  background(255, 255, 255);
  noStroke();
}   
void draw() {
  background(255, 255, 255);
  if (mouseX >= width / 2) {
    fill(0, 0, 0);
    rect(0, 0, width / 2, height);
    fill(255, 255, 255);
    rect(width / 2, 0, width / 2, height);
  } 
  else {
    fill(255, 255, 255);
    rect(0, 0, width / 2, height);
    fill(0, 0, 0);
    rect(width / 2, 0, width / 2, height);
  }
}
