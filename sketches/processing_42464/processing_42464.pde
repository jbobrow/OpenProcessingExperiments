
int a=0;

void setup() {
  size(400, 400);
  background(80, 91, 170);
  smooth();
}

void draw() {
  fill(29, 24, 31);

  //vinile
  ellipse(mouseX, mouseY, a, a);
  //cartone
  fill(251, 79, 33);
  ellipse(mouseX, mouseY, a/2.5, a/2.5);
  //buco
  fill(251, 79, 33);
  ellipse(mouseX, mouseY, a/15, a/15);

  //con mouse premuto aumenta la corconferenza
  if (mousePressed) {
    a=a+1;
    stroke(0);
  }
  else {
    stroke(255);
  }
}

void mouseReleased() {
  a=0;
}


