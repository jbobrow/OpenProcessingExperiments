
void setup() {
  size(400,400);
  //draw();
}

void draw(){
  noStroke();
  if (mousePressed) {
    background(400,0,360);
  } else {
  background(0);
  }
  rectMode(CENTER);
  pushMatrix();
  translate(200,200);
  rotate(radians(mouseX));
  colorMode(HSB, 400, 360, 360);
  fill(mouseY, 360,360);
  rect(0,0,mouseX,mouseX);
  popMatrix();
}
