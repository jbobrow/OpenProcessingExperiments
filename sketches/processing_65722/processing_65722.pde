

void setup() {
 size(600,600); 
 colorMode(HSB,100);
 frameRate(1);
}

void draw() {
  
  for (int i=0 ; i < 600 ; i++) {
   int couleur = int(random(100)) ; // Tire au sort entre 0 et 100
   stroke (couleur,100,100) ; // Couleur du crayon
   line (i,0,i,600) ; // (x1,y1,x2,y2)
  }
  
}

