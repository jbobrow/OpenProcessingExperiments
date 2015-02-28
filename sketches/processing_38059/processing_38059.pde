
void setup()
{
 size(500,500);
 background(0);
 fill(255);
 stroke(255,0,0); 
}

void draw()
{
smooth();
 for(int i=100; i<width; i += 100)
{
  for (int j=100; j<height; j += 100)
  {
   // triangle((i*10)+5,(j*10),(i*10)+10,(j*10)+10,(i*10),(j*10)+10);
    strokeWeight(3);
    ellipse(i,j,80,80);
    strokeWeight(4);
    ellipse(i,j,(125/2)+3,(125/2)+3);
    ellipse(i,j,45+3,45+3);
    ellipse(i,j,(55/2)+3,(55/2)+3);
    ellipse(i,j,10+3,10+3);
  }
} 
}

