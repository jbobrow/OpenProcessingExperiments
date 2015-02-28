
background(20,80,100);
size(400,400);
smooth();
stroke(255);
int w = 0;
int y = 400;
translate(200,200);
rotate(PI/2);
while( w < 400)
{
  noFill();
  ellipse(0,0,w,200);
  w = w + 10;
  ellipse(0,0,200,w);
}
