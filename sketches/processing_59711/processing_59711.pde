
void setup() {
  size(700, 700);
  
  background(252, 182, 3);
}

void draw() {
  if(mousePressed) {
    noStroke();
    fill(242, 56, 10);
    ellipse(width/2, height/2, mouseX, mouseY);
  }else{
  stroke(4, 195, 203);
  fill(3, 242, 252);
  ellipse(width/2, height/2, mouseX, mouseY);
  }
}

