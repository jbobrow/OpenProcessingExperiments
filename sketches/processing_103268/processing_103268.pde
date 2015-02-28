
int Cx, Cy;

void setup() {
  size(500, 500);
  smooth();
  rectMode(CENTER);
}
void draw() {
  Cx = mouseX;
  Cy = mouseY;
  if (mousePressed) {
    Cy -= 50; // faz o robô “pular”
  }
  background(100);
  fill(255);
  strokeWeight(1);
  if ((Cy - 100) <= 0) {
    fill(#6AF769);
  }
  rect(Cx, Cy, 75, 175); // corpo
  ellipse(Cx, Cy - 45, 100, 100); // cabeça
  fill(255);
  ellipse(Cx, Cy - 50, 50, 50); // olho
  fill(0);
  ellipse(Cx + 5, Cy - 40, 10, 10); // olho
  strokeWeight(7);
  line(Cx - 10, Cy - 5, Cx + 10, Cy - 5); // boca
  line(Cx - 30, Cy + 10, Cx - 30, Cy + 70); // braço
  line(Cx + 30, Cy + 10, Cx + 30, Cy + 70); // braço
  line(Cx - 20, Cy + 85, Cx - 20, Cy + 150); // perna
  line(Cx + 20, Cy + 85, Cx + 20, Cy + 150); // perna
}



