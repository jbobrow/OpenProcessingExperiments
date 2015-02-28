
void setup()
{
size(250,250);
}

void draw()
{
  background(170);
  noFill();
  translate(width/2,height/2);

  float sc = map(mouseX, 0,width, 1.0,0.01);
  float ro = map(mouseY, 0,height, 0, HALF_PI);

  for(int n=1 ; n<255 ; n++)
{
  stroke(n);
  scale(sc);
  rotate(ro);
  rect(-width/2,-height/2,width,height);
 }
}  


