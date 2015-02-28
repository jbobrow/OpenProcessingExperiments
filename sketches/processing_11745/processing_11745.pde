
  size(300, 300);
background(140,0,75);
stroke(200);
 
int a = 40;
int b = 50;
int c = a*10;
int d = a*20;
int e = b-a;
int f = b/3;
int g = f-c;
 
 
line(a, e, b, g);
line(b, e, d, g);
line(b, f, d, c);
line(a, e, f, c*b);
line(d, f, a, e);
line(c,b,d,g);
line (d, g, c, e);

