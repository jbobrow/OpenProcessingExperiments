
// by gilles marion

// Définition des variables
float diametre = 48; // diametre du plus grand cercle de base
int ecart = 50; // écartement des cercles, pour laisser un blanc entre
int decalage = ecart/2; // décalage du centre des cercles …
// … par rapport au bord de la fenêtre ( moitié de l'écartement )
float posX, posY; // variables pour les ccordonnées du centre du cercle
int nombreEllipses = 5;

void setup() {
  size(501,501); //501 pixels et pas 500 pour que les ellipses ne touchent pas les bords
  background(255);
  smooth();
}

void draw() {
  for (int i = 0; i < 10; i++) { // première boucle pour répéter les ellipses en X, 10 fois
    for (int j = 0; j < 10; j++) { // seconde boucle pour répéter les ellipses en Y, 10 fois
      for (int n = 1; n < nombreEllipses; n++) { // troisième boucle pour imbriquer plusieurs ellipses
        posX = decalage + i*ecart;
        posY = decalage + j*ecart;
        diametre = diametre/n; // le diametre est divisé par le nombre de tours de la boucle, de 1 à 4
        ellipse(posX, posY, diametre, diametre);
      }
      diametre = 48; // On ramène le diamètre à sa valeur d'origine, le grand cercle, 
      // avant de redessiner une série de 4 cercles imbriqués
    }
  }
}






