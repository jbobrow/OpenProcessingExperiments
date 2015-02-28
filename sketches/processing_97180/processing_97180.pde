
size (200, 200);
background (0,0,255);
for (int i=50; i<200 ; i=i+25) { //ellipses linha reta
  noStroke();                        
  fill(255, 255, 0, 295-i*i/94);
  ellipse (i, 50, 45, 45);
}
 
for (int x=-100; x<200 ; x=x+15) { //ellipses da parabola
noStroke();                              
  fill(255,255,0);
  ellipse (x+100, (x*x/150)+115, 6, 6);
}
