
float compteur = 0;
color couleur_1_1 = color(191, 42, 42);
color couleur_1_2 = color(242, 71, 56);
color couleur_2_1 = color(2, 73, 89);
color couleur_2_2 = color(242, 199, 119);
void setup() {
  size(400, 400);
  noFill();
}
void draw() {
  background(0);
  translate(width / 2, height / 2);
  strokeWeight(0.30);
  float nbRotation01 = TWO_PI / 25;
  for (int i = 0; i < 25; i++) {
    pushMatrix();
    rotate(nbRotation01 * i + compteur);
    for (int j = 0; j < 20; j++) {
      color degrade_01 = lerpColor(couleur_1_2, couleur_1_1, map(i, 0, 20, 0, 1 ));
      stroke(degrade_01);
      ellipse(0, -50, 50, 125 + (j * 5));
    }
    popMatrix();
  }
  float nbRotation02 = TWO_PI / 100;
  for (int i = 0; i < 100; i++) {
    pushMatrix();
    rotate(nbRotation02 * i + compteur);
    color degrade_02 = lerpColor(couleur_2_1, couleur_2_2, map(i, 0, 100, 0, 1 ));
    stroke(degrade_02);
    ellipse(0, -50, 225, 225);
    popMatrix();
  }
  //compteur += 0.002;
}
