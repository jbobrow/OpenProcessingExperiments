
/*------------------------------------------------------------------
 Travail de rattrapage - Oeil
 Par Ugo Dufour
 EDM4600 - UQAM 2012
 -------------------------------------------------------------------*/
// Le code pour que la pupille suive la souris et soit constraint a l'oeil est base sur le code de Tomas O. Fredericks - http://www.openprocessing.org/sketch/52046

// Declaration et initialisation des variables
  int diametreOeil = 100;
  int diametrePupille = 30;
  float positionCouranteX = 200;
  float positionCouranteY = 200;
  float assouplissement = 0.04;
  float positionCibleX = 200; 
  float positionCibleY = 200;


void setup(){
  
  // Setup de la scene incluant la grosseur du canevas
    size(400,400);
    smooth();
    noStroke();
  
}


void draw(){
  
  // Dessin du background
    background(0);
    
  // Dessin de l'oeil
    fill(255);
    ellipse(positionCouranteX, positionCouranteY, diametreOeil, diametreOeil);
  
  // Determination des valeurs necessaires pour que la pupille suive la souris et reste dans l'oeil 
    float distance = dist(mouseX, mouseY, positionCouranteX, positionCouranteY);
    distance = constrain(distance, 0, diametreOeil/2-diametrePupille/2);
  
  // Calcul de l'angle en radians ainsi que la determiation de la position X et Y de la pupulle 
    float radians = atan2(mouseY-positionCouranteY, mouseX-positionCouranteX);  
    float pupilleX = cos(radians)* distance + positionCouranteX;
    float pupilleY = sin(radians)* distance + positionCouranteY;
  
  // Dessin de la pupille
    fill(0);
    ellipse(pupilleX, pupilleY, diametrePupille, diametrePupille);
    
  // Implementation de l'assouplissement sur l'oeil
    positionCouranteX = (positionCibleX - positionCouranteX) * assouplissement + positionCouranteX;
    positionCouranteY = (positionCibleY - positionCouranteY) * assouplissement + positionCouranteY;
}


void mousePressed(){

  // Donne la position de la souris aux valeurs positionX et positionY qui sont le centre de l'ellipse de  l'oeil
    positionCibleX = mouseX;
    positionCibleY = mouseY;
  
}
