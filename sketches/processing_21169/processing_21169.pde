

// Preload images:
/* @pjs preload="charest.jpg,argent.jpg"; */

int colonnes = 5;
int rangees = 4;

float largeur;
float hauteur;

PImage charest;
PImage argent;

void setup() {
 size(400,400); 
 smooth();
 noStroke();
 
 largeur = width/colonnes;
 hauteur = height/rangees;
 
 charest = loadImage("charest.jpg");
 argent = loadImage("argent.jpg");
}


void draw() {
  background(0);
  
  for ( int i = 0; i < colonnes ; i++ ) {
    for ( int j = 0; j < rangees ; j++ ) {
      float x = i * largeur;
      float y = j * hauteur;
      if ( insideRect( x , y , largeur , hauteur , mouseX, mouseY) ) {
        image( argent , x , y, largeur, hauteur);
      } else {
        image( charest , x , y, largeur, hauteur);
      }
    }
  }
}

boolean  insideRect (float rectX, float rectY, float rectW, float rectH , float x , float y) {
  return ( x > rectX && x < rectX+rectW && y > rectY && y < rectY+rectH ) ;
  
}


