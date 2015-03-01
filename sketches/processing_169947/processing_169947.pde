


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
      colorMode(HSB);
      //fill(random(0,mouseX),random(0,mouseY),255);
      pushMatrix();
      translate(x, y);
      rotate(angle);
      rect(-4,-16,4,24);
      rect(-20, -8, 20, 0);
      popMatrix();
    }
    
  }
}




