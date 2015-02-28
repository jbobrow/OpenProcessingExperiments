
size (500, 500);
smooth ();
background (255);


for (int x=1; x<500; x += 50) {
  line (x, 0, 0, 500 - x);
}

line (0,0, 500,0);
