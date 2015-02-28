
size (200,200);

colorMode (RGB,250);
for (int i=2; i<200; i+=18){
  for (int j=2; j<200; j+=18) {
    fill (i+100, j+30, j+100);
    rect (i,j, 15,15);
  }
}


