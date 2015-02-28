
//abby frankola
//afrankol
//copyright 2013 abby frankola

//variable


float summer;
void setup(  )
{
   size( 400, 400 );
   smooth( );
   background( 242, 246, 223);
    
   summer = 150;
}
 
void draw( )
{
   drawIcecream( 150, 200 );
   
}
 
void drawIcecream( float x, float y )  // defining the icecream cone
{
  noStroke ( );
  
  beginShape ( );//icecreamscoop
  fill (random(255), random(255), random(255), 50);
  ellipse ((mouseX+25), (mouseY), (50), (50) );
  
endShape   ( );

    fill( 191, 157, 113 );
     
    frameRate (3.5);
    triangle(mouseX, mouseY, (mouseX+50), (mouseY), (mouseX+25), (mouseY+90)); //cone
   
   

 

     
    if (mousePressed == true)
    {
    background( 255, 247, 128);
    fill (random(255), random(255), random(255), 50);
    ellipse ((mouseX+25), (mouseY), (50), (50) );
    fill( 191, 157, 113 );
    triangle(mouseX, mouseY, (mouseX+50), (mouseY), (mouseX+25), (mouseY+90));
    fill ( random(255), random(255), random(255), 50);
    ellipse( (mouseX+25), (mouseY-20), (50), (50) );
    }
    
}
void mouseReleased ()
{
  
    background( 242, 246, 223);
    fill (random(255), random(255), random(255), 50);
    ellipse ((mouseX+25), (mouseY), (50), (50) );
    fill( 191, 157, 113 );
    triangle(mouseX, mouseY, (mouseX+50), (mouseY), (mouseX+25), (mouseY+90));
    fill ( random(255), random(255), random(255), 50);
    ellipse( (mouseX+25), (mouseY-20), (50), (50) );
   
    
    
}




 


