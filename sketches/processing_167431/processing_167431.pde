
float x=random(1,600);
float y=random(1,600);
float a=random(10,80);
float c=random(10,80);
float r=random(255);
float g=random(100);
float b=random(255);

void
  setup()
  {
  size(600,600);
  frameRate(2);
  }
void draw()
{
  noStroke();
background(r,g,b);
r=random(255);
g=random(100);
b=random(255);

fill(#3456b5);
rect(x,y,a,c);
x=random(1,600);
y=random(1,600);
a=random(10,80);
c=random(10,80);

fill(r,g,b);
ellipse(x,y,a,c);
x=random(1,600);
y=random(1,600);
a=random(10,80);
c=random(10,80);
r=random(255);
g=random(100);
b=random(255);

fill(r,g,b);
ellipse(x,y,80,80);
x=random(1,600);
y=random(1,600);
r=random(255);
g=random(100);
b=random(255);

fill(r,g,b);
ellipse(x,y,80,80);
x=random(1,600);
y=random(1,600);
r=random(255);
g=random(100);
b=random(255);

fill(r,g,b);
ellipse(x,y,a,c);
x=random(1,600);
y=random(1,600);
a=random(10,200);
c=random(10,200);
r=random(100);
g=random(100);
b=random(100);

fill(r,g,b);
ellipse(x,y,40,40);
x=random(1,600);
y=random(1,600);
r=random(25);
g=random(10);
b=random(25);


fill(r,g,b);
ellipse(x,y,80,80);
x=random(1,600);
y=random(1,600);
r=random(255);
g=random(100);
b=random(255);


fill(r,g,b);
rect(x,y,a,c);
x=random(1,600);
y=random(1,600);
a=random(10,30);
c=random(10,30);
r=random(255);
g=random(100);
b=random(255);


fill(r,g,b);
rect(x,y,a,c);
x=random(1,600);
y=random(1,600);
a=random(10,300);
c=random(10,300);
r=random(255);
g=random(100);
b=random(255);

fill(r,g,b);
rect(x,y,a,c);
x=random(1,600);
y=random(1,600);
a=random(10,100);
c=random(10,100);
r=random(255);
g=random(100);
b=random(255);

fill(r,g,b);
rect(x,y,a,c);
x=random(1,600);
y=random(1,600);
a=random(10,200);
c=random(10,200);
r=random(255);
g=random(100);
b=random(255);

}
