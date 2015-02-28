
size (200,200);
background (180,200,230);
noStroke();
fill (150);
rect (20,10,100,200);
rect (30,30,120,200);
stroke (50);
for (int i = 30; i < 130; i += 30) {
  line(i, 50, i, 80);
  line(i, 110, i, 140);
  line(i, 50, i+10, 50);
  line(i, 110, i+10, 110);
}
fill (220,200,30);
rect (60, 180, 50, 50);
line (85,180,85,200);
noStroke();
fill (115,80,40);
rect (170,170,5,30);
fill (100,130,100);
ellipse (172,170,35,35);
