
size (1000,1000);
background (242, 204, 47);
colorMode (RGB);
for ( float x=0; x<255; x+=1) {
  float y= pow(x, 8);
  float r= norm (x, 0.0, 100.0);
  r*=255.0;
  float g= norm (y, 0.0, 100.0);
  g *=255.0;
    stroke (r,g,r+g);
    strokeWeight (20);
  line (x, 0, x, 500);
  line (400-x, 500, 1000-x, 1000);
}

  
  



