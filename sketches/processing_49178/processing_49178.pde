
void setup()
{
  size( 400, 600 );
  background( 0, 0,0 );
  smooth();
  frameRate(10);
}

void draw()
{
  strokeWeight(5);  

  fill( random(255), random(255), random(255), 75 );

  rect( random(400), random(600), 50, 50 );
  ellipse( random(400), random(600), 50, 50);
}


