
float rotator = 0;
void setup()
{
  size(500,500);
}
void draw()
{
  background(0);
  fill(255);
  noStroke();
  smooth();
  rotator += .12;
 for(int i=50; i<480; i += (500/12))
{
  for (int j=50; j<480; j += (500/12))
  {
    //triangle((i*10)+5,(j*10),(i*10)+10,(j*10)+10,(i*10),(j*10)+10);
    arc(i,j,27,27,-PI+(i+j)/100+rotator,0+(i+j)/100+rotator);
  }
} 
}

