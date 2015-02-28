

void setup()
{

  size (500,500);

  noFill();

  smooth();

  strokeWeight (5);
}


void draw()
{
  
  background(255);
  
  stroke(0,0,255);  
  
  ellipse (100,100,50,50);

  stroke(0,0,0);

  ellipse (155,100,50,50);

  stroke(255,0,0);

  ellipse(mouseX,mouseY,50,50);

  stroke(255,255,0);

  ellipse (125,120,50,50);

  stroke(0,255,0);

  ellipse (185,120,50,50);
 }






