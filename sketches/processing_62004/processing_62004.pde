

void setup()
{
  size( 400, 600 );
  background( 255, 255, 255);
  smooth();
  frameRate(10);

  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
  
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

void draw()
{
  strokeWeight(3);
  fill( random(255), random(255), random(255), 50 );
  line( pmouseX, pmouseY, mouseX, mouseY );
  ellipse( mouseX, mouseY, 30, 30 );

  fill(255, 255, 255, 30); 
  rect( 0, 0, width, height );

  fill(255, 0, 0);
  ellipse( mouseX, mouseY, 30, 30 );
  
  fill( random(255), random(255), random(255) );
  ellipse( mouseX, mouseY, 50, 50 );
}















