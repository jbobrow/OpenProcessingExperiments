
// Deux bibittes qui se promenent.
// Non interactif.

Bibitte bibitte1;
Bibitte bibitte2;

void setup() {
  size(300,300);
  smooth();
  
  bibitte1 = new Bibitte( width/2 , height/2 , color(200,13,143) );
  bibitte2 = new Bibitte( width/2 , height/2 , color(143,13,200) );
  
}


void draw() {
  background(100);
  bibitte1.draw();
  bibitte2.draw();
  
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
