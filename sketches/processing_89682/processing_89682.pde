
float taille, distance, R, G, B;
boolean dansCercle;

void setup() {
  size(400, 400);
  smooth();
  frameRate(30);

  taille = 30;
  R = random(0, 255);
  G = random(0, 255);
  B = random(0, 255);
}

void draw() {
  background(255);

  fill(R, G, B); // Valeurs de R G B changees aleatoirement a chaque clic
  ellipse(width/2, height/2, taille, taille); // Centre, taille qui change a chaque clic

  distance = dist(mouseX, mouseY, width/2, height/2); // Distance entre curseur et centre du cercle

  dansCercle = distance < taille/2; // Curseur dans le cercle?
}

void mousePressed() {
  if (dansCercle) { // Si le curseur est dans le cercle
    R = random(0, 255); // Couleurs random
    G = random(0, 255);
    B = random(0, 255);
    if (mouseButton == LEFT) { // Si clic gauche..
      if(taille < width){ // Pas plus grand que la scene :)
        taille += 5; // Agrandi!
      }
    }
    else {
      if(taille > 5){ // Pas plus petit que 5 sinon il disparait!
        taille -= 5; // Rappetit!
      }
    }
  }
}
