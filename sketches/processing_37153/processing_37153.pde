
size (800, 300);

background (255);

 
for (int i=1; i<=70; i=i+1) {
  float rx = i*70;
  float myspacing= 10;
  float ry = random(140, 160);
 
  //float rGray = random(0, 255); 
 // fill(rGray); 
  ellipse (i*myspacing, ry, 10, 10) ;
}

