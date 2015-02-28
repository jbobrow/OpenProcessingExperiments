

                int largeur;

void setup() {
  largeur = 5;
  size(500,500);
  noStroke();
  frameRate(7);
  background(random(20),random(100),random(95));
}
void draw() {
  largeur = largeur + 1;
  fill(random(150),random(60),random(200),100);
  ellipse(mouseX,mouseY,largeur,largeur);
}
void mouseClicked() {
  largeur = 0;
  fill(random(100),random(200),random(200));
  triangle(mouseX,mouseY,mouseX+100,mouseY,mouseX+50,mouseY+100);
}
