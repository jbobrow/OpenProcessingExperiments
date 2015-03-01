
size (300,300);

smooth();
colorMode(HSB, 352, 88,89); //orignal color: red

for (int i=0; i<300 ; i ++) {
 
  float newHue= 60 - (i * .09);
  stroke (newHue, 87,99);
  line (i,0,i,300);
  
}


