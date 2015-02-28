
/**
*    diese function malt eine spirale
*
*    fjenett 20090417
*/

boolean savePicture = true;
    void setup ()
    {
        size( 600, 500 );   
        frameRate(10);
        noStroke();
        fill(0);
        smooth();
    }
    

    void draw ()
    {
        background( 255 );
        hor(  );
       
        noLoop();
        if ( savePicture ) saveFrame( "####.jpg" ); 
    }
    
    void hor (  )
    {
      
      for (int i=8; i<width; i=i+60)
       { 
         rect(8,i,width+13-i, 20);
       } 
       
      for (int i=8; i<width; i=i+60)
       { 
         rect(i,8, 20, height+4-i*0.66);
       } 
    }     




