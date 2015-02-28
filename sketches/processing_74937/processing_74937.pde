
int d = 60;

void setup() {
  size(400, 400);
  smooth();
  noCursor();
  stroke(200);
  strokeWeight(2);
}

void draw() {
  if(mousePressed) {
    background(3, 105, 155);
  }
  if(mouseX > 400 && mouseY > 400) {
    background(255);
  }
  else{
  fill(227, 0, 0, 30);
  float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
  //(pmouseX, pmouseY, mouseX, mouseY);
  ellipse(pmouseX + d, pmouseY + d, mouseX, mouseY);
  ellipse(width/2 - d, height/2 - d, mouseX, mouseY);
  }
}
