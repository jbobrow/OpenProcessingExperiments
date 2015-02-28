
void setup(){
  rectMode(CENTER);
  noCursor();
  size(700,600);
}

void draw(){
  background(0,0,255);
  ellipse(mouseX,mouseX, 120,120);
  ellipse(mouseY,mouseY, 120,120);
  rect(mouseX,mouseY, 100,100);
}
