
//Eric Wong
//press z to add red, press x to take out some red , press c to make the other rectangles appear.  
//press v to make white darker, press b to add blue, press n to add green
// press w to make the length smaller, press s to make the length bigger
// press a to make the width smaller, press d to make the width bigger
rectangle a, b, c, d, e, f;
rectangle2 g, h, i, j, k, l, m;
void setup()
{
  size(600, 600);
  smooth();
  a= new rectangle();
  a.l= 600;
  a.w= 50;
  a.clr= 150;
  a.clg= 0;
  a.clb= 0;


  b= new rectangle();
  b.l= 600;
  b.w= 50;
  b.clr=150;
  b.clg=0;
  b.clb=0;

  c= new rectangle();
  c.l= 600;
  c.w= 50;
  c.clr= 150;
  c.clg= 0;
  c.clb= 0;


  d= new rectangle();
  d.l= 600;
  d.w= 50;
  d.clr= 150;
  d.clg= 0;
  d.clb= 0;


  e= new rectangle();
  e.l= 600;
  e.w= 50;
  e.clr= 150;
  e.clg= 0;
  e.clb= 0;


  f= new rectangle();
  f.l= 600;
  f.w= 50;
  f.clr= 150;
  f.clg= 0;
  f.clb= 0;


  g= new rectangle2();
  g.l= 600;
  g.w= 50;
  g.clr2= 0;
  g.clg2= 0;
  g.clb2= 0;

  h= new rectangle2();
  h.l= 600;
  h.w= 50;
  h.clr2= 0;
  h.clg2= 0;
  h.clb2= 0;

  i= new rectangle2();
  i.l= 600;
  i.w= 50;
  i.clr2= 0;
  i.clg2= 0;
  i.clb2= 0;

  j= new rectangle2();
  j.l= 600;
  j.w= 50;
  j.clr2= 0;
  j.clg2= 0;
  j.clb2= 0;

  k= new rectangle2();
  k.l= 600;
  k.w= 50;
  k.clr2= 0;
  k.clg2= 0;
  k.clb2= 0;

  l= new rectangle2();
  l.l= 600;
  l.w= 50;
  l.clr2= 0;
  l.clg2= 0;
  l.clb2= 0;

  a.x=0;
  b.x=0;
  c.x=0;
  d.x=0;
  e.x=0;
  f.x=0;
  g.x=0;
  h.x=0;
  i.x=0;
  j.x=0;
  k.x=0;
  l.x=0;
  a.y=0;
  b.y=100;
  c.y=200;
  d.y=300;
  e.y=400;
  f.y=500;
  g.y=50;
  h.y=150;
  i.y=250;
  j.y=350;
  k.y=450;
  l.y=550;
}

void draw()
{
  background(0);
  a.show();
  b.show();
  c.show();
  d.show();
  e.show();
  f.show();
  g.show();
  h.show();
  i.show();
  j.show();
  k.show();
  l.show();
}

class rectangle {
  float x, y;
  float l;
  int w;
  float clr;
  float clg;
  float clb;



  void show()
  {
    fill(clr, clg, clb);
    rect(x, y, l, w);
  }
}
class rectangle2 {
  float x, y;
  int l;
  int w;
  float clr2;
  float clg2;
  float clb2;


  void show()
  {
    fill(clr2, clg2, clb2);
    rect(x, y, l, w);
  }
}

void keyPressed()
{
  if (key =='z' || key == 'z') {
    a.clg= 0;
    b.clg= 0;
    c.clg= 0;
    d.clg= 0;
    e.clg= 0;
    f.clg= 0;

    a.clb= 0;
    b.clb= 0;
    c.clb= 0;
    d.clb= 0;
    e.clb= 0;
    f.clb= 0;

    a.clr= a.clr+10;
    b.clr= b.clr+10;
    c.clr= c.clr+10;
    d.clr= d.clr+10;
    e.clr= e.clr+10;
    f.clr= f.clr+10;
  }
  if (key =='n' || key == 'n') {
    a.clb= 0;
    b.clb= 0;
    c.clb= 0;
    d.clb= 0;
    e.clb= 0;
    f.clb= 0;
    a.clr= 0;

    a.clg= a.clg+10;
    b.clr= 0;
    b.clg= b.clg+10;
    c.clr= 0;
    c.clg= c.clg+10;
    d.clr= 0;
    d.clg= d.clg+10;
    e.clr= 0;
    e.clg= e.clg+10;
    f.clr= 0;
    f.clg= f.clg+10;
  }
  if (key =='b' || key == 'b') {
    a.clr= 0;
    b.clr= 0;
    c.clr= 0;
    d.clr= 0;
    e.clr= 0;
    f.clr= 0;

    a.clb= a.clb+10;
    b.clg= 0;
    b.clb= b.clb+10;
    c.clg= 0;
    c.clb= c.clb+10;
    d.clg= 0;
    d.clb= d.clb+10;
    e.clg= 0;
    e.clb= e.clb+10;
    f.clg= 0;
    f.clb= f.clb+10;
  }
  if (key =='x' || key == 'x') {
    a.clr= a.clr-10;
    b.clr= b.clr-10;
    c.clr= c.clr-10;
    d.clr= d.clr-10;
    e.clr= e.clr-10;
    f.clr= f.clr-10;
  }
  if (key =='c' || key == 'c') {
    g.clr2= g.clr2+10;
    g.clg2= g.clg2+10;
    g.clb2= g.clb2+10;

    h.clr2= h.clr2+10;
    h.clg2= h.clg2+10;
    h.clb2= h.clb2+10;

    i.clr2= i.clr2+10;
    i.clg2= i.clg2+10;
    i.clb2= i.clb2+10;

    j.clr2= j.clr2+10;
    j.clg2= j.clg2+10;
    j.clb2= j.clb2+10;

    k.clr2= k.clr2+10;
    k.clg2= k.clg2+10;
    k.clb2= k.clb2+10;

    l.clr2= l.clr2+10;
    l.clg2= l.clg2+10;
    l.clb2= l.clb2+10;
  }
  if (key =='v' || key == 'v') {
    g.clr2= g.clr2-10;
    g.clg2= g.clg2-10;
    g.clb2= g.clb2-10;

    h.clr2= h.clr2-10;
    h.clg2= h.clg2-10;
    h.clb2= h.clb2-10;

    i.clr2= i.clr2-10;
    i.clg2= i.clg2-10;
    i.clb2= i.clb2-10;

    j.clr2= j.clr2-10;
    j.clg2= j.clg2-10;
    j.clb2= j.clb2-10;

    k.clr2= k.clr2-10;
    k.clg2= k.clg2-10;
    k.clb2= k.clb2-10;

    l.clr2= l.clr2-10;
    l.clg2= l.clg2-10;
    l.clb2= l.clb2-10;
  }
  if (key =='a' || key == 'a') {
    a.l= a.l-10;
    b.l=b.l-8;
    c.l=c.l-6;
    d.l=d.l-4;
    e.l=e.l-2;
    f.l=f.l-1;
  }


  if (key =='d' || key == 'd') {
    a.l= a.l+10;
    b.l=b.l+8;
    c.l=c.l+6;
    d.l=d.l+4;
    e.l=e.l+2;
    f.l=f.l+1;
  }

  if (key =='w' || key == 'w') {
    a.w= a.w-14;
    b.w=b.w-12;
    c.w=c.w-10;
    d.w=d.w-8;
    e.w=e.w-6;
    f.w=f.w-4;
  }


  if (key =='s' || key == 's') {
    a.w= a.w+14;
    b.w=b.w+12;
    c.w=c.w+10;
    d.w=d.w+8;
    e.w=e.w+6;
    f.w=f.w+4;
  }
}


