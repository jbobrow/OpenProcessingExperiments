

 
void setup() {
  size(245,245);
  smooth();
}
 
void draw() {
  background(220);
  
  for ( int i = 0 ; i < 7 ; i++ ) {
     for ( int j = 0 ; j < 8 ; j++ ) {
      voiture( i * 35 + 1 , j * 30 + 12, color(0,i*35,j*25) );
     }
  }
   
}

// Dessiner voiture
void voiture(float x, float y, color c) {
  
  float largeur = 30;
  float hauteur = 10;
  float rayon = 5;
  
  noStroke();
  fill(c);
  // Carosserie
  rect(x,y,largeur,hauteur);
  // Cabine
  rect( x+largeur/2-5 , y-10 , 10 , 10 );
  // Roues
  ellipse( x+rayon , y+hauteur+rayon , rayon*2 , rayon*2 );
  ellipse( x+largeur-rayon , y+hauteur+rayon , rayon*2 , rayon*2 );
  
}
                
