

void setup()
{
  size( 400, 600 );
  background(255, 255, 255);
  smooth();
  textAlign(CENTER);
  frameRate(15); 
  textSize( 36);
}

void draw()
{
  fill( 255, 255, 255,  25 );
  rect( 0, 0,  width, height );
  
  textSize( mouseY/10  );
  fill( random(255), random(255), random(255) );
  text( "Merry Christmas!", mouseX, mouseY  );

}



