
size(200, 200);
background(0);

for (int x=20; x<=180; x=x+30)
  for (int y= 20; y<=180; y=y+30)
  { 
    stroke(255);
    ellipse( x, y, 5, 5);
  }
for (int a =20; a<=160; a= a+30) 
  for (int b=20;b<=180;b=b+30) {
    line(a, b, a+30, b);
    line(a, b, a, b*2);
  }
