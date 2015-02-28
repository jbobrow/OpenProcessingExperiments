
size(400,400);
background(0);

for (int i=0; i<=height; i=i+20)
{
  for (int j=0; j<=height; j=j+5)
   {
    float r=random(400);
    strokeWeight(10);
    stroke(255);
    line(r,i,r,i);
   }
}
