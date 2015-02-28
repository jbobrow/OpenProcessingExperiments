
 
 int celluleAleatoire;
 
 int colonnes = 10;
 int rangees = 10;
 
 float largeurColonne;
 float hauteurRangee;
  
  void setup() {
    size(400,400);
    smooth();
    
    largeurColonne = width/colonnes;
    hauteurRangee = height/rangees;
  
    textAlign(CENTER,CENTER);
    
    celluleAleatoire = int(random(0,100));
  }
  
  
  void draw() {
  
     background(220);
     noStroke();
  
 
  
  
  for ( int i =0; i < colonnes;  i++ ) {
   for ( int j = 0; j < rangees; j++ ) {
      int cellule = i + j*colonnes;
      
       if ( cellule == celluleAleatoire  ) {
        fill(255,0,0);
        } else {
        fill(0,i/colonnes*255,j/rangees*255);
        }
        
        rect( i*largeurColonne , j*hauteurRangee , largeurColonne , hauteurRangee );
        fill(255);
        text("c: "+cellule, i*largeurColonne + largeurColonne*0.5, j*hauteurRangee + hauteurRangee*0.5);
   
    }
  }
  
 
  
  }
  
  void mousePressed() {
    
    celluleAleatoire = int(random(0,100));
  
  
  }
  
  

 
  
  
  
  
  
