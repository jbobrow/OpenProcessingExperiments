
// by gilles marion
// modifiÃ© par AurÃ©lie Virely
//corrigé par Lucille

//1)***
//2)***
//3)***
//4)***
//5)***
//6)***
//7)***
//8)***
 
// DÃ©finition des variables
float diametre = 48; // diametre du plus grand cercle de base
int ecart = 50; // Ã©cartement des cercles, pour laisser un blanc entre
int decalage = ecart/2; // dÃ©calage du centre des cercles â�¦
// â�¦ par rapport au bord de la fenÃªtre ( moitiÃ© de l'Ã©cartement )
float posX, posY; // variables pour les ccordonnÃ©es du centre du cercle
int nombreEllipses = 5;
float decalageRondsX, decalageRondsY;

void setup() {
  size(501,501); //501 pixels et pas 500 pour que les ellipses ne touchent pas les bords
  background(255);
  smooth();
}
 
void draw() {
    background(255);

  
  for (int i = 0; i < 10; i++) { // premiÃ¨re boucle pour rÃ©pÃ©ter les ellipses en X, 10 fois
    for (int j = 0; j < 10; j++) { // seconde boucle pour rÃ©pÃ©ter les ellipses en Y, 10 fois
      for (int n = 1; n < nombreEllipses; n++) { // troisiÃ¨me boucle pour imbriquer plusieurs ellipses
        posX = decalage + i*ecart;
        posY = decalage + j*ecart;
        
        //DÃ©calage aprÃ¨s clic souris
        if (mousePressed) {
          posX = posX + random(10);
        }
        diametre = diametre/n; // le diametre est divisÃ© par le nombre de tours de la boucle, de 1 Ã  4
        ellipse(posX, posY, diametre, diametre);
        
      }
      diametre = 48; // On ramÃ¨ne le diamÃ¨tre Ã  sa valeur d'origine, le grand cercle,
      // avant de redessiner une sÃ©rie de 4 cercles imbriquÃ©s
    }
  }


}




