
// *******************************************************************************
// * Image de synthèse et interactivité EDM4610                                  *
// * Auteur: Justin Leduc (LEDJ20058800)                                         *
// * TP1 - Engin génératif                                                                   *
// *******************************************************************************

// *** DÉCLARATION DES VARIABLES ***
ArrayList anneauxList, etoilesList, grosseEtoileList;
int nbCircles;
float[] cScales;

void setup(){
  
  // Initialisation du canevas
  size(800, 600);
  smooth();
  noFill();
  
  anneauxList = new ArrayList();
  etoilesList = new ArrayList();
  grosseEtoileList = new ArrayList();
  
  nbCircles = int(random(10, 15)); // Nombre d'anneaux à générer
  
  cScales = new float[nbCircles]; // Tableau qui contiendra la grandeur des anneaux

  // Génération des anneaux
  for(int i = 0; i < nbCircles; i++){
    cScales[i] = random(1.003, 1.005);
    anneauxList.add(new Anneau(i));
  }

  // Génération des petites étoiles
  for(int t = 0; t <= int(random(250, 550)); t++){
    etoilesList.add(new Etoiles(t));
  }
  
  // Génération des grosses étoiles
  for(int k = 0; k <= 4; k++){
    grosseEtoileList.add(new GrosseEtoile());
  }
  
}

void draw(){
  
  background(10);
  
  strokeWeight(1);
  stroke(255, 255);
  
  // Étoiles
  for (int h = etoilesList.size()-1 ; h >= 0 ; h--) {
     Etoiles etoiles = (Etoiles) etoilesList.get(h);
     etoiles.display();
   }
   
   // Grosses étoiles
   for (int j = grosseEtoileList.size()-1 ; j >= 0 ; j--) {
     GrosseEtoile grosseEtoile = (GrosseEtoile) grosseEtoileList.get(j);
     grosseEtoile.display();
   }
  
  // Anneaux
  for (int k = anneauxList.size()-1 ; k >= 0 ; k--) {
     Anneau ann = (Anneau) anneauxList.get(k);
     ann.display();
   }
  
}

// Classe générant des petites étoiles

class Etoiles{
 
 // *** VARIABLES *** 
 
 // Instance de l'étoile (depuis la boucle du haut)
 int clef;
 
 // Transparence des étoiles
 int etoileAlpha = int(random(85, 220));
 
 // Position des étoiles
 int posX = int(random(800));
 int posY = int(random(600));
 
 
 // Constructeur
 Etoiles(int laClef){
   clef = laClef;
 }
 
 void display(){
   strokeWeight(1);
   stroke(255, etoileAlpha);
   if(clef%10==1){
      strokeWeight(3);
   }else{
     strokeWeight(1);
   }
   point(posX, posY);
 }
  
}

// Classe générant de grosses étoiles

class GrosseEtoile{
 
  // *** VARIABLES ***
  
 // Position des étoiles
 int posX = int(random(800));
 int posY = int(random(600));
  
  // Constructeur
  GrosseEtoile(){
  }
  
  void display(){
    pushMatrix();
      noStroke();
      createGradient(posX, posY, 10, color(60, 60, 60), color(0, 0, 0));
      stroke(color(255, 30));
      strokeWeight(1);
      line(posX, posY+10, posX, posY-10);
      line(posX-10, posY, posX+10, posY);
      noStroke();
      noFill();
    popMatrix();
  }
  
}

// Classe générant les anneaux

class Anneau{
  
  // *** VARIABLES ***
  
  int varI;
  
  // Angles des anneaux
  float cSmallAng;
  float cBigAng;
  float cOffset;
  
  // Taille des anneaux
  int cSize;
  float cScale;
  int cDepth;
  
  // Couleurs de la "stroke"
  int cStrokeCol;
  int cAlpha;
  
  // Constructeur
   Anneau(int i){
     varI = i;
     cSize = 30+(i*40);
     cSmallAng = random(PI);
     cBigAng = random(PI, TWO_PI);
     cOffset = 0.2;
     cStrokeCol = 10+(i*3);
     cAlpha = int(random(200, 255));
     cScale = cScales[1];
     cDepth = int(random(7+i, 15+i));
   }
   
   void display(){
     
    pushMatrix();
    
      translate(width/2, height/2);
      
      rotate(varI);
      
      // Pour chaque segment de l'anneau...
      for(int j = 0; j <= cDepth; j++){
        
        // Si c'est la bordure de l'anneau...
        if(j==cDepth){
          strokeWeight(1+(cDepth/10));
          stroke(0, 180, 255, cAlpha);
        }else{
          strokeWeight(4);
          stroke(0, cStrokeCol+j, cStrokeCol+(j*4), cAlpha);
        }
        
        // Segments de l'anneau
        beginShape();
          scale(cScale);
          arc(0, 0, cSize, cSize, 0, cSmallAng/2-cOffset);
          arc(0, 0, cSize, cSize, cSmallAng/2+cOffset, cSmallAng);
          arc(0, 0, cSize, cSize, cSmallAng+cOffset, cBigAng-cSmallAng/2-cOffset);
          arc(0, 0, cSize, cSize, cBigAng-cSmallAng/2+cOffset, cBigAng-cOffset);
        endShape();
        
        // Faible lueur appliquée sur la bordure de l'anneau
        if(j==cDepth){
          pushMatrix();
            strokeWeight(1+(cDepth/3));
            stroke(0, 180, 255, 15);
            beginShape();
              scale(cScale);
              arc(0, 0, cSize, cSize, 0, cSmallAng/2-cOffset);
              arc(0, 0, cSize, cSize, cSmallAng/2+cOffset, cSmallAng);
              arc(0, 0, cSize, cSize, cSmallAng+cOffset, cBigAng-cSmallAng/2-cOffset);
              arc(0, 0, cSize, cSize, cBigAng-cSmallAng/2+cOffset, cBigAng-cOffset);
            endShape();
          popMatrix();
        }
      
      } // for
      
      // Segments visant à donner l'illusion d'un labyrinthe
      pushMatrix();
        strokeWeight(1+(cDepth/10));
        stroke(0, 180, 255, cAlpha);
        translate(0, 0);
        int proch_i = varI+1;
        line((cSize*cScale/2), 0, ((30+(proch_i*cScale*40))/2), 0);
      popMatrix();
    
    popMatrix();
    
   }
  
}

// Fonction générant des dégradés radials
// Source: http://processing.org/learning/basics/radialgradient.html

void createGradient (float x, float y, float radius, color c1, color c2){
  float px = 0, py = 0, angle = 0;

  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);
  // hack to ensure there are no holes in gradient
  // needs to be increased, as radius increases
  float gapFiller = 8.0;

  for (int i=0; i< radius; i++){
    for (float j=0; j<360; j+=1.0/gapFiller){
      px = x+cos(radians(angle))*i;
      py = y+sin(radians(angle))*i;
      angle+=1.0/gapFiller;
      color c = color(
      (red(c1)+(i)*(deltaR/radius)),
      (green(c1)+(i)*(deltaG/radius)),
      (blue(c1)+(i)*(deltaB/radius)) 
        );
      set(int(px), int(py), c);      
    }
  }

  // adds smooth edge 
  // hack anti-aliasing
  noFill();
  strokeWeight(3);
  ellipse(x, y, radius*2, radius*2);
}

