
size(200,200);
background(50);

int x=3;

while (x<=200)  {
  noStroke();
  fill (235,235,235,10*x);
  rect((x*x),170,11,11);
  x=x+2;
}
