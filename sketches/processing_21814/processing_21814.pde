
/*************************

Auteur: Simon Desjardins

Un gros merci a Dan Rousseau
de m'avoir beaucoup aide avec 
mon projet!

Inspire du jeu PlantsVsZombies!

*************************/

/////////////////////////////////////
//--------Variables N Stuff--------//
/////////////////////////////////////

PImage[] aImages; //Les images de rien, fleurs et la pelle
PImage[] aMemoire; //Ou la fleur a ete dessine en memoire
int[] posX, posY; // position des pots
int nbPots, nbImages; //Nombre de pots et d'images a loader
int aImagesIndex,aMemoireIndex; //Index du array d'images et de la memoire
int colonnes, rangees; //Nombre de colones et de rangees
PImage pot, bg; //Images de pots et de background

//////////////////////////////
//--------Setup Time--------//
//////////////////////////////

void setup(){
  size(400,400);
  smooth();
  nbPots = 12;
  nbImages = 12;
  colonnes = 4;
  rangees = 3;
  aImagesIndex = 1;
  aMemoireIndex = 0;
  aImages = new PImage[nbImages];
  aMemoire = new PImage[nbPots];
  posX = new int[colonnes];
  posY = new int[rangees];
  pot = loadImage("pot.png");
  bg = loadImage("grass.png");
  
  //-- on load dynamiquement les images de fleurs, de vide et de pelle --//
  for(int i = 0; i < aImages.length; i++) {
    aImages[i] = loadImage("fl_" + i + ".png");
  }
  
  //-- Set les positions de X dans l'array posX --//
  for(int j = 0; j < posX.length; j++) {
    posX[j] = floor((width/colonnes) * j);
  }

  //-- Set les positions de Y dans l'array posY --//  
  for(int k = 0; k < posY.length; k++) {
    posY[k] = floor((height/rangees) * k);
  }
  
  //-- on initialise du vide dans tous les pots --//
  for(int l = 0; l < aMemoire.length; l++) {
    aMemoire[l] = aImages[0];
  }
}

//////////////////////////////
//--------Draw Time---------//
//////////////////////////////

void draw() {
  image(bg,0,0);
  int quelPot = 0;
  for(int i = 0; i < posX.length; i++) {
    for(int j = 0; j < posY.length; j++) {
      Pot(posX[i],posY[j]); 
      Fleur(posX[i],posY[j],quelPot); //on dessine les pots selon la position dans les array et on set la position dans quelPot
      quelPot++;
    }
  }
  
  MouseFleur();
}

//////////////////////////////
//---------Pot Time---------//
//////////////////////////////

void Pot(int x, int y) {
  image(pot,x,y); // ici le pot est dessine
}

//////////////////////////////////////
//---------Draw Flower Time---------//
//////////////////////////////////////

void Fleur(int x, int y, int quelPot) {
  image(aMemoire[quelPot],x,y); // on sauve en memoire la position du pot et la fleur est dessinee en se rappelant de la position
}

////////////////////////////////////////
//---------Preview Mouse Time---------//
////////////////////////////////////////

void MouseFleur(){
  image(aImages[aImagesIndex],mouseX-aImages[aImagesIndex].width/2,mouseY-aImages[aImagesIndex].height/2); //image en preview sur la souris
}

/////////////////////////////////////////
//---------Mouse Location Time---------//
/////////////////////////////////////////

void mousePressed(){
   int x = (mouseX/100); 
   int y = (mouseY/133); 
   
   //-- Ce qui determine la position de la souris dans l'image et on met en memoire cette position --//
   
   if(x == 0 && y == 0){
     aMemoireIndex = 0; // Pot 1
   }else if(x == 0 && y == 1){
     aMemoireIndex = 1; // Pot 2
   }else if(x == 0 && y == 2){
     aMemoireIndex = 2; // Pot 3
   }else if(x == 1 && y == 0){
     aMemoireIndex = 3; // Pot 4
   }else if(x == 1 && y == 1){
     aMemoireIndex = 4; // Pot 5
   }else if(x == 1 && y == 2){
     aMemoireIndex = 5; // Pot 6
   }else if(x == 2 && y == 0){
     aMemoireIndex = 6; // Pot 7
   }else if(x == 2 && y == 1){
     aMemoireIndex = 7; // Pot 8
   }else if(x == 2 && y == 2){
     aMemoireIndex = 8; // Pot 9
   }else if(x == 3 && y == 0){
     aMemoireIndex = 9; // Pot 10
   }else if(x == 3 && y == 1){
     aMemoireIndex = 10; // Pot 11
   }else if(x == 3 && y == 2){
     aMemoireIndex = 11; // Pot 12
   }
   
   if(aImagesIndex == 6){ //-- si c<Est la pelle, c'est le vide qui est sauve comme image et pas une fleur --//
     aMemoire[aMemoireIndex] = aImages[0]; 
   }else{
     aMemoire[aMemoireIndex] = aImages[aImagesIndex]; 
   }
   
 }
  
/////////////////////////////////////////////
//---------Flower type select Time---------//
/////////////////////////////////////////////
  
void keyPressed(){
  //Changer d'image selon les touches(1 à 6) du clavier ----ASCII -->49 à 54
    for(int i = 1; i < aImages.length; i++){
       if(keyCode >= 49 && keyCode <= 54) aImagesIndex = (keyCode-48); // Donner la valeur 1 à 6 selon le code ASCII
    }
}

