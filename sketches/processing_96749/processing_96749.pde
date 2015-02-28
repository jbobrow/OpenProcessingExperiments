
void setup()
{
  size(700,700);
  ellipseMode(CORNER);
}

void draw()
{
  background(0, 0, 150);
  noFill();
  translate(width/2,height/2);
  
  float sc =map(mouseX, 2,width, 1.0,0.01);
  float ro =map(mouseY, 2,height,1, HALF_PI);
  
  for(int n=1 ; n<50 ; n++)
  {
    stroke(n*10);
    scale(sc);
    rotate(ro);
    ellipse(-width/2, -height/2,width,height);
  }
}



