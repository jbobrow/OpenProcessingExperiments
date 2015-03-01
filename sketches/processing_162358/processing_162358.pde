
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/161478*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
// by gilles marion
//modifié par Antoine DERRIEY

// Définition des variables
float diametre = 48; // diametre du plus grand cercle de base
float ecart = 50; // écartement des cercles, pour laisser un blanc entre
float ecart2 = 50; // écartement des cercles, pour laisser un blanc entre
float decalage = ecart/2; // décalage du centre des cercles …
// … par rapport au bord de la fenêtre ( moitié de l'écartement )
float decalage2 = ecart/2; // décalage du centre des cercles …
// … par rapport au bord de la fenêtre ( moitié de l'écartement )
float posX, posY; // variables pour les ccordonnées du centre du cercle
float posX2, posY2; // variables pour les ccordonnées du centre du cercle
float nombreEllipses = 5;

void setup() {
  size(501, 501, P3D); //501 pixels et pas 500 pour que les ellipses ne touchent pas les bords
  background(255);
  smooth(255);
  stroke(0, 0, 0);
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


      if (mousePressed) {

        frameRate (40);
        
        // 40 images secondes, ça va très vite pour une jolie animation de couleur

              posX2 = decalage + i*ecart;
              posY2 = decalage + j*ecart;

              fill(random(20, 250), random(100), mouseY+mouseX-500, 30);
              //le bleu dépend de la position du curseur, le R et le V sont en aléatoire,#c'estlafête

              ellipse(posX2, posY2, mouseX/4+mouseY/4+50, mouseX/4+mouseY/4+50); //on modifie
              //le diamètre en fonction de la position du curseur grâce à un calcul extremement complexe
            }
          }
        }
      }
      void keyPressed(){
  if ( key == 's') {
    saveFrame("JOLI-#.png");
    //enregistre plusieurs images (01,02,03)
  }
}



