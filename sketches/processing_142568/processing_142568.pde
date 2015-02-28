

size (450, 450);
rectMode(CENTER);

float  angolo=0;

for (int y=0; y<=height; y+=30)
{
  for (int x=0; x<=width; x+=30)
  {
    angolo += 0.006;
    resetMatrix();
    translate(x, y);
    rotate(angolo);
    
    fill(0,0,random(150));
    rect(0,0, 30,45);
  }
}
