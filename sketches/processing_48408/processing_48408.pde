
void setup ()
{
size (400,600) ;
background (255,255,255);
smooth() ;
textAlign (CENTER) ;
frameRate (6) ;
}

void draw ()
{
  //fill (255, 255, 255) ;
  //rect (0,0, width, height) ;

  stroke (20) ;
  point (random(400), random (600)) ;
  
  textSize ( random (100));
  fill ( random (255),0,0, 150) ;
  text ("Maligayang Pasko", mouseX , mouseY);
}
void keyPressed()
{ 
  if (key=='s')
  fill(255,255,255);
}

