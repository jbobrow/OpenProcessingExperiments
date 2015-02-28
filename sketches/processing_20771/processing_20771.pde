
void setup(){
  size(200,200);
}
void draw(){
  stroke(0);
  fill(mouseX, 0, mouseY);
  rectMode(CENTER);
  ellipse(100, 100, 50, 50);
}
  void mousePressed(){
  stroke(0);
  fill(mouseY, 0, mouseX);
  rectMode(CENTER);
  rect(mouseX, mouseY, 16, 16);
}
void keyPressed(){
  background(255);
}

