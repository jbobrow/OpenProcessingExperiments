
size (200, 200);
background (255);
noStroke();
for (int i=24; i<100; i=i+10) {
  line (10, 10, i-i*i/105, i*i/50);
  line (190, 10, (i*i/240)+60, i*i/50);
}
stroke(0);
  for (int i=0; i<7; i=i+1) {
  line (10, 10, 50- i*i, i*20+10);
  line (190, 10, 150+ i*i, i*20+10);
}
