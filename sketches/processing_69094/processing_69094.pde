
/* ---------------------------------------
 RattrapageB
 par
 Guillaume Perreault Roy
 
 -----------------------------------------*/


boolean etatCercle = false; //Le cercle ajoute ou enlève des lignes
boolean etatHorizontale = true; //Ajouter ou enlever des lignes horizontales

int ligneHorizontale = 0; //Valeur de progression (boucle) des lignes horizontales
int maxHorizontale = 0; // limite des lignes horizontales

float maxCirculaire = 0; // limite des lignes circulaires

float milieuCercle_x = 140; //point d'ancrage du cercle (x)
float milieuCercle_y = 200; //point d'ancrage du cercle (y)
int nombreRayons = 20;
int longueurRayons = 55;

float tranche = TWO_PI / nombreRayons; 
float rads = 0; //Valeur de progression (boucle) des lignes circulaires
float ratio = 0.55; //espace non-dessiné entre le point de rotation et l'origine de la ligne

float x1 = 0; //premier point d'ancrage des lignes circulaires (x)
float y1 = 0; //premier point d'ancrage des lignes circulaires (y)
float x2 = 0; //2ème point d'ancrage des lignes circulaires (x)
float y2 = 0; //2ème point d'ancrage des lignes circulaires (y)


void setup() {
  size(400,400);

}
   
void draw() {
  
  //Ré-initialiser les propriété des lignes (pas de lignes sur les boutons)
  
  smooth();
  strokeWeight(5);
  stroke(0);
  
  background(115); // Dessiner le background en premier pour effacer les vieilles lignes
  
  // Vérifie l'état du cercle pour ajuster la limitation des lignes 
  //circulaires AVANT la boucle while (parceque le déclenchement 
  //du bouton circulaire est dans le void mousepressed)  
  if(etatCercle==false){
         fill(55,255,0);//ajuste la couleur du cercle
         if(maxCirculaire>0){ //condition: Min du Max
           maxCirculaire -=0.2;
         }
  }
  if(etatCercle==true){
          fill(255,0,255);
          if(maxCirculaire<TWO_PI){ //condition: Max du Max
           maxCirculaire +=0.2;
          }
  }
  
  
  
  rads = 0; //Réinitialise le facteur des lignes circulaires AVANT la boucle while
  
    while ( rads < maxCirculaire ) { // condition: le facteur < que le limiteur
            
            //données dessinant la ligne
            x1 = milieuCercle_x + cos(rads) * longueurRayons * ratio;
            y1 = milieuCercle_y + sin(rads) * longueurRayons * ratio;
            x2 = milieuCercle_x + cos(rads) * longueurRayons;
            y2 = milieuCercle_y + sin(rads) * longueurRayons;
            line(x1,y1,x2,y2);
          
          rads = rads + tranche; // incrementation du facteur de lignes circulaires
    }

    ligneHorizontale=0; //Réinitialise le facteur des lignes horizontales AVANT la boucle while
  
    while ( ligneHorizontale < maxHorizontale ) { // condition: le facteur < que le limiteur
          line(0,ligneHorizontale,height ,ligneHorizontale); // bloc de code
        
          ligneHorizontale = ligneHorizontale + 20; // incrementation
    }
  
  noStroke(); //fini de dessiner les lignes, rien autour des boutons
  ellipse(140, 200, 50, 50);//dessiner le bouton rond
  
  //conditon pour activer le bouton carré, ne change que l'état
  if (mousePressed) { 
    if ( mouseX > 250 && mouseX < 300 && mouseY > 175 && mouseY < 225 ) {
      etatHorizontale = true;
    }
  }
  else{
      if(maxHorizontale>0){
        etatHorizontale = false;
      }
  }
  //applique les effet de l'état du bouton carré (couleur et max
  //des lignes horizontales) sans la condition ELSE de mousepressed
  if(etatHorizontale==false){
         fill(55,255,0);
         if(maxHorizontale>0){
           maxHorizontale -=25;
         }
  }
  if(etatHorizontale==true){
         fill(255,0,255);
         if(maxHorizontale<height){
           maxHorizontale +=25;
         }
  }
  
  
  rect(250, 175, 50, 50);//Dessine le bouton carré


}

void mousePressed() {
//Détection de touches du cercle  

  float distance = dist( mouseX , mouseY , 140 , 200 );
  if ( distance < 25 ) {
       if(etatCercle==false){
         etatCercle=true;
       }
       else{
         etatCercle=false;
       }
  }
  
  
}

