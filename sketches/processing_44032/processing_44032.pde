
size(500, 500);
background(255);
strokeWeight(5);
smooth();

float xstep = 10;
float ystep = 10;
float lastx = 20;
float lasty = 50;
float y = 50;
for (int x=20; x<=480; x+=xstep) {
ystep = random(20) - 10; //range -10 to 10
y += ystep;
line(x, y, lastx, lasty);
line(y, x, lasty, lastx);
line(x, x+y+20, lastx, lastx+lasty+20);
lastx = x;
lasty = y;
}




