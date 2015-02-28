
int rx, ry;
int cx, cy;
int tx,ty;
float r,g,b,a;
void setup()
{
  size (200,200);
  background(206,73,144);
  rx = 50;
  ry = 60;
  cx = 45;
  cy = 30;
  tx = 99;
  ty = 76;
}
void draw()
{
  if (mouseX >= 10 && mouseX <= 100)
 { 
   rect(rx,ry,31,24);
  
  ellipse(cx,cy,58,67);

  triangle(tx,ty,33,36,78,94);
  
  r = random(255); 
  g = random(255);
  b =  random(255);
  a = random(255);
  fill(r,g,b,a);
 }
  else 
  {
  background (206,73,144);
  }
}
