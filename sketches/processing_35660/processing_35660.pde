
void setup() {
size(300,300);
}

void draw() {
  smooth();
  background(mouseY);
  fill(255);
  rect(250,mouseY,15,60);
  fill(mouseY,mouseX,mouseY/2);
  rect(50,height-mouseY,15,mouseX);
  fill(0,mouseY,mouseX);
  ellipse(mouseX,mouseY,25,mouseY/2);
  
}


