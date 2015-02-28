
/* in this example, ellipses are placed/positioned using the
width and height system variables.

Developed by: Laura Maye, University of Limerick
*/

void setup()
{
  size(300, 200);
  background(255);
  smooth();
}

void draw()
{
  fill(150, 80, 140);
  ellipse(width/3, height/2, 20, 20); //ellipse x = 300 / 3, ellipse y = 200/2
  ellipse(width/2, height/2, 20, 20);
  ellipse(width/3*2, height/2, 20, 20); //ellipse x = 300 / 3 * 2
  fill(0, 50);
  noStroke();
  rect(0, height/2, 400, 20);
}
