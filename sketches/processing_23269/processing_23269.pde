
// Une nouvelle bibitte est generee a chaque seconde.
// Cliquer sur la bibitte pour l'eliminer.
 
ArrayList <Bibitte> bibittes;
 
int temps;
 
void setup() {
 
  size(300,300);
  smooth();
 
  // Un ArrayList est un objet
  bibittes = new ArrayList();
 
 
  temps = millis();
}
 
 
void draw() {
 
  background(100);
   
  // Ajouter une bibitte a chaque seconde
  if ( millis() - temps > 1000 ) {
    temps = temps + 1000;
    color c = color(0,random(256),0);
    Bibitte b = new Bibitte( random(width) , random(height) , c );
    bibittes.add(b);
  }
 
  for ( int i = 0 ; i < bibittes.size() ; i++ ) {
    Bibitte b =  bibittes.get(i);
    b.draw();
  }
   
}
 
void mousePressed() {
  // Il faut traverser l'ArrayList a l'envers lorsqu'on
  // prevoit retirer des elements
  for ( int i= bibittes.size() -1; i >= 0 ; i-- ) {
    Bibitte b = bibittes.get(i);
    float distance = dist(mouseX,mouseY,b.x,b.y);
    // Si la distance entre la souris et la bibitte
    // est moins de 5, on la retire.
    if ( distance  < 5)  {
      bibittes.remove(i);
    }
  }
}
 
 
class Bibitte {
  
 
 float x;
 float y;
 color c;
 
  Bibitte( float x , float y , color c ) {
    
   this.x = x;
   this.y = y;
   this.c = c;
     
  }
   
   
  void draw() {
     
    x = x + random(-2,2);
    y = y + random(-2,2);
     
    noStroke();
    fill(c);
    ellipse( x , y , 10 , 10 );
     
  }
   
   
   
}

