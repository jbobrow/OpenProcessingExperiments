
size(400,320);
background(191,230,255);
stroke(0,0,255,200);
fill(220,20,60,100);
for(int i = 8; i <= 300; i += 100) {
  for(int j = 12; j <= 300; j += 5) {
    //line(10,i, j+30,200); 
    triangle(i,j,150,140,i+12,j+5);
   }
}

stroke(255);
for(int i = 8; i <= 300; i += 100) {
  for(int j = 12; j <= 300; j += 5) {
    line(10,i, j+30,200); 
    //triangle(i,j,150,140,i+12,j+5);
   }
}


