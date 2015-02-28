
void setup(){
  size(300,300);
  background(255,150,230);
}

int x=20;

void draw(){
  fill(255,mouseX,mouseY);
  stroke(mouseY);
  ellipse(mouseX,mouseY,mouseX,mouseY);
  rect(mouseY,mouseX,mouseY,mouseX);
}

void mouseDragged(){
  x=mouseX;
}

