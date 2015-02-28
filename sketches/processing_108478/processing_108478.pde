
void setup() {
  size(700, 500);
  background(255);
  smooth();
  frameRate(50);
}

void draw() {
  strokeWeight(random(20));
  if(mousePressed) {
    stroke(random(255),random(255),random(255),random(200));
    line(mouseY, mouseX, pmouseY, pmouseX);
    line(mouseX, mouseY, pmouseX, pmouseY);
   
  }
 
}
