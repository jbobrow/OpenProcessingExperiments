
float x;
float y;
float m;
float easing = 0.05;

void setup() {
  size(480, 480);
  background (98, 0, 0);
  smooth(150);
  strokeWeight (0);
}

void draw() {
  
  float col = dist(mouseX, mouseY, pmouseX, 50);
  strokeWeight(pmouseX*easing);
  ellipse(mouseX, mouseY, 50, 50);
  
  stroke (mouseY, mouseX, m);
  background (200);
   
  
  if (keyPressed && (keyCode == SHIFT)) {
    background (m, mouseY, mouseX+50);
    ellipse (240, 240, mouseX+40, mouseY) ;
  }
  else {
    background (40, 0, 0);
  }
  if (mousePressed) {
    fill (mouseY, mouseX, mouseX);
  }
  else {
    fill (mouseX, mouseY, pmouseX);
  }
 
}



