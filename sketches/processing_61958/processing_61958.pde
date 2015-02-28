
void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth(); 
  frameRate(5);
} 


void draw() 
{ 
  line( width/2, height/2, mouseX, mouseY );
  fill( random (255), random (255), random (255)) ;
  ellipse( mouseX, mouseY, 50, 50 );
  image ( loadImage ("sketch.png"), width/2-110, height-300);
}
