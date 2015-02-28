
int x = 100;
int y = 50;
int dtelhax = 15;
int dtelhay = 10;
int ptx = 10;
int pty = 10;
size (200,200);
background(255);
for(int i = 0; i < 10; i++){
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
for(int i = 0; i < 10; i++){
  line(x, y, x+dtelhax, y+dtelhay);
  x += ptx;
  y += pty;
}
line(25,200,25,128);
line(175,200,175,128);
rect(40,135,40,40);
rect(100,135,40,100);
line(25,128,175,128);
ellipse(170, 30, 20, 20);
