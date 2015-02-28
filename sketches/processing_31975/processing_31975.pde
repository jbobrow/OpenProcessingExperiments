
void setup() {
  size (500, 1000);
  background (0,80,175);
  println("a poet who didn't know it");
  println("would rather have you explore it");
}

void draw() {
  if (mousePressed) {
    ellipseMode(RADIUS);
    ellipse(mouseX, mouseY, 50,50);
    fill(255,50);
    stroke(200);
    ellipse(mouseX, mouseY, 15,15); 
    
  } else {
    smooth();
    noStroke();
    fill(0,80,175,50);
    ellipse(mouseX,mouseY, 50, 50);
    
  }

}




