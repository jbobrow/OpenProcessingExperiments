
float r, g, b, r2, g2, b2, r3, g3, b3;
 
void setup ()
{
  size(400,400);
  background(255,0,0);
}
 
void draw()
{
 if((mouseX < 240 && mouseY < 240) || (mouseX > 260 && mouseY > 260))
 {
  r = random(100,255);
  g = random(100,255);
  b = random(100,255);
  r2 = random(100,255);
  g2 = random(100,255);
  b2 = random(100,255);
  r3 = random(100,255);
  g3 = random(100,255);
  b3 = random(100,255);
  rect(50,50,300,300);
  fill(r, g, b);
  ellipse(200,200,250,250);
  fill(r2, g2, b2);
  triangle(200,125,125,250,275,250);
  fill(r3, g3, b3);
 }
 else
 {
  background (r, g, b); 
 }
}
