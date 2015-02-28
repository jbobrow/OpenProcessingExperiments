
void setup(){
  background(0);
  size(500,500);
  stroke(255);
}

void draw(){
  
  noFill();
  rectMode(CENTER);
  rect(width/2, height/2, mouseX, mouseY);
  fill(0);
  ellipse(width/2, height/2, mouseX, mouseY);
}
