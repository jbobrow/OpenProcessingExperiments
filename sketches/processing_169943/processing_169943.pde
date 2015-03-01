
void setup() { 
  size(1024, 768); 
  noStroke(); 
  smooth();
}
void draw() { 
  background(0);
  for (float x =20; x<=1020; x+=50) {
    for (float y = 20; y<=760; y+=50) {
      float angle = atan2(mouseY-y, mouseX-x);
      pushMatrix();
      translate(x, y);
      rotate(angle);
      rect(-16,-4,24,8);
      rect(-8,-12,8,24);
      popMatrix();
      //pushMatrix();
    }
  }
  
}




