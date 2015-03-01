
size (255,255);
background (255);
for (int x=10; x<255; x+=5) {
  float n= norm (x, 0, 255);
  float y= pow (n, 8);
  float m= norm (y, 0, 1)*255;
  noStroke ();
  fill (x, m, 255, x/3);
  ellipse (x+5, y, 70, 70);
  
  fill (x, m/2, 255, x/3);
  ellipse (x+20, y+51, 150, 150);
  
  fill (x, m/1.5, 255, x/3);
  ellipse (x+15, y+102, 84, 84);
  
  fill (x, m/3, 255, x/3);
  ellipse (x+25, y+153, 100, 100);
  
  fill (x, m/3.5, 255, x/2);
  ellipse (x+35, y+204, 90, 90);

  fill (x-20, m/2, 255, x*2);
  ellipse (x+45, y+255, 150, 150);
  
  fill (x-10, m/2, 255, x/3);
  ellipse (x, y, 100,100);
  
  fill (x, m/2, 255, x/3);
  ellipse (x+5, y, 200, 200);
}

  


