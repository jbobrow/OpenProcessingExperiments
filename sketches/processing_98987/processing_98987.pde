
void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth(); 
  frameRate(60);
} 
void draw() 
{ 
  line( 200, 0, mouseX, mouseY );
  fill( 0, 58, 186 );
  ellipse( mouseX, mouseY, 25, 25 );
  if(mousePressed == true)
  {
      background(255, 255, 255);
  }
}
