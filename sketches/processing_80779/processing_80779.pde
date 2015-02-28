
void setup()
{
  size(500,500);
  background(#91A9F0);
  smooth();
}
void draw()
{
noFill();
//premiere boucle hauteur
for (int a = 50; a < 450;a = a+8)
{
  ellipse (a,250,500,500);
}
for (int b = 50; b < 450; b =b+8)
{
ellipse(250,b,500,500);
}
noLoop();
}


