
 
void setup() {
  size(256,256);
  smooth();
}
 
void draw() {
  background(220);
   
  voiture();
  
 
}

// Dessiner voiture
void voiture() {
  
  float x = 100;
  float y = 100;
  color c = color(255,0,255);
  
  
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
                
