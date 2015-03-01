
// by gilles marion modified by MAXIME PONT
  
// DÃ©finition des variables
float diametre = 48; // diametre du plus grand cercle de base
int ecart = 70; // Ã©cartement des cercles, pour laisser un blanc entre
int decalage = ecart/2; // dÃ©calage du centre des cercles â�¦
// â�¦ par rapport au bord de la fenÃªtre ( moitiÃ© de l'Ã©cartement )
float posX, posY; // variables pour les ccordonnÃ©es du centre du cercle
int nombreEllipses = 5;
  
void setup() {
  size(501,501); //501 pixels et pas 500 pour que les ellipses ne touchent pas les bords
  background(255);
  smooth();
}
  
void draw() {
 {noFill();
  //rect(0,0,501,501);
}
  
  for (int i = 0; i < 20; i++) { // premiÃ¨re boucle pour rÃ©pÃ©ter les ellipses en X, 10 fois
    for (int j = 0; j < 20; j++) { // seconde boucle pour rÃ©pÃ©ter les ellipses en Y, 10 fois
      for (int n = 1; n < nombreEllipses; n++) { // troisiÃ¨me boucle pour imbriquer plusieurs ellipses
        posX = decalage + i*ecart;
        posY = decalage + j*ecart;
        diametre = diametre/n; // le diametre est divisÃ© par le nombre de tours de la boucle, de 1 Ã  4
       fill(random(0),random(250),random(255));
        
      }
      diametre = 48; // On ramÃ¨ne le diamÃ¨tre Ã  sa valeur d'origine, le grand cercle,
      // avant de redessiner une sÃ©rie de 4 cercles imbriquÃ©s
    }
  }
  
  if (mousePressed == true) {
    background(random(0), random(250), random(255));
    strokeWeight(random(40));
ellipse(mouseX,mouseY, diametre, diametre);
  }
}


