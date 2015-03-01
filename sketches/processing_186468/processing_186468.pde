
void setup() {
  size(900,900);
   colorMode(HSB);
}
 
void draw() {
background(255);

  if (mousePressed) {
    ellipse(mouseX, mouseY, mouseX/2, mouseY/2);
    stroke(mouseX/2, 255, 255);
    
    fill(0, 0, 0);
    translate(width/2, height/4);
  } else {
  
    strokeWeight(3);
    fill(mouseX/2,255,255);
    ellipse(mouseX, mouseY, mouseX/8, mouseY/8);
}
}

