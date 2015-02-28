
//swing swing test relate to your mouse, try it
//TCY

void setup() {
  size(500, 300);
  smooth();
  
}

void draw() {
  strokeWeight(mouseY/10^2);

  if (mousePressed) {
    fill(25, 0.3*mouseY);
  }
  else {
    fill(250, mouseX/2);
    stroke(mouseY, mouseX/3, mouseX/2, mouseY);
  }
  ellipse(mouseX, mouseY, 0.1*mouseX, 0.2*mouseY);
  line(mouseX+20, mouseY+20, random(0.5*mouseX, 2*mouseX), random(0.5*mouseY, 2*mouseY));
}

void keyPressed(){
saveFrame("screen-###.png");
}


