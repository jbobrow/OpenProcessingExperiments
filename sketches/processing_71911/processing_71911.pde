
// Coquille du jeu, version avec un compteur.
 
// Constantes d'etat.
 final int INTRODUCTION = 0;
 final int JEU = 1;
 final int FIN = 2;
 final int CONCLUSION = 3;
 
// Variable pour la gestion des etats.
int etat = INTRODUCTION;
 
// Gestion du compteur.
int compteur = 0;
 
// Le moment lorsque commence la fin.
int millisDebutFin;
 
void setup() {
  size(400, 400);
  smooth();
}
 
void draw() {
  // Executer le code approprie selon l'etat.
  if( etat == INTRODUCTION ) {
    introduction();
  } else if ( etat == JEU) {
    jeu();
  } else if ( etat == FIN) {
    fin();
  } else {
    conclusion();
  }
   
}
 
// Aiguiller la reaction a un clique selon l'etat.
void mousePressed() {
   
  if( etat == INTRODUCTION ) {
    // Si on est a l'introduction, activer le jeu
    // et re-initialiser le compteur.
     etat = JEU;
     compteur = 0;
  } else if ( etat == JEU) {
      // Le jeu: dans cet exemple tres simple
      // le compteur incremente
      // lorsque l'interacteur clique.
       compteur = compteur + 1;
  } else if ( etat == FIN) {
    // Rien faire pour l'animation de la fin.
  } else {
    // Si on est a la conclusion, redemarrer.
    etat = INTRODUCTION;
  }
   
}
 
// Executer et dessiner l'introduction.
void introduction() {
  background(255);
   
  // Dessiner le texte "Introduction".
  textAlign(CENTER,CENTER);
  textSize(48);
  fill(0);
  text("Introduction",width/2,height/2);
}
 
// Executer et dessiner le jeu.
void jeu() {
  background(128);
   
   // Dessiner le texte "Jeu".
  textAlign(CENTER,CENTER);
  textSize(48);
  fill(50,255,50);
  text("Jeu",width/2,height/2);
   
  // Se rendre a la fin si le compte est bon
  if ( compteur >= 4 ) {
    etat = FIN;
    millisDebutFin = millis();
  }
   
  // La largeur de la barre de defilement est determine
  // par le compteur.
  float largeur = map( compteur , 0 , 4 , 0 , width);
  largeur = constrain(largeur,0,width);
  noStroke();
  fill(255);
  rect(0,width-20,largeur,20);
   
   
}
 
 
// Executer et dessiner la fin.
void fin() {
   
  // Calculer le temps depuis le debut de la fin.
  int temps = millis() - millisDebutFin;
  // Si le temps depasse 5 secondes, passer a la conclusion.
  if ( temps >= 5000 ) etat = CONCLUSION;
   
  // Effectuer un fondu avec ce qui
  // a ete dessine par le jeu.
  fill(0 , 2);
  rect(0,0,width,height);
   
}
 
// Executer et dessiner la conclusion.
void conclusion() {
  background(0);
   
   // Dessiner le texte "Conclusion".
  textAlign(CENTER,CENTER);
  textSize(48);
  fill(255);
  text("Conclusion",width/2,height/2);
}
