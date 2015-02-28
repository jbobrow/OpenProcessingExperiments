

/*
processing javascipt must use preload for images
/*

/* @pjs preload="fl_0.png,fl_1.png,fl_2.png,fl_3.png,fl_4.png,pelle.png,pot.png"; */


PImage[] images; //Les images de riende fleurs
PImage[][] pots; //Le contenu des pots
PImage pot, pelle; 
int colonnes = 4;
int rangees = 3;

PImage souris; //Image de la souris

float largeurColonne;
float hauteurRangee;

void setup(){
  size(400,400);
  smooth();

  images = new PImage[5];
  
  pot = loadImage("pot.png");
  pelle = loadImage("pelle.png");
  
  //-- on load dynamiquement les images de fleurs, de vide et de pelle --//
  for(int i = 0; i < images.length; i++) {
    images[i] = loadImage("fl_" + i + ".png");
  }
  
  pots = new PImage[colonnes][rangees]; // Chaque cellule de ce tableau 2D a comme valeur null au demarrage
  
  souris = images[0];
  
   largeurColonne = width/colonnes;
   hauteurRangee = height/rangees;
   
   for(int i = 0; i < colonnes ; i++) {
    for(int j = 0; j < rangees ; j++) {
     
      pots[i][j] != null;
       
      
    }
  }
}


void draw() {
  background(100);


  for(int i = 0; i < colonnes ; i++) {
    for(int j = 0; j < rangees ; j++) {
      float x = i * largeurColonne;
      float y = j * hauteurRangee;
      image(pot,x,y,largeurColonne,hauteurRangee);
      if ( pots[i][j] != null ) {
        image(pots[i][j],x,y);
      }
      
    }
  }
  
 

  image (souris , mouseX-souris.width/2 , mouseY-souris.height/2);
  
}

void mousePressed(){
  
  // Trouver le i et j de la cellule
  int i = floor(mouseX/largeurColonne);
  int j = floor(mouseY/hauteurRangee);
  
  
  pots[i][j] = souris;
 
  
}

void keyPressed(){
  //Changer d'image selon les touches(1 à 5) du clavier ----ASCII -->49 à 54
  if ( keyCode >= 49 && keyCode <= 53 ) {
    souris = images[keyCode-49];
  }
 
}




