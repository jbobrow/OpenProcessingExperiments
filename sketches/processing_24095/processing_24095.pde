
ArrayList cerclesArrayList;

void setup() {
  size(400,400);
  smooth();
  cerclesArrayList = new ArrayList();
  
  genererCercles();
  
  
}


void draw() {

  background(0);
  
  // Chercher les collisions
   for ( int i =cerclesArrayList.size()-2 ; i >= 0 ; i-- ) {
     CercleClass cercle1 = (CercleClass) cerclesArrayList.get(i);
     boolean supprimer_i = false;
     for ( int j =cerclesArrayList.size()-1 ; j > i ; j-- ) {
        CercleClass cercle2 = (CercleClass) cerclesArrayList.get(j);
       float distance = dist(cercle1.x,cercle1.y,cercle2.x,cercle2.y);
       if ( distance < (cercle1.diametre + cercle2.diametre)/2 ) {
         supprimer_i = true;
         cerclesArrayList.remove(j);
       }
     }
     if ( supprimer_i )  cerclesArrayList.remove(i);
   }
  
  for ( int i =0 ; i < cerclesArrayList.size() ; i++ ) {
    CercleClass cercle = (CercleClass) cerclesArrayList.get(i);
    cercle.draw();
    // Remettre les couleurs aux valeurs initiales
    cercle.couleur = color(255);
  }
}

void genererCercles() {
  for ( int i =0 ; i < 20 ; i++ ) {
    CercleClass cercle = new CercleClass();
    cerclesArrayList.add(cercle);
  }
}

void mousePressed() {
  genererCercles();
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
