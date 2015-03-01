
void setup()
{
  size(600, 600);
  noStroke();
}
 
void draw()
{
  background(250,238,3);
  translate(width/2, height/2);
  for(int x = -150; x<= 150; x+=8)
  {
    for(int y = -150; y<= 150; y+=10)
    {
      float j = dist(x, y, 0, 0);
      float j2 = tan(radians(j))*j;
      fill(3,244,250);
      pushMatrix();
      translate(x, y);
      rotate(radians(j + frameCount*0.8));
      bezier(x, y,  6, 5,  9, 7,  3, 7);
      popMatrix();
    }
  }
}
