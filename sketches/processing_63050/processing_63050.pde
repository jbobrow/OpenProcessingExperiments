
int x1 = -150; // camera body
int x2 = -150; // lens grey
int x3 = -150; // lens white
int x4 = -150; // camera flash
int x5 = -150; // dark red button
int x6 = -150; // bright red button
void setup ()
{
size (500, 500);
}

void draw(){
background(219, 255, 252);
fill (0);


if (x1<200)
{
  x1 = x1+1;
}
fill (0);
rect (x1, 200, 100, 60); // body of camera


if (x2<250)
{
  x2 = x2+1;
}
fill (205);
ellipse (x2, 230, 40, 40); // lens grey


if (x3<250)
{
  x3 = x3+1;
}
fill (255);
ellipse (x3, 230, 30, 30); // lens white

if (x4<275)
{
  x4 = x4+1;
}
rect (x4, 203, 20, 10); // flash of camera
fill (134, 7, 7);

if (x5<200)
{
  x5 = x5+1;
}
rect (x5, 196, 20, 04); // dark red button
fill (255, 0, 0);

if (x6<205)
{
  x6 = x6+1;
}
rect (x6, 192, 10, 04);  // bright red button






}

