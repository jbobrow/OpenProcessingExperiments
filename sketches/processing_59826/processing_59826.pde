
// if eppeilectic beware!

void setup() {
  size(400, 300);
  smooth();

}
  
void draw() {
  background (0);
  translate(width/2, height/2);
  for (int i=0; i < 5; i++) {
        float s = map(mouseY, 50, height, 1, 2);
    float angle = map(mouseX, 0, width, 10, 150);
    rotate(angle);
    scale(s);
    fill(random(255), random(255), random(255), 100);
    
//shapes
    triangle(30, 75, 58, 20, 86, 75);
    rect(0, 0, 20, 20);
    ellipse(0, 0, 30, 30);

  }
}


