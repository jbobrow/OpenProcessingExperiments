
// Cliquer pour ajouter des bibittes.
// Appuyer sur une touche du clavier pour eliminer 
// la derniere bibitte qui a ete ajoutee


ArrayList bibittes;

void setup() {
  
  size(300,300);
  smooth();
  
  // Un ArrayList est un objet
  bibittes = new ArrayList();

}


void draw() {
  
  background(100);
  
  // Pour trouver la taille d'un tableau, on utilise .length
  // Pour trouver la taille d'un  ArrayList, on untile .size()
   for ( int i = 0 ; i < bibittes.size() ; i++ ) {
     Bibitte b = (Bibitte) bibittes.get(i);
     b.draw();
   }
   
   if (mousePressed) {
  color c = color(random(256),0,0);
  Bibitte b = new Bibitte(mouseX,mouseY,c);
  bibittes.add(b);
} 
}



void keyPressed() {
  
  if ( bibittes.size() > 0 ) {
    // Retirer la derniere
    bibittes.remove( bibittes.size()-1 );
    
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
