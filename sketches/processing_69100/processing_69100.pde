
//Grace O'Hair-Sherman Mods 14-15 Computer Programming
//90,200,250 250,150,225
size(500, 500);
background(0);
int a = 0;
while (a<500)
{
  stroke(90+a/4, 200-a, 250-a/5);
  line(0, a, 500, a);
  a = a + 1;
}
stroke(255, 0, 0);
noFill();
int c = 100;
int b = 0;
while (b<100)
{
  quad(250-b, 250-c, 250-b, 250+c, 250+b, 250-c, 250+b, 250+c);
  b = b + 5;
}
stroke(0, 255, 0);
int d = 300;
while (d>100)
{
  ellipse(0, 0, d, d);
  d = d - 10;
}
stroke(0, 0, 255);
int e = 300;
while (e>100)
{
  ellipse(500, 500, e, e);
  e = e - 10;
}
