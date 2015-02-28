
   void setup () {
        smooth();
        size( 500, 500 );
        background(255);
        frameRate(15);
        noStroke();
   }

   float w = 490;
   float up = 0;
   boolean flip = true;


    void draw () {
      
      translate (width/2, height/2);
          
         while (w > 0 ) {
            if (flip) fill(0);
            else fill (255);
            
            ellipse (0,up,w,w);

            w -= 10;
            up -= 3.9;
            flip = !flip;
         }
          

    }

