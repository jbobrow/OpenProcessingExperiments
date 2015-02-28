

 
void setup() {
  size(245,245);
  smooth();
}
 
void draw() {
  background(220);
  
  for ( int i = 0 ; i < 7 ; i++ ) {
    voiture( i * 35 , height/2 , color(0,i*35,0) );
  }
  
   /*
  int i = 0;
  while ( i < 7 ) {
    voiture( i * 35 , height/2 , color(0,i*35,0) );
    i = i + 1;
  }
  */
   
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
                
