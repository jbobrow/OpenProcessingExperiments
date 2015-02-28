
size(600,600);
for (int q=200; q>0; q-=20) {
  if (q<100)
  {
    stroke(0,0,0,60);
    fill(60,179,113,60);
    ellipse(450,150,q,q);
  }
  else
  {
    stroke(0,0,0,50);
    fill(255,228,196,60);
    ellipse(450,150,q,q);
  }}  
for (int q=200; q>0; q-=20) {
  if (q<100)
  {
    stroke(0);
    fill(60,179,113);
    ellipse(300,300,q,q);
  }
  else
  {
    stroke(0);
    fill(255,228,196);
    ellipse(300,300,q,q);
  }}
stroke(153,50,204);  
for (int j=10; j>0; j-=6) {
  for (int i=0; i<600; i+=6) {
    line(i,0,600,j+590);
  }}
fill(60,179,113, 210);
triangle(0,0,600,600,0,600);
for (int q=200; q>0; q-=20) {
  if (q<100)
  {
    fill(60,179,113,100);
    ellipse(150,450,q,q);
  }
  else
  {
    fill(255,228,196);
    ellipse(150,450,q,q);
  }}
