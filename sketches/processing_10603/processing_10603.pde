
   void setup () {
        
        size( 400, 400 );
        background(255);
        frameRate(1);
    }

  
   int rt = 0;

    void draw () {
      
      translate (width/2, height/2);
      
      for ( int rt = 0 ; rt < 360; rt = rt + 15 ) {
        
          pushMatrix();
      
          rotate(radians(rt));
          line(width,40,-width,40);   // (0,40,-width,40) = ohne überkreuzung
          
          popMatrix();  
       }
 
    }

