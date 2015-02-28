
//Homework 3
//copyright 2012 Alex Fischer ajfische
float mx, my;

void setup( )
{
  size( 400, 400);
  frameRate(30);
}
 
void draw( )
{
  fill( 0, 75 );
  rect( 0, 0, width, height );
  
  
  
  fill( random(0), random(255),random(255));
  mx = mouseX;
  my = mouseY;
  
  ellipse( mouseX, mouseY, 50, 50 );
  line(mx,my, pmouseX, pmouseY);
  fill( 255 );
  //fill( random(255), random(255), random(0) );
  ellipse( mouseX + random(50), mouseY + random(50), random(10), random(10) );
  //fill( random(255), random(0), random(255) );
  ellipse( mouseX - random(50), mouseY - random(50), random(10), random(10) );
}

void mousePressed( )
{
  background( 255 );
  ellipse( mouseX + random(50), mouseY + random(50), random(10), random(10) );
  ellipse( mouseX + random(100), mouseY + random(100), random(10), random(10) );
}

