
void setup()
{
  size(600,700) ;
  background(255, 255, 255);
  smooth();
}
void draw ()
{
  fill(random(255),random(255),random(255)) ;
   textSize(80) ;
   textAlign (CENTER) ;
   text ("Go Patriots",300,300) ;
   image(loadImage("England_Patriots.png"),mouseX,mouseY) ;
   
}


