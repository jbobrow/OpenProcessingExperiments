
Voiture maVoiture;
Voiture maVoiture2;


void setup() {
  size(400,400);
  
  maVoiture = new Voiture( 100 , 100 , color(255,0,0) );
  
  maVoiture2 = new Voiture( 100, 200 , color(0,255,0) );
  
}


void draw() {
  background(127);
  
  maVoiture.dessiner();
  
  maVoiture2.dessiner();
  
}


class Voiture {
  
  float x;
  float y;
  color c;
  
  Voiture ( float _x, float _y, color _c) {
    x = _x;
    y = _y;
    c = _c;
    
  }
  
  void dessiner() {
    
    fill(c);
    rect(x,y,40,20);
    
    x = x + 1;
    
  }
  
  
  
}
