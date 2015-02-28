
//Brennda
size(200, 200);
background(#B2BFFC);
for (int x=10; x<200; x=x+30)
{
  for (int y=10; y<200; y=y+30) {
    stroke(255, 0, 0);
    strokeWeight(4);
    point(x, y);
  }
}
for (int i=10; i<200; i=i+30) {
  for (int j=17; j<200; j=j+30) {
    line(i, j, i, j+15);
    line(i+6,j-6,i+25,j-6);
      stroke(255);
  }
}
