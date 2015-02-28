
// variables & translucency
// trying out effects of background fading
// schien@mail.ncku.edu.tw


void setup() { 
  size(480, 120);
  strokeWeight(0.5);
  background(0);
}

void draw() { 
  if (mousePressed) {
    // if mouse pressed... fading
    fill(0, 5);
    rect(0, 0, width, height);
  } 
  else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}



