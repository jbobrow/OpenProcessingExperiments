
void setup() {
  size(500,400);
}

void draw() {
  background(0);
  if (mousePressed) {
    fill(0,255,0);
    rect(mouseX,mouseY,60,60);  
} else {
    fill(255,0,0);
 ellipse(mouseX,mouseY,60,60);
  } 
}
