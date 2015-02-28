
void setup() {
  size(900, 600);
  smooth();
  background(252, 255, 178);
}

void draw() {
  for (int m=0; m<62; m++) {
    for (int p=0; p<90; p++) {
      fill(mouseX, 230, mouseY); 
      ellipse(10*p, 10*m, random(p), 12);
    }
  }

  strokeWeight(.5);
  stroke(random(255), random(90), random(120));
}



