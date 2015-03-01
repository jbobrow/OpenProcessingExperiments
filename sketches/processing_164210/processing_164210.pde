
void setup()
{
  size(300,500);
}

void draw()
{
}

void keyPressed()
{
  fill(random(125));
  rect(0,0, 140,500);
  fill(125+random(125));
  ellipse(70,250,130,130);
  fill(random(125)+125);
  rect(140,0,160,500);
  fill(random(125));
  triangle(150,490, 220,10, 290, 490);

}
