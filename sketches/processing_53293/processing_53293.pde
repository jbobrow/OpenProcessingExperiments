
size (700, 700);
background(0);
smooth();
strokeWeight(.5);

translate(-30, -30);
for (int i=0; i<=width-30; i+=30)
{
  for (int j=0; j<=height-30; j+=30)
  {
    stroke(0);
    strokeWeight(1);
    line(730, 730, i, j);
    fill(255, 5);
    stroke(230, i*.2, j*.2, 150);
    ellipse(i, j, i, j);
  }
}


