
size (400, 400);
smooth(55);
int cont = 0;
for (int i = 1; i<width; i+=5) {
  for (int j= 1; j<height; j+=40) {
   
   println(cont);
   fill(0);
   stroke(i,j,150,cont);
   line(i,j,60,22);
   
    cont++;
  }
} 



