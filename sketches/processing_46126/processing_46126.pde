
Agent[] a;
int controls = 200;
void setup()
{ size(800,800);
smooth();
a = new Agent[controls];
for( int i = 0; i < controls; i++)
{ a[i] = new Agent();
a[i].X = round(random(width - a[i].r));
a[i].Y = round(random(height - a[i].r));
a[i].r = random(10, 20);
a[i].speedx = round(random(-2, -4));
a[i].speedy = (a[i].speedx * -1);
a[i].f = round(random(255));
a[i].f2 = round(random(255));
a[i].f3 = round(random(255));
}
}
void draw()
{ fill(0, 40);
rect(0, 0, width, height);
noStroke();
for( int i = 0; i < controls; i++)
{ a[i].show();
a[i].run();
}
}
class Agent
{ float X, Y;
float r;
int speedx, speedy;
int f, f2, f3;
void show()
{ fill(f, f2, f3);
ellipse(X, Y, r, r);
}
void run()
{ X += speedx;
Y += speedy;
if (X - r < 0) X = width + r;
if (Y + r > height) Y = 0 - r;
}
}

