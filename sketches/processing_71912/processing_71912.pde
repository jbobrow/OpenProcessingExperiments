
// Coquille du jeu, version avec une gestion du temps.
 
// Constantes d'etat.
static final int INTRODUCTION = 0;
static final int JEU = 1;
static final int FIN = 2;
static final int CONCLUSION = 3;
 
// Variable pour la gestion des etats.
int etat = INTRODUCTION;
 
// Gestion du temps.
int millisDebutJeu; // Le moment lorsque commence le jeu.
int millisDebutFin; // Le moment lorsque commence la fin.
 
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
    // et memoriser le moment lorsqu'il commence.
     etat = JEU;
     millisDebutJeu = millis();
  } else if ( etat == JEU) {
      // Le jeu: dans cet exemple tres simple
      // le compteur de temps redemarre
      // lorsque l'interacteur clique.
       millisDebutJeu = millis();
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
   
   
  // Calculer le temps depuis le debut du jeu
  // ou depuis le dernier clique ( voir mousePressed() ).
  int temps = (millis() - millisDebutJeu);
   
  // Si le temps depasse 10 secondes, passer a la fin
  // et memoriser le moment lorsqu'elle commence.
  if ( temps >= 10000 ) {
    etat = FIN;
    millisDebutFin = millis();
  }
   
  // La largeur de la barre de defilement est determine
  // par le temps.
  float largeur = map( temps , 0 , 10000 , 0 , width);
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
  // a ete dessiner par le jeu.
  fill(0 , 5);
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
