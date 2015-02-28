
void setup ()
{
  size (400, 600);
  background (0, 0, 0);
  smooth () ;
}



void draw ()
{
  background (0, 0, 0);
  image (loadImage("rocket.png"), width/2-52, height-100-frameCount+10);
  fill(random (255), random (54), random (43));
  triangle(width/2, height+50-frameCount, width/2+10, height-frameCount, width/2-10, height-frameCount);

  fill ( 50, 100, random (238));
  textSize ( 25);
  textSize ( 30 );
  textAlign ( CENTER ) ;
  text ( "Road Trip!", width/2, height-500); 

  textSize (20);
  text ( "You gotta go, go, go in your hoveround!", width/2, height-200);

  fill (random (255), random (255), random (255) );
  text (".............", width/2, height/2);
  
  
}






