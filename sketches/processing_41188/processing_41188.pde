
void setup() {
  size (400, 400);
  background (110, 150, 95);
  smooth();
}

float a = 0;


void draw() {
  fill(250, 250, 200);
  stroke(240, 90, 115);


  if ((mousePressed) && (a<255)) {
    a=(a +0.5)%width;
    strokeWeight(a/2);
    fill(250, mouseY, a);
    stroke(a+150, 10, mouseX/8);
    ellipse(mouseX, mouseY, a, a);
  } 
  else {
    a=0;
  }
}



