
void setup ()
{
  size ( 400, 600);
  background (255, 255, 765) ;
  smooth ();
  frameRate (30);  
} 

void draw() 

{
  //background (2345);
  fill (255, 255, 255) ;
  rect(0, 0, width, height );
  fill (random(255) ,random (255), random(255), 70); 
  strokeWeight (3); 
  stroke( mouseX, mouseY,46734);
   fill ( random(255), random (255), random(255) );  
  
  textSize (48);
  
  textSize( mouseY/2);
  
   textAlign (CENTER);  
 
  text( "♥", random(400), random(600) ); 
  
  textSize (27);

fill( 255, 0, 0);   
 
  text( "♥ All You Need Is Love ♥", width/2, height/2);   
  
 
  
}
