
background(255);
size(600, 600);
stroke(20, 50, 70);
strokeWeight(4);
line (0, 70, 600, 70);
float xstep = 10;
float ystep = 10;
float lastx = 20;
float lasty = 50;
float y = 50;
int border=30;
for (int x=100; x<=480; x+=xstep) {
  ystep = random(20)-10 ;
  y += ystep;
  line(x, y, lastx, lasty);
  line(x, -y, lastx, lasty);
  line(y,x,lasty,lastx);
  line(-y,x,lasty,lastx);
  line(x, height-(x+y-50), lastx, height-(lastx+lasty-50));
  line(x, x+y-50, lastx, lastx+lasty-50);  
  
  lastx = x;
  lasty = y;
}


