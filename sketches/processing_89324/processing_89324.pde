
size(1000, 1000);
translate(500,500);
  background(0); 
  colorMode(HSB);
    

for (int r; r<2*PI; r+=PI/6;){
  rotate(r);
  for (int i=0; i<500; i+=20;) {
    stroke (i,100,255);
    line (500-i,500,500,i);
    line (i,0,0,500-i);
  }

}
