
/* typo utiliser PFONT, loadFont, text (), loadFond ( mettre le nom de la typo)

*/


PFont font ;
/*pour introduire une variable qui contient du tient on ecrit quote,
au lieu de la phrase*/


void setup () {
  size (1000,1000) ;
  frameRate (60) ;
  font=loadFont ("TempusSansITC-48.vlw") ;
  textFont(font, 48) ;
 
}

void draw() {
  fill (0) ;
  text("HI, HOW ARE YOU", random (width),random (height));
println (frameRate);
}

// fichier SVG , faire des vecteurs ;
// Frame rate ( nombre de frame/s , 60 fois

