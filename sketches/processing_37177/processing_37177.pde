
size (500, 500);
smooth();
background(255);
int x = 1;
int y = 1;

for (int i =0; i<450; i+=50) {
  for (int j = 0; j<450; j+=50) {
    line (i-j, 0, 0, j);
  }
}
           
                
