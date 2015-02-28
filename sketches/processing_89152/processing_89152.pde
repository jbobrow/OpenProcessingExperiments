
void setup(){
  size(600, 200);
  strokeWeight(10);
  fill(255);
  rectMode(CENTER);
  rect(width/2, height/2, 100, 100);
}

void draw(){
  background(163);
  noStroke();
  fill(222, 27, 27);
  rectMode(CENTER);
  rect(mouseX, mouseY, 50, 50);
}
