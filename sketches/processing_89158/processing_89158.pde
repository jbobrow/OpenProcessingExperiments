
int x = 0, speedX = 1;

void setup()
{
  size(400,400);
  background(255);

}
void draw()
{
if((mouseX < 190 || mouseX > 210) || (mouseY < 190 || mouseY > 210))
{
  ellipseMode(CENTER);
  fill(250, 205, 149);
  ellipse(x, 200, 200, 200);
  fill(0, 23, 255);
  ellipse(x, 150, 40, 40);
  ellipse(x, 150, 40, 40);
  fill(255, 9, 0);
  ellipse(x, 200, 50, 40);
  x = x + speedX;
 if(x > width || x < 0)
{
speedX = speedX * -1;
} 
}
else
background(255);
}
