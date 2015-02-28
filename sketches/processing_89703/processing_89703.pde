
int tempsSave;
int tempsTotal = 100; // Temps en millisecondes entre chaque cercle dessiné

void setup() {
  background(255);
  size(400, 400);
  smooth();
  frameRate(30);

  tempsSave = millis();
}

void draw() {  
  /* Je calcul combien de temps est passe */
  int tempsPasse = millis() - tempsSave;

  if (tempsPasse > tempsTotal) { // Si tempsTotal millisecondes se sont ecoulees..
    int randCoordX = int(random(0, width)); // position X random entre 0 et la largeur de la scene
    int randCoordY = int(random(0, height)); // position Y random entre 0 et la hauteur de la scene
    int randTaille = int(random(10,150));  // taille random entre 10 et 150px
    noStroke();
    fill(random(0,255),random(0,255),random(0,255),100); // couleur random avec un peu de transparence parceque c'est beau :)
    ellipse(randCoordX, randCoordY, randTaille, randTaille); // dessine un cercle là!
    tempsSave = millis(); // Je reinitialise tempsSave pour recommencer a compter
  }
}

void mousePressed(){
  background(255); // On nettoie tout!
}
