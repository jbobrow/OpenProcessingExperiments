
Voiture[] tableauDeVoitures;


void setup() {
  size(400,400);
  
  tableauDeVoitures = new Voiture[100];
 
 for ( int i =0 ; i < 100 ; i++ ) {
   tableauDeVoitures[i] = new Voiture( 0, random(0,height), color( random(0,255), 0, 0), random(0.1, 3) );
   
 }

  
}


void draw() {
  background(127);
  
 for ( int i =0 ; i < 100 ; i++ ) {
    tableauDeVoitures[i].dessiner();
 }
  
}


class Voiture {
  
  float x;
  float y;
  color c;
  float v;
  
  Voiture ( float _x, float _y, color _c, float _v) {
    x = _x;
    y = _y;
    c = _c;
    v = _v;
  }
  
  void dessiner() {
    
    fill(c);
    rect(x,y,40,20);
    
    x = x + v;
    
    if ( x > width ) {
      x = -40; 
    }
    
  }
  
  
  
}
