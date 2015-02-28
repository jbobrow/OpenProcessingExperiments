
//Eric K, CP1 mods 4-5, Repeating Shapes
//url: http://ericsprogrammingsite.webs.com/Repeating.html

/**
  Creates a program using loops.
*/

size(512, 512);
background(0);
noFill();

//background
int grad = 0;
while (grad < 255)
{
  stroke(grad);
  rect(grad, grad, 512-(2*grad), 512-(2*grad));
  grad = grad + 1;
}

//red circles
stroke(127, 0, 0);
int r = 300;
while (r < 721)
{
  ellipse(256, 256, r, r);
  r = r + 40;
}

//yellow lines
stroke(127, 127, 0);
int x = 1;
while (x < 512)
{
  line(x, 0, 512-x, 512);
  x = x + 10;
}
int y = 1;
while (y < 512)
{
  line(0, y, 512, 512-y);
  y = y + 10;
}

//green shape
stroke(0, 255, 0);
int offset = 20;
while (offset < 256)
{
  beginShape();
  curveVertex(128, 192);
  curveVertex(128, 192);
  curveVertex(128, 320);
  curveVertex(256-offset, 256+offset);
  curveVertex(192, 384);
  curveVertex(320, 384);
  curveVertex(256+offset, 256+offset);
  curveVertex(384, 320);
  curveVertex(384, 192);
  curveVertex(256+offset, 256-offset);
  curveVertex(320, 128);
  curveVertex(192, 128);
  curveVertex(256-offset, 256-offset);
  curveVertex(128, 192);
  curveVertex(128, 192);
  endShape();
  offset = offset + 10;
}

//magenta ellipses
stroke(255, 0, 255);
int w = 0;
while (w < 511)
{
  ellipse(256, 256, w, 200);
  w = w + 10;
}

//cyan ellipses
stroke(0, 255, 255);
int h = 0;
while (h < 511)
{
  ellipse(256, 256, 200, h);
  h = h + 10;
}
