
void setup() {
  size(400, 400, P2D);
  smooth();
  noStroke();
}

void draw(){
  if (mousePressed) {
      background(150); 
      fill(0);
    ellipse(mouseX + 50, mouseY, 120, 120);
  }
  else {
    fill(0);
    ellipse(180, 180, 100, 100);
  }


  noStroke();

  fill(255);
  ellipse(mouseX, mouseY, 40, 40);
}
