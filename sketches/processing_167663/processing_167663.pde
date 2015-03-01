
void setup() { 
  size(760, 760); 
  noStroke(); 
  smooth();
}
void draw() { 
  background(0);
  for (float x =50; x<=700; x+=50) {
    for (float y = 50; y<=700; y+=50) {
      float angle = atan2(mouseY-y, mouseX-x);
      colorMode(HSB);
      fill(random(0,mouseX),random(0,mouseY),255);
      pushMatrix();
      translate(x, y);
      rotate(angle);
      triangle(-20, -8, 20, 0, -20, 8);
      popMatrix();
    }
  }
}


