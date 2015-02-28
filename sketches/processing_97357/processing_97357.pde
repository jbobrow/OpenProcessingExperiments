
void setup()
{
  size (2000,2000);
  smooth();
  noStroke();
  frameRate(900000000000);
}
void draw()
{
  int r = int(random(30,300)); //randomly generated variable named 'r' for size of circle
  fill (random (255), random (255), random(255)); //sets colour for circles r, g, b. any random colour within red, green and blue. The constraint is 255.
  noStroke(); //removing the line from around the circle
  ellipse(random(2000),random(2000),r,r); //(random(500) sets constraints so it appears within the canvas size and r is the randomly generated variable
}
