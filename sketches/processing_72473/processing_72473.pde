
//Eric T Computer Programming Mods 4-5
void setup()
{
  size(400,400);
}
void draw()
{
  face();
  eyes();
  mouth();
}
void face()
{
  fill(252,236,43);
  stroke(0);
  strokeWeight(5);
  smooth();
  ellipse(200,200,300,300);
}
int x = 150;
int x2 = 250;
int rand = int(random(20));
int rand2 = int(random(20));
void eyes()
{
  fill(0);
  ellipse(rand2,rand,40,90);
  ellipse(rand,rand,40,90);
  if(keyPressed == true && key == 'e')
  {
  rand = x + int(random(20));
  rand2 = x2 + int(random(20));
  }
}
void mouth()
{
  noFill();
  bezier(130,250,200,300,200,300,280,250);
}
