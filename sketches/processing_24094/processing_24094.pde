
ArrayList cerclesArrayList;

void setup() {
  size(400,400);
  smooth();
  cerclesArrayList = new ArrayList();

  for ( int i =0 ; i < 10 ; i++ ) {
    CercleClass cercle = new CercleClass();
    cerclesArrayList.add(cercle);
  }
}


void draw() {

  background(0);
  
  // Chercher les collisions
   for ( int i =0 ; i < cerclesArrayList.size() ; i++ ) {
     
     CercleClass cercle_i = (CercleClass) cerclesArrayList.get(i);
     
     for ( int j =i+1 ; j < cerclesArrayList.size() ; j++ ) {
       
       CercleClass cercle_j = (CercleClass) cerclesArrayList.get(j);
       float distance = dist(cercle_i.x,cercle_i.y,cercle_j.x,cercle_j.y);
       if ( distance < (cercle_i.diametre + cercle_j.diametre)/2 ) {
         cercle_i.couleur = color(255,0,0);
         cercle_j.couleur = color(255,0,0);
       }
     }
   }
  
  for ( int i =0 ; i < cerclesArrayList.size() ; i++ ) {
    CercleClass cercle = (CercleClass) cerclesArrayList.get(i);
    cercle.draw();
    // Remettre les couleurs aux valeurs initiales
    cercle.couleur = color(255);
  }
}

class CercleClass {
 float x,y; 
 float dx,dy;
 color couleur;
 int diametre;
  
  CercleClass() {
    diametre = 20;
    x = random(diametre/2,width-diametre/2);
    y= random(diametre/2,height-diametre/2); 
    couleur = color(255);
    dx = random(-2,2);
    dy = random(-2,2);
  }
  
  void draw() {
    
    x = x + dx;
    y = y + dy;
    
    if ( x > width-diametre/2 ) {
      dx = dx * -1;
      x =  width-diametre/2;
    } else if ( x < diametre/2 ) {
      dx = dx * -1;
      x =  diametre/2;
    }
    
     if ( y > height-diametre/2 ) {
      dy = dy * -1;
      y =  height-diametre/2;
    } else if ( y < diametre/2 ) {
      dy = dy * -1;
      y =  diametre/2;
    }
    
    noStroke();
    fill(couleur);
    ellipse(x,y,diametre,diametre);
    
  }
  
  
}
