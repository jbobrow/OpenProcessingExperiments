
void setup()
{
  size(400, 600);
  smooth();
  frameRate( 7 );
}



void draw()
{
  textSize (20);
  text ( "♥", random(mouseX), random(mouseY) );
  text ( "☺", random(mouseY), random(mouseX) );
  text ( "☼", random(mouseY), random(mouseX) );
  text ( "☻", random(mouseY), random(mouseX) );
  line( pmouseX, pmouseY, mouseX, mouseY );
  fill( random(255), random(255), random(255), 125);
  ellipse( mouseX, mouseY, random(10, 40 ), random(10, 40) );
}
void mousePressed()
{
  fill( random(255), random(255), random(255) );
  background( (255), random(255), random(255) );
}

void keyPressed()
{
  fill( random(255), random(255), random(255) );
  background( random(255), (58), (23) );
}


