
size(200, 200);
background(255);

for (int a =20; a<=160; a= a+30) {
  for (int b=20;b<=170;b=b+30) {
    line(a, b, a+30, b); //*linhashorizontais
    line(b, a+30, b, a); //*linhasverticais
  }
}

for (int x=20; x<=180; x=x+30) {
  for (int y= 20; y<=180; y=y+30)
  { 
    stroke(0);
    ellipse( x, y, 5, 5);
    if ((x<140 && x>=80)&& (y<140 && y>=110) ) //*ellipses que "brilham"
    {
      fill(245, 27, 180); //*ROSA
    } 
    else
      fill(255);
    ellipse( x, y, 5, 5);
  }
}
