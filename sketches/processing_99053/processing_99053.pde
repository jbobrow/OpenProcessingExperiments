
float row;
float column;

void setup()

{

  size(400, 600);
  background(255, 255, 0);
  smooth();
  
 frameRate(10);

 strokeWeight(5);
}


void draw()
{
  ellipse (random(width), random(height), random(width), random(height));
  fill( random(50), random(50), random(100));


  {
    column = random(width);
    row = random(height);
    stroke( random(255), random(255), random(255), 50 );
    line(0, row, width, row);
    stroke( random(255), random(255), random(255), 50 );
    line(column, 0, column, height);
  }
}
