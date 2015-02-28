
int esize = 3;

size(510,510);
background(0);
smooth();

for (int x = 0; x <= 510; x ++) {
  stroke(x, 255, 255, 127);
  line(510, x, 0, 0); 
  stroke(x, 235, 235, 127);
  line(410, x, 0, 0);
  stroke(x,215, 215,127);
  line(310, x, 0, 0);
  stroke(x, 195, 195, 127);
  line(210, x, 0, 0);
  stroke(x, 175, 175, 127);
  line(110, x, 0, 0);
  stroke(x, 155, 155, 127);
  line(10, x, 0, 0);
  stroke(x, 255, 255, 127);
  line(0, x, 0, 0); 
}
  



