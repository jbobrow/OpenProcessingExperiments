
size (500, 500);
smooth ();
colorMode (HSB, 500);
background (500);


for (int x=1; x<500; x += 50) {
  stroke (x, 500, 500-x);
  line (x, 0, 0, 500 - x);
}  

line (0,0, 500,0);                                                      
