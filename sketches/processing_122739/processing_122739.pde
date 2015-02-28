


void setup(){
  size(600,600);
  background(255);
  strokeWeight(30);
}

void draw(){
 line(mouseX,mouseY,mouseX,mouseY);
}

void mouseClicked() {
  stroke(#ffffff);
  strokeWeight(30);
  point(mouseX, mouseY);
}



