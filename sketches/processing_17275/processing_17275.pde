
size(400,400);
background(0);
smooth();
stroke (255,60,10, 20);
for(int i=80; i<300; i++) {
  float r = random(8);
  strokeWeight(r);
  float offset = r* 15.0;
  line(i-10, 400, i+offset, 0);
}
