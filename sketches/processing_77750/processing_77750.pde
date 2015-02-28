
void setup() {
  
  size(600, 600);
  smooth();
}

void draw() {
  fill(150,100);
  rect(0, 0, 600, 600);
  translate(5, 5);
  fill(0);
  if (mousePressed) {
    fill(255); }
  ellipse(mouseX, mouseY, 70, 70);
}



    


