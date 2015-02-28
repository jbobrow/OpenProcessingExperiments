
//Wictor Hugo - Telhado
background(#81D6FF);
int x = 100;
int y = 50;
int dtelhax = 25;
int dtelhay = 15;
int ptx = 10;
int pty = 10;
size (200, 200);
background(255);
for (int i = 0; i < 10; i++) {
  line(x, y, x+dtelhax, y+dtelhay);
  x += ptx;
  y += pty;
}
x = 90;
y = 60;
dtelhax = 15;
dtelhay = -10;
ptx = -10;
pty = 10;
for (int i = 0; i < 10; i++) {
  line(x, y, x+dtelhax, y+dtelhay);
  x += ptx;
  y += pty;
}
smooth();
fill(155,36,36);
line(25, 200, 25, 128);
line(175, 200, 175, 128);
fill(#81D6FF);
rect(40, 135, 40, 40);
fill(#81D6FF);
rect(100, 135, 40, 100);
line(25, 128, 175, 128);
