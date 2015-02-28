
// Repeating Shapes, Laura Rivale, Computer Programming 1, 14-15

size(500,400);
background(0);

noFill ();
strokeWeight(2);
smooth();

//pink ellipse
stroke(227,14,120);
int x = 10;
while(x < 301)
{
  ellipse (250,200,x, 100);
  x = x + 20;
}

stroke(227,145,14);

//Orange Ellipse
int w = 10;
while(w <101)
{
  ellipse (250,100,w,100);
  w = w + 5;
}

//blue-greeen squares bottom
stroke(10,139,86);
int x2 = 10;
while (x2 < 491)
{
  rect (x2,355,x2 + 20,33);
  x2 = x2 + 5;

}

//red rings
stroke(255,0,0);
int h = 10;
while (h < 101)
{
  ellipse(250,300,100,h);
  h = h + 10;
}

//blue-greeen squares top
stroke(10,139,86);
int x3 = 10;
while (x3 < 491)
{
  rect (x3,10,x2 + 20,33);
  x3 = x3 + 5;
}
