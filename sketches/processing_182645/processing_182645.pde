
size(400,400);
background(250);
for (int i=600; i>=0; i=i-15)
{
  for (int r=100; r<400; r=r+15) {
    float x=random(255);
    float y=random(255);
    float z=random(255);
    noFill();
    stroke(0);
pushMatrix();
fill(x,y,z,10);
ellipse(r,r,i,i);
ellipse(i,i,i,i);
popMatrix();
noStroke();

  }
}
