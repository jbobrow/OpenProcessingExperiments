
 
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
  

  
  for ( int i =0; i < colonnes;  i++ ) {
   for ( int j = 0; j < rangees; j++ ) {
   
    
        fill(0,i/colonnes*255,j/rangees*255);
        
        
        rect( i*largeurColonne , j*hauteurRangee , largeurColonne , hauteurRangee );
   
    }
  }
  

  
  
  
  }
  
  

 
  
  
  
  
  
