
boolean flip = false;    

void setup ()
{   size( 500, 500 );
    smooth();  
    background(255);
    noStroke();       }

void draw ()
{ pushMatrix();
      for ( float a = 0; a <= height; a=a+16 )  
     {
      ellipse(width/2, height/2, width-a, height-a);
      translate(0,-8);
      fill( 255 );
        if(flip)
          fill(0);
          flip = !flip;
     } 
 popMatrix();   pushMatrix(); 
      for ( float a = 0; a < height/2; a=a+16 )  
     {
      ellipse(width/2, height/3.2, (width/1.6-a), (height/1.6-a));
      translate(0,+8);
      fill( 255 );
       if(flip)
         fill(0);
         flip = !flip; 
     }
 popMatrix();     
      for ( float a = 0; a < height/4; a=a+16 )  
     {
      ellipse(width/2, height/2, (width/4-a), (height/4-a));
      translate(0,-8);
      fill( 255 );
       if(flip)
         fill(0);
         flip = !flip; 
     }
noLoop();    }




