
size(200, 200);
background(#B97DC1);
noStroke ();
for ( int b=255; b>0; b=b-1) {
  fill(15,140,b);
  rect(0, 255-b, 200, 1);
}
stroke(0);
noStroke();
 int x=10 ;
 int y=10;
 fill(x*x/3, x*40, 100);
for(x=10;x<200;x=x+16)
 {for(y=10;y<200;y=y+16)
 {rect(x,y,5,5);}}
