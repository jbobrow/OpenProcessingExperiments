

void setup()
 { 
  size(400, 600);
   background( random (255), random (255), random (255) ) ;
   smooth();
   frameRate(60);
 } 


void draw()

{ 
  fill( random(255), random(255), random(255) );
   ellipse( mouseX, mouseY, 50, 50 );
 }
 

