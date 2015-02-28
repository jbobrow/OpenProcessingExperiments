
//Renata Munhoz
size(200, 200);
background(0, 0, 255);
int x=90;

stroke(255, 255, 0);
strokeWeight(5);

for (int i = 0; i<9; i++)
  line (0, 0, x - x/(i+1), 200 -i*25);
for (int r=0; r<9; r=r+1)
  for (int j=10; j<11; j=j+3)
    line (200, 0, j*j/(r+1)+97, 200 - r*25);
