
 
 int colonnes = 10;
 int rangees = 10;
 
 float largeurColonne;
 float hauteurRangee;
  
  void setup() {
    size(400,400);
    smooth();
    
    largeurColonne = width/colonnes;
    hauteurRangee = height/rangees;
  
  }
  
  
  void draw() {
  
     background(220);
     noStroke();
  
 
  int iSouris = int(mouseX / largeurColonne);
  int jSouris = int(mouseY / hauteurRangee);
  
  
  
  
  for ( int i =0; i < colonnes;  i++ ) {
   for ( int j = 0; j < rangees; j++ ) {
   
       if ( i == iSouris && j == jSouris ) {
        fill(255,0,0);
        } else {
        fill(0,i/colonnes*255,j/rangees*255);
        }
        
        rect( i*largeurColonne , j*hauteurRangee , largeurColonne , hauteurRangee );
   
    }
  }
  
  fill(255);
  rect(mouseX,mouseY-10,50,15);
  fill(0);
  text("i: " + iSouris + " " + "j: " + jSouris, mouseX+5, mouseY);
  
  
  
  }
  
  

 
  
  
  
  
  
