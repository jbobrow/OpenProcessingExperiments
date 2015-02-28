
//Quiz Part C
float x, y;
background(255);
size(710, 100);
smooth();
for ( x=10;x<=700;x=x+10) {
  
      y=50;
      y= y+(random(-10,10));
    ellipse(x, y, 8, 8);
  }             
