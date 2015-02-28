


void setup () {
      
     size( 297, 420 );
     background(255);
 }

int a = 10;
 
 void draw () {
    
   translate (width/2, height/2);
    
   for ( int a = 10 ; a < 360; a = a + 15 ) {
      
       pushMatrix();
    
       rotate(radians(a));
       line(width,30,-width,30);   
        
       popMatrix(); 
    }
 
 }
 
 
 
 
 
          
