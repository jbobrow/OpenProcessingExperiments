
//LauraGafuri

int x = 200;
int y = 120;
int dtelhax = 15;
int dtelhay = 12;
int ptx = 10;
int pty = 10;
 
stroke(188,87,19);
strokeWeight(3);
background(255,255,255);
 
size (400,400);
 
for (int i=0; i<10; i++)
{
  line(x, y, x+dtelhax, y+dtelhay);
  x += ptx;
  y += pty;
}
x=200;
y=120;
stroke(188,87,19);
dtelhax = 15;
dtelhay = -12;
ptx = -10;
pty = 10;
 
for (int i=0; i<10; i++)
{
  line(x, y, x-dtelhax, y-dtelhay);
  x += ptx;
  y += pty;
}
 
stroke(0,0,0);
line(120,200,120,300);
line(280,200,280,300);
line(0,300,400,300);
fill(56,183,50);
stroke(26,118,20);
rect(0,303,400,400);
noStroke();
fill(100,57,57);
rect(140,220,45,80);
noStroke();
fill(198,108,114);
rect (220,220,35,35);
noStroke();
fill(227,110,14);
ellipse(50,50,60,60);
fill(98,186,211,140);
ellipse(200,50,100,40);
fill(18,142,178,140);
ellipse(240,55,100,40);
stroke(70,62,48);
strokeWeight(5);
line(60,300,60,250);
fill(26,118,20);
noStroke();
ellipse(60,240,50,50);
