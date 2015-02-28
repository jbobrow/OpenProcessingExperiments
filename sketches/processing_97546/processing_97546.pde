
size(200, 200);
background(#462020);
int x=110;
int y=5;
stroke(245, 0, 16);
strokeWeight(1);
for (x=100; x<=140;x+=4) {
  line((x*x/100), y, 180, 5);
  line(20, 10, (-x*x/100)+200, y);
  y+=12;
}
