
//Press any key to change color
//by Daniel Wong

LingLong a, b, c, d, e, z, q, w, t, u;

void setup()
{
size(800, 800);
smooth();
noStroke();

a = new LingLong();
a.r = 85;
a.v = 8;
a.h = random(255);
a.j = random(255);
a.k = random(255);

b = new LingLong();
b.r = 85;
b.v = 8;
b.h = random(255);
b.j = random(255);
b.k = random(255);

c = new LingLong();
c.r = 85;
c.v = 8;
c.h = random(255);
c.j = random(255);
c.k = random(255);

d = new LingLong();
d.r = 85;
d.v = 8;
d.h = random(255);
d.j = random(255);
d.k = random(255);

e = new LingLong();
e.r = 85;
e.v = 8;
e.h = random(255);
e.j = random(255);
e.k = random(255);

z = new LingLong();
z.r = 85;
z.v = 27;
z.h = random(255);
z.j = random(255);
z.k = random(255);

q = new LingLong();
q.r = 85;
q.v = 27;
q.h = random(255);
q.j = random(255);
q.k = random(255);

w = new LingLong();
w.r = 85;
w.v = 27;
w.h = random(255);
w.j = random(255);
w.k = random(255);

t = new LingLong();
t.r = 85;
t.v = 27;
t.h = random(255);
t.j = random(255);
t.k = random(255);

u = new LingLong();
u.r = 85;
u.v = 27;
u.h = random(255);
u.j = random(255);
u.k = random(255);


b.x = a.x + 100;
c.x = a.x + 200;
d.x = a.x + 300;
e.x = a.x + 400;

q.x = z.x + 100;
w.x = z.x + 200;
t.x = z.x + 300;
u.x = z.x + 400;
}

void draw()
{
background (0);
a.move();
b.move();
c.move();
d.move();
e.move();
z.move();
q.move();
w.move();
t.move();
u.move();
a.show();
b.show();
c.show();
d.show();
e.show();
z.show();
q.show();
w.show();
t.show();
u.show();
}

void keyPressed ()
{
if (key == 'g');
{
    a.h = random (255);
    b.h = random (255);
    c.h = random (255);
    d.h = random (255);
    e.h = random (255);
    z.h = random (255);
    q.h = random (255);
    w.h = random (255);
    t.h = random (255);
    u.h = random (255);
   
    a.j = random (255);
    b.j = random (255);
    c.j = random (255);
    d.j = random (255);
    e.j = random (255);
    z.j = random (255);
    q.j = random (255);
    w.j = random (255);
    t.j = random (255);
    u.j = random (255);
   
    a.k = random (255);
    b.k = random (255);
    c.k = random (255);
    d.k = random (255);
    e.k = random (255);
    z.k = random (255);
    q.k = random (255);
    w.k = random (255);
    t.k = random (255);
    u.k = random (255);
}
}


class LingLong
{
float x, y;
int r; // size (r for radius)
int v; // velocity
float h; // color 1
float j; // color 2
float k; // color 3

void show()
{
    fill (h, j, k);
    ellipse(x + 200, y + 200, r, r);
    ellipse(x + 200, y + 400, r, r);
}

void move()
{
    x += ( mouseX - width/2  ) * 0.001 * v;
    y += ( mouseY - height/2 ) * 0.001 * v;
}
}



