
import processing.video.*; // importer la librairie video

//MovieMaker mm; // déclaration variable MovieMaker

// initialisation du programme
void setup(){
  size (400,400);
  background(255);
  smooth();
  //mm = new MovieMaker(this, width, height, "monFilm.mov", 30, MovieMaker.JPEG, MovieMaker.BEST); // enregistrement vidéo au format.mov
}
    
    
// dessin    
void draw(){
  float rayon = random(50);
  fill(0,random(0,30));
  noStroke();
  ellipse(mouseX, mouseY-20,rayon,rayon); // ellipse décalé du cursseur
  ellipse(400-mouseX, mouseY-20,rayon,rayon); // ellipse symetrique
  //mm.addFrame(); // Add window's pixels to movie
}

// appyer sur la souris
void mousePressed(){
  background(255); //nettoyer écran
}

/*
void exit(){
  mm.finish();// fin d'enregistrement vidéo
  super.exit(); // fermeture de la fenetre
}
*/

