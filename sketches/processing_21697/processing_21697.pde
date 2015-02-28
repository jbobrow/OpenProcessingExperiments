

 int voitures = 10;

 float[] x;
 float[] y;
 color[] c;
 
 
void setup() {
  size(256,256);
  smooth();
  
  x = new float[voitures];
  y = new float[voitures];
  c = new color[voitures];
  
  for ( int i =0; i < voitures; i++ ) {
    x[i] = random(width);
    y[i] = random(height);
    c[i] = color( random(256) , random(256) , random(256) );
  }
  
}
 
void draw() {
  background(220);
   
    for ( int i =0; i < voitures; i++ ) {
      voiture(x[i],y[i],c[i]);
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

