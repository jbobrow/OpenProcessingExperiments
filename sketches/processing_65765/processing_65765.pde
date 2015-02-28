

// CAPTURER UN NIVEAU SONORE

// Librairie
import ddf.minim.* ;

// Objet de classe
Minim son ;

// Déclaration d'une entrée audio
AudioInput entree ;

void setup() {
 
 size (640,480) ;
 smooth() ;
 
 son = new Minim(this) ;
 // Initialisation de l'entrée audio
 entree = son.getLineIn (Minim.MONO, 64) ; // (Type d'entrée, taille de la mémoire tampon)
  
}

void draw() {

 // Fond progressif qui efface les précédents dessins :
 noStroke();
 fill(0,10); // Couleur noire, à 10%
 rect(0, 0, width, height); // (x,y,w,h)
 
 // Crayon pour le dessin des ellipses
 stroke(255);
 noFill(); 
 
 // Une boucle parcourt l'échantillonnage sonore de bout en bout (64 valeurs, cf plus haut)
 for (int i = 0 ; i < entree.bufferSize() ; i++) {
 ellipse(i*10, height, entree.left.get(i)*6000, entree.right.get(i)*6000) ;
 // Tous les 10 pixels, on dessine une ellipse qui a la valeur de l'entrée son captée
 } 
  
}

void stop() {
  entree.close() ;
  son.stop() ;
  super.stop() ; 
}

