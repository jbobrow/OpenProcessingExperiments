
int dcercle = 50;                          //Définit la taille du cercle
int cote = 50;                             //Définit la taille du carré
int x = 150;                               //Définit le point de reference général
int y = 200;                               //Définit le point de reference général
boolean rond = false;                      //Permet de lire les états du carre en fonction que la souris soit cliquée à l'interieur du cercle
boolean carre = false;                     //Permet de lire les états du carre en fonction que la souris soit cliquée et maintenue à l'interieur du carré
int nbrerayons = 40;                       // Définit le nombre de rayon autour du cercle
float ecartrayon = TWO_PI / nbrerayons;    //Dégini l'écart entre chaque rayon pour pour que le cercle soit remplie equitablement
int ptAligne = 35;                         //Point B des lignes autour du cercle
int ptBligne = 65;                         //Point A des lignes autour du cercle
float rad = 0;                             //variable servant à determiner le point de depart des lignes autour du cercle
float vcercle = 0;                         //variable pour ajuster la vitesse de defilement des lignes du cercle
float vcarre = 0;                          //variable pour ajuster la vitesse de defilement des lignes du carre
 

void setup() {
  size(400, 400);
  smooth();
  
}


void draw() {
  background(#9F51BF);
  fill(0);
  int posxcercle = x-50;
  int posxcarre = x+100;
 
 //Si les conditions de souris ne sont pas validées, les lignes s'effacent
 if (carre == false ) {
    stroke(255);
    int i = 0;
    while ( i < vcarre ) {       
      line(0, i, height, i); 
      i = i + 10;
    }

 //Définit  la vitesse de décrémentation
 if (vcarre > 0) vcarre = vcarre - 3;
}

//Si les conditions sont validées, les lignes se dessinent
 else if (carre == true) {
    fill(#FF0313);
    stroke(255);
    int i = 0;
    while ( i < vcarre ) { 
      line(0, i, height, i); 
      i = i + 10;
    }
    
    //Définit la vitesse d'incrémentation
    if (vcarre < height) vcarre = vcarre + 3;
}
 
 //Dessine le carré apres la boucle pour qu'il reste rouge ou noir si les conditions sont validés ou non
  rectMode(CENTER);
  stroke(#FF0313);
  rect(posxcarre, y, cote, cote);


  //efface les lignes autour du cercle si les conditons ne sont pas validées
  if (rond == false) {
   fill(0);
   stroke(0);
   rad = 0;
   while ( rad < vcercle ) {
     line(posxcercle+cos(rad) * ptAligne, y + sin(rad) * ptAligne, posxcercle+cos(rad) * ptBligne, y + sin(rad) * ptBligne);
     rad = rad + ecartrayon;
     }

   //Définit  la vitesse de décrémentation
   if (vcercle > 0) vcercle = vcercle - 0.1 ;
   }
  
  //dessine les lignes autour du cercle si les conditions sont validées
  else if (rond == true) {
    fill(#FF0303);
    stroke(0);
    rad = 0;
    while ( rad < vcercle ) {
      line(posxcercle+cos(rad) * ptAligne, y + sin(rad) * ptAligne, posxcercle+cos(rad) * ptBligne, y + sin(rad) * ptBligne);
      rad = rad + ecartrayon;
      }
      
    //Définit la vitesse d'incrémentation
    if (vcercle < TWO_PI) vcercle = vcercle + 0.1 ;
    }
  
  //Dessine le cercle apres la boucle pour qu'il soit rouge ou noir si les conditions sont validés ou non
  strokeWeight(5);
  stroke(#FF0303);  
  ellipse(posxcercle, y, dcercle, dcercle);
    
  }
  
  //A la pression de la souris, on vérifie la position du curseur et ssi celui ci se trouve à l'intérieur
  // du carré ou du cercle, ceux ci s'activent pour dessiner les lignes dans les boucles plus haut    
  void mousePressed() {
    int posxcercle = x-50;
    int posxcarre = x+100;

    //détection de la position de la souris à l'intérieur du cercle
    float distcercle = dist(mouseX, mouseY, posxcercle, y);    
    if (distcercle < dcercle/2) {
      if (rond == false) rond = true;
      else rond = false;
    }
    
    //Détection de la position de la souris à l'intérieur du carré
    float distcarre = dist(mouseX, mouseY, posxcarre, y);
    if ( mouseX > posxcarre - cote / 2 && mouseX < posxcarre + cote / 2 && mouseY > y - cote / 2 && mouseY < y + cote / 2 ) {
      if (carre == false) carre = true;
      else carre = false;
    }
    
  }

  //Au relachement de la souris le carre est désactivé
  void mouseReleased() {
    carre = false;
  }
