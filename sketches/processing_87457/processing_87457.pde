
// pattern : quad 02

size (500, 500);
smooth ();
background (255);
stroke (0, 50);

for (int i= 20; i<=width; i+= 20) {
  for (int j=10; j<=height; j+=20)

    quad (i+j, j/2, i+50, j/2, i*2, j+100, i-100, j-50);

  if (i <300) {
    stroke (208, 238, 69, 80);
  }
  else {
    stroke (0, 50);
  }
}




