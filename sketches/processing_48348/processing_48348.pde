
/** 
Jeff Nyhoff <p>
Merry Christmas Sketch
*/ 

void setup()
{
  size( 400, 600);
  background( 255, 255, 255);
  smooth();
  textAlign( CENTER ); 
  textSize(36);
  textFont( loadFont("font2.vlw"), 36 ); 
  frameRate(10);
}

void draw()
{
  //fill( 255, 255, 255, 100 );
  //rect( 0, 0, width, height );
  
  fill( random(255), random(255), random(255) );
  textSize( random(8, 36) ); 
  text( "Merry Christmas!", random(width), random(height) ); 
  

}

