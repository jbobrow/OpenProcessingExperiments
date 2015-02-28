
size(200, 200);
background(#F7D50C);
int x=90;
int y=8;
stroke(#F72048);
strokeWeight(1);
for (x=115; x<=140;x+=4) {
  line((x*x/100), y, 180, 5);
  line(20, 10, (-x*x/100)+200, y);
  y+=20;
}
