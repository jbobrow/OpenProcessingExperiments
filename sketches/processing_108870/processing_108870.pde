
//abby frankola
//afrankol
//copyright september 2013

float x, y, w, h; 

void setup( )
{
  size(400, 400);
  background (7, 27, 87);
  noStroke();
  x = 0;
  y = height * .25;
  w = width * .25;
  h = height * .25;
  frameRate(22);
  
  
}  


void draw( )

{
  background(7, 27, 87);

  fill(7, 27, 87, 40);
  rect(0, 0, width, height);
  smooth();
  fill(238, 255, 130 );
  ellipse( pmouseX, pmouseY, mouseX-mouseY, mouseX-mouseY );
  x = x-3; 
  fill(248, 252, 131);
  ellipse( pmouseY-(mouseX*.5)-50, pmouseX-(mouseX*.5)-50, mouseY-mouseX, mouseY-mouseX);
  h = x-1; 
  fill(248, 252, 131);
  ellipse( pmouseY-(mouseX-mouseY)+100, pmouseX-(mouseX-mouseY*.95)-100, mouseY-mouseX, mouseY-mouseX );
  h = x+1; 
  

}



