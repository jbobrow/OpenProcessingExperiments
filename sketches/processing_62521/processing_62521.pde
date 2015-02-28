


void setup ()
{
  size(500,300 );
  background( (255), random(255), random(255));
  smooth();
  frameRate(30);

}


void  draw  ()
{
  ellipse (mouseX, mouseY, 15, 12);
  strokeWeight(3);
  point (100, 100, 500);
  point(random(255), random(255));
  
}



