
size(500,500);
background(0);
noStroke();
smooth();

for(int i = 1; i<=9; i++){
  
for(int j = 1; j<=9; j++){
fill(0, 255, 255, 255-(j*25));
ellipse(50*i, 50*j, 4*i, 4*i);}}
