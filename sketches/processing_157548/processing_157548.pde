
void setup () {
  size(600, 600);
  background(#FCFAE5);
}

void draw() {
  float d = dist(mouseX, mouseY, pmouseX, pmouseY)*0.25;
  
  if (mousePressed && (mouseButton == LEFT)) {
    noStroke();
    fill(mouseY, 200, 100);
    ellipse(mouseX, mouseY, d, d);
    ellipse((width-mouseX), mouseY, d, d);
    stroke(mouseY, 200, 100, 70);
    line(mouseX, mouseY, pmouseX, pmouseY);
    line((width-mouseX), mouseY, width-pmouseX, pmouseY);
  }
  
  if (mousePressed && (mouseButton == RIGHT)) {
    background(#FCFAE5);
  } 

}

