
size(500, 500);
smooth();

strokeWeight(1);
stroke(10,100);

for (int i=10; i<=width; i+=10)
{
  for (int j=10; j<=height; j+=10)
  {
    
    ellipse(i,j,10,10);
    line(i, j, i+16, j+16);
    line(i+16, j+(i/2), i, j+16);
  }
}

noFill();
for(int i =10; i<500; i=i+10)
{
  ellipse((width/2)+(i/3), height/2, i,i );
}

