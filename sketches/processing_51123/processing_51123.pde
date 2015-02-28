
size(500, 500);
smooth();

noFill();

int d = 5;
for (int j=0;j<width;j+=45) {
  for (int k=0;k<height;k+=30) {
    for ( int i=0;i<width*0.1;i+=d) {
      if (j%2==0)
      {
        strokeWeight(i*0.05);
      }
      else
      {
        strokeWeight(i*0.08);
      }
      ellipse(j, k, i, i);
    }
  }
}

for (int n=16;n<height;n+=30) {
  for (int m=22;m<width;m+=45) {
    point(m, n);
  }
}


