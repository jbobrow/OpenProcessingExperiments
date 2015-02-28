
void setup()
{
  size (2000,2000);
  smooth();
  noStroke();
  frameRate(90000000000000);
}
void draw()
{
  int r = int(random(30,300)); //randomly generated variable named 'r' for size of rect
  fill (random (255), random (255), random(255));
  noStroke(); //removing the line from around the squares
  rect(random(2000),random(2000),r,r); //(random(500) sets constraints so it appears within the canvas size and r is the randomly generated variable
}
