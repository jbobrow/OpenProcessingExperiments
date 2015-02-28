
void setup() {
  size(480,120);
  smooth();
  text("Khyber Sen",80,80);
  fill(0,100,150,50);
}

void draw() {
  if (mousePressed) {
    fill(0);
  }else{
    fill(255);
  }
  ellipse(mouseX,mouseY,80,80);
}


