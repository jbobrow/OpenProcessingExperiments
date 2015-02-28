
size (400,400);
background (20,200,190);
/*for(int i=0; i<40; i++) {
  line (40, 100, 20.5*i, 10*i);
}*/

int a, b, c, d;
for(int y=0; y<400; y++) {
  a = (int)random(400);
  b = (int)random(255);
  c = (int)random(255);
  fill(190,c,180);
  noStroke();
  bezier(a, y*10, 130, 90, 100, 90, 140, 200);
}

