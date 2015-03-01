
size (1000,1000);
background (242, 204, 47);
colorMode (RGB);
for ( float x=0; x<255; x+=20) {
  float y= pow(x, 2);
  float r= norm (x, 0.0, 100.0);
  r*=255.0;
  float b= norm (y, 0.0, 100.0);
  b *=255.0;
    stroke (r,255,b);
    strokeWeight (20);
  line (x+400, 0, x+200, 500);
  line (400-x, 500, 1000-x, 1000);
}

  
  



