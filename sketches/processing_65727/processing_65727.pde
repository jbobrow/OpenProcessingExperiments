
int couleur = 0 ;
float dim ; // float = nombre à virgule

void setup() {
  size(600,600) ;
  background(0) ;
  frameRate(45);
  noStroke();
  colorMode(HSB,100) ;
  smooth();
}

void draw() {
  
  // Boucle conditionnelle pour faire varier "couleur"
  if (couleur <= 100) {
  couleur++ ; 
  }
  else { couleur = 0 ; }
  
  // Couleur de remplissage
  fill (couleur, 50, 100, 25) ; // (H,S,B,Alpha)
  
  // A chaque appel de "draw", on calcule
  // la distance qui sépare les 2 dernières positions
  // successives de la souris
  dim = dist (mouseX,mouseY,pmouseX,pmouseY) ;
  
  // Dessin
  ellipse (pmouseX,pmouseY,dim,dim) ;
  
}

