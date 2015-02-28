
void setup(){
  size(300,300);
}

void draw(){
  background(175,mouseX,mouseY);
  stroke(mouseX,mouseX,mouseX);
  //noStroke();
  fill(mouseX,mouseX,mouseY);
  ellipse(100,mouseX,mouseY,mouseX);
  fill(mouseY/2,mouseY/2,mouseX/2);
  rectMode(CENTER);
  rect(mouseY,200,mouseX,mouseY);
}


