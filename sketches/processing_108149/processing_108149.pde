
size(800,800);
background(255,255,255);
 int h = 795;
 while (h > 0) {
//   fill(0,0,0);
   ellipse(width/2, height/2, h, h);
//   fill(255,255,255);
   ellipse(width/2, height/2, h-5, h-10);
   ellipse(width/2, height/2, h-10, h-5);
   h = h - 10;
}
