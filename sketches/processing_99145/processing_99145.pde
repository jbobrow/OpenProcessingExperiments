
void setup()
{
  size(400, 600);
  background(0, 255, 255);
  smooth();
  frameRate(120);
}




void draw()
{ 


  strokeWeight(3);
  fill( random(20), random(5), random(257) );
 
  fill( random(300), random(5), random(25), 69 );
  ellipse( random(width), random(height), 50, 50);
}
 void mousePressed ()
 {background (random(255), random(255),random(255));
 }
