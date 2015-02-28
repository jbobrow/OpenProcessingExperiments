
size(500, 500);
smooth();
noStroke();

fill(255);
for(int k=0;k<width;k+=80){
  for(int l=0;l<height;l+=100){
      rect(k, l, 14, 10);
  }
}

for (int j=0;j<height;j+=15) {
  for (int i=0;i<width;i+=15) {
    translate(i, j);
    rotate(PI/3.0);
    if (i%2==0)
    {
      fill(240);
      rect(10, 10, 8, 6);
    }
    else
    {
      fill(255);
    }
  }
}



