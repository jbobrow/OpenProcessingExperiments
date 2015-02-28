
void setup(){
  size (500, 500);
  smooth();
  background (30);
  }

void draw(){
  if (mousePressed && (mouseButton == LEFT)) {
    smooth();    
    strokeWeight(10);
    stroke(250,25,mouseX);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
