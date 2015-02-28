
// Plusieurs bibittes qui se promènent.
// Gestion des bibittes avec un tableau.
// Non interactif.

Bibitte[] bibittes;

void setup() {
  size(300,300);
  smooth();
  
  bibittes = new Bibitte[100];
  
  for ( int i = 0 ; i < bibittes.length ; i++ ) {
    
    bibittes[i] = new Bibitte( width/2 , height/2 , color(41,214,212) );
  }
 
  
}


void draw() {
  background(100);
   for ( int i = 0 ; i < bibittes.length ; i++ ) {
     bibittes[i] .draw();
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
