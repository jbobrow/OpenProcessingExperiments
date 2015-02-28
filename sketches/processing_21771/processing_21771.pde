
// *******************************************************************************
// * Algorithmie de base et interactivité EDM4600                                *
// * Auteur: Justin Leduc (LEDJ20058800)                                         * 
// * TP2 - Création d'une tapisserie interactive                                 *
// * Nom d'usager sur OpenProcessing.org: JustinL                                *
// * Lien URL du projet: ---                                                     *
// *******************************************************************************

// Déclaration des variables globales

float colonnes = 40;
float rangees = 40;
float taille = 1.3;
float cpt, cpt2, cpt3 = 0;
float rand, rand2;
color meterColor;

// Construction de canevas

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  // Bout de code écoutant la roulette de la souris
  // Source: http://wiki.processing.org/w/Wheel_mouse
  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
  }}); 
}

// Fonction modifiant la valeur des colonnes/rangées en fonction de la roulette de la souris

void mouseWheel(int delta) {
  if(delta==1){ // Si l'on roule la roulette vers l'arrière...
   if(colonnes<60){
     colonnes++;
     rangees++;
   }
  }else{ // Si l'on roule la roulette vers l'avant...
   if(colonnes>10){
     colonnes--;
     rangees--;
   }
  }
}

// Fonction dessinant la grille et l'audiomètre

void draw() {
 cpt++;
 cpt2++;
 background(40);
 float largeurColonne = width/colonnes;
 float hauteurRangee = height/rangees;
 for (int c=0; c<colonnes; c++){ // Pour chaque colonne...
  for (int r=0; r<rangees; r++){ // Pour chaque rangée...
    float distance = dist(mouseX, mouseY, c*largeurColonne, r*hauteurRangee);
    if(mouseX>c*largeurColonne-(distance/rand2) && mouseX<c*largeurColonne+largeurColonne/rand+(distance/rand2) && mouseY>2 && mouseY<r*largeurColonne-rand){
      // Puces colorées
      if(cpt3==0){
        fill(r*20, r*5, 0);
      }else if(cpt3==1){
        fill(r*0, r*10, r*20);
      }else if(cpt3==2){
        fill(r*14, r*20, 0);
      }
      puce(c*largeurColonne, r*hauteurRangee, largeurColonne/taille, hauteurRangee/taille);
    }else{
      // Puces vides
      fill(60);
      puce(c*largeurColonne, r*hauteurRangee, largeurColonne/taille, hauteurRangee/taille);
    }
  } 
 }
 if(cpt>4){
  rand = random(0,mouseY)*1.5;
  cpt=0;
 }
 if(cpt2>20){
   rand2 = random(3,20);
   cpt2=0;  
 }
}

void mousePressed(){
  if(cpt3<2){
    cpt3++;
  }else{
    cpt3=0; 
  }
}

// Fonction servant à construire les rectangles dans la grille

void puce(float positionX, float positionY, float larg, float haut){
  // Puces
  rect(positionX, positionY, larg, haut);
  // Petits rectangles
  fill(80);
  rect(positionX+larg, positionY+haut, larg/3.5, haut/3.5);
}

