
size (400, 400);
background (0,150,50);
fill (100, 200, 0);

for (int i = 1; i <= 400 ; i = i +50) {
 for (int j = 1 ; j <= 400; j = j +50) {
   
triangle ( i, j, i+10, j+40, i+50, j+30);
}
}
