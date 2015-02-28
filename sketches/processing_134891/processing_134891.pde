
void setup() {
  size(displayWidth,displayHeight,P3D);
  background(0);
  lights();
}

void draw() {
  stroke(255,255,255);
  strokeWeight(7);
  fill(255,255,255);
  rect(0,0,2880,200);
  fill(255,255,128);
  rect(0,0,200,200);
  boolean x = mousePressed;
  if (mouseX < 200) {
    translate(mouseX,mouseY);
    if(mouseY < 200) {
      translate(mouseX,mouseY);
      if(mouseX > 0) {
        translate(mouseX,mouseY);
        if(mouseY > 0) {
          translate(mouseX,mouseY);
  directionalLight(255,600,-450,90,670,-255);
  stroke(128,190,255,103);
  strokeWeight(8);
  fill(128,128,190,170);
  pushMatrix();
  translate(mouseX,mouseY,0);
  sphere(40);
  popMatrix();
        }
      }
    }
  }
}
