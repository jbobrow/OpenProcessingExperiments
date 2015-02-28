
// Une bibitte qui se promene.
// Non interactif.

Bibitte bibitte;

void setup() {
  size(300,300);
  smooth();
  
  bibitte = new Bibitte( width/2 , height/2 , color(255) );
  
}


void draw() {
  background(100);
  bibitte.draw();
  
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
