
size (200, 200);
for (int x=0; x<200; x+=10) {
 float n =norm (x, 0, 200);
 float y =1 - pow (n, 4);
 y*=200;
 stroke (y+=20);
 line (0, 0, x, y);
}
 



