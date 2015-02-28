
void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth(); 
  frameRate(60);
} 
void draw() 
{ 
  line( 0, 0, mouseX, mouseY );
  fill( 255, 0, 0 );
  ellipse( mouseX, mouseY, 50, 50 );
}
