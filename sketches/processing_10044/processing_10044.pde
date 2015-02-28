
boolean flip = false;    

void setup ()
{   size( 500, 500 );
    smooth();  
    background(255);
    noStroke();       }

void draw ()
{ 
      for ( float a = 0; a <= height; a=a+10 )  
     {
      ellipse(width/2, height/2-a/2.5, width-a, height-a);
     // translate(0,-8);
      fill( 0 );
        if(flip)
          fill(255);
          flip = !flip;
     } 
  
noLoop();    }




