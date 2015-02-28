
void setup(){
  size(400,400);
  background(255);
}

void draw(){
  stroke(0);
  rect(mouseX,mouseY,mouseX+5,mouseY+5);
}

void mousePressed(){
  stroke(0);
  fill(175);
  rectMode(CENTER);
  rect(mouseX,mouseY,50,50);
}

void keyPressed(){
  background(0);
}

