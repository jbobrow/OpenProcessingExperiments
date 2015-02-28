
/**
 
 Beads - Jeff Nyhoff <br/>
 
 Move mouse to draw "glass beads."
 
 */



void setup()
{
  size( 400, 600 );
  background( 255, 255, 255);
  smooth();
  frameRate(10);
}

void draw()
{
  strokeWeight(3);
  fill( random(255), random(255), random(255), 50 );
  line( pmouseX, pmouseY, mouseX, mouseY );
  ellipse( mouseX, mouseY, 30, 30 );
  ellipse( mouseX, mouseY, 20, 20 );
  ellipse( mouseX, mouseY, 10, 10 );
  rect(mouseX, mouseY, 30, 30);
  rect(mouseX, mouseY, 20, 20);
  rect(mouseX, mouseY, 10, 10);
}
