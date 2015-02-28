
void setup() {
  size(500,500);
  stroke(200);
  background(255);
}

void draw() {
  //background(255);

  fill(random(255),random(255),random(255));
  noStroke();
  ellipse(mouseX+random(15),mouseY+random(15),20,20);
  
}
