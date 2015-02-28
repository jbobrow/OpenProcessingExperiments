
size(500,500);
background(224);
smooth();
 
strokeWeight(1);
 

for (int i=-1; i<=width; i+=150)
{
  for (int j=30; j<=height; j+=180)
  {
    fill(33,129,123,60);
    stroke(37,19,118,80);
    rect(i, j, i/2, j+50, i+10, j/2, 1, 1);
  }
}

for (int i=-1; i<=width; i+=150)
{
  for (int j=30; j<=height; j+=180)
  {
    fill(247,250,124,50);
    stroke(37,19,118,80);
    rect(-j, i, i*2, j+50, i+10, j/2, j*3, j*3);
  }
}

