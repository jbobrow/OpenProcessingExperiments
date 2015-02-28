
void setup()
{
  size (2000,2000);
  smooth();
  noStroke();
}
void draw()
{
  int r = int(random(1,300,70)); //randomly generated variable named 'r' for size of rect
  fill (random (255), random (255), random(255));
  noStroke(); //removing the line from around the squares
  triangle(random(2000),random(2000),random(2000),r,r,r); //(random(500) sets constraints so it appears within the canvas size and r is the randomly generated variable
}
