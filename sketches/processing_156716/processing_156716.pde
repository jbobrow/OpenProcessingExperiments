
void setup() {
  size(510, 510);
}

void draw() {
  background(255);
  stroke(0);
  for (int i=1; i<=height; i+=10)
  {
    for (int j=1; j<=width; j+=10)
    {
      line(i, j, i+2, j);
    }
  }
  for(int i=mouseX-40; i<=mouseX+40; i++)
    {
      for(int j=mouseY-40; j<=mouseY+40; j++)
      {
        ellipse(width/2, height/2, mouseX*sin(radians(i)), mouseY*cos(radians(j)));
      }
    
    }
}


