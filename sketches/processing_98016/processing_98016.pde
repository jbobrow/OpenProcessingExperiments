
void setup()
{
  size(750,750);
}

void draw()
{
  noFill();
  translate(width/5,height/5);
  
  float sc = map(mouseX, 0,width, 1.0,0.01);
  float ro = map(mouseY, 0,height, 10, HALF_PI);
  
  for(int n=1 ; n<100 ; n++)
  {
    stroke(n*100);
    scale(sc);
    rotate(ro);
    rect(-width/2,-height/2,width,height);
  }
}


