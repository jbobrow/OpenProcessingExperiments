
size (200,200);
 
colorMode (RGB,250);
for (int i=2; i<200; i+=25){
  for (int j=2; j<200; j+=25) {
    fill (i+230, j+150, j+100);
    rect (i,j, 20,20);
  }
}
