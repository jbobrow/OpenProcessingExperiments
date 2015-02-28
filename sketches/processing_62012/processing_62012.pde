
void setup()
{
  size(400, 600);
  background(0,0,0);
  smooth(); 
  frameRate(60);
}

void draw()
{
  
  if (key == 'r'   )
{
   fill( random (255), random (0), random(0)); 
}
   
    if (key == 'g'   )
{
   fill( random (0), random (255), random (0) ); 
}
     
     if (key == 'b'   )
{
   fill( random (0), random (0), random (255) ); 
}
    
    if (key == 'x'   )
{
   fill( random(255), random(255), random(255) ); 
}
    
    if ( key == ' '   )
{
  background (0, 0, 0); 
}
    
    if ( mouseButton == RIGHT   )
{
  background (0, 0, 0); 
}
  ellipse( mouseX, mouseY, 50, 50 );
  save ("sketch.png");
  fill (random (255), random (255), random (255));
  ellipse (random( 400), random (600), 15, 15);
  textSize (36);
  fill (250, 238, 8);
  textSize (30);
  textAlign (CENTER);
  text ("SUMMER'S ALMOST HERE ☼", 200, 300);
   
}



