
void setup()
{
  size(250,250);
}

void draw()
{
  noFill();
  background(125);
  translate(width/2,height/2);

  float sc = map(mouseX,0,width,1.0,0.01);
  float ro = map(mouseY,0,height,0,HALF_PI);
  
  for(int n =1; n<50 ;n++)
  {
    stroke(n*5);
    scale(sc);
    rotate(ro);
    rect(-width/2,-height/2,width, height);
  }
}



