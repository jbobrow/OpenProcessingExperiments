

void setup ()
{
  size (  400, 600  )  ;

  background ( 198, 42, 60 ) ;
  smooth ();
}
void draw ()
{
  fill ( 198, 42, 60, 50 );
  rect(0,0,width,height);

  strokeWeight ( 0 ) ;
  image(loadImage("kid jumping.png"), width-frameCount/2, 0+frameCount ) ;
  for (int i=0;i<40;i++)
  {
    fill ( random(255), random(255), random(255), 200 )  ;
    ellipse ( random(400), random(300, 600), 50, 50 ) ;
  }

  textSize(36) ;
  text("JUMP IN!!!:)", 150, 100);
}



