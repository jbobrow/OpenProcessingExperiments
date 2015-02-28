
size(500,500);
smooth();
background(0);

stroke(#FF0095, 50);
for (int i = 0; i <=width; i=i+50) {
  for (int j = 0; j <=height; j=j+50) {
   line(i,0,j,height);
   line(0,i,height,j);
  }
}


