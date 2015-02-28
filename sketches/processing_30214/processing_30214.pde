
void setup() {
  size(500,500);
  smooth();
}

void draw(){
  if(mousePressed) {
    fill(255,0,0);
    ellipse(mouseX, mouseY ,  mouseX, mouseY);

  }
}


