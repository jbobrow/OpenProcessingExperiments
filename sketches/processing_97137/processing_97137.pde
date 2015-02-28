
background (183, 46, 46);
size (200, 200);
for (int i=32; i<180 ; i=i+20) {
  noStroke();
  fill(255, 255, 255, i+i/2);
  ellipse (i, 40, 32, 32);
}
 
for (int x=-90; x<90 ; x=x+10) {
noStroke();
  fill(255);
  ellipse (x+100, (x*x/170)+105, 3, 3);}
