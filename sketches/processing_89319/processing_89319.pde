
size(1000, 1000);
  background(0); 
  colorMode(HSB);  


  for (int i; i<1000; i+=10;) {
    stroke (i/3,100,255);
    line (i,0,0,1000-i);
    

  }
