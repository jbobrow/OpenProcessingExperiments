
void setup()
{
  size(600, 600);
}

void draw()
{
}

void radix()
{
  fill( random( 125), random(125), random(125) + 125);
  ellipse( 150, 300, 300, 300);
  ellipse( 450, 300, 300, 300);
}

void Rand()
{
  fill( random(125), random(125) + 125, random(125));
  rect( 0, 0, 600, 150);
  rect( 0, 0, 150, 600);
  
  rect( 450, 0, 150, 600);
  rect(0, 450, 600, 150);
}

void Ecken()
{
  fill( random(125)+125, random(125), random(125));
  triangle( 150, 150, 300, 0, 450, 150);
  triangle( 150, 150, 0, 300, 150, 450);
  triangle( 150, 450, 300, 600, 450, 450);
  triangle( 450, 150, 600, 300, 450, 450);
}

void keyPressed()
{
  radix();
  Rand();
  Ecken();
}
