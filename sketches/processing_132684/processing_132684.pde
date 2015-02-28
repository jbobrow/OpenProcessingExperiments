
size(800,800);
background(0);
int i = 50;
while ((i + 20) < 800); {
  line(1, i, 800, i);
  stroke(255);
  i = i + 100;}
int e = 10;
while (e  < 800); {
  line(e, 1, e, 800);
  stroke(255);
  e = e + 200;  }
int f = 20;
while ((f + 50) < 800); {
  line(f, 1,f, 800);
  f = f + 200;  }
  int x = 0;
int y = 0;
while (x<height);
while (y<width-100) { 
stroke(250,0,0);
  line(x,y,width/2,height/2); 
x=x+10;
y=y+5; }

