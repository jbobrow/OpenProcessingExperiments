
size(200, 200);
background(210);
stroke(180);

int a = 10;
int b = 40;
int c = a*20;
int d = a*9;
int e = b-a;
int f = b*2;
int g = f+e;


line(a, f, b, g);
line(b, e, b, g);
line(b, e, d, c);
line(a, e, d-e, c);
line(b, f, a, e);
line(c,b,a,g);
line (d, a, c, e);

