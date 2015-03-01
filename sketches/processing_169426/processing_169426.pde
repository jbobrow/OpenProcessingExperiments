
int l=0;
int k=0;
int a=#00050A;
int m=#DB42D1;
void setup()
{
  background(#0FD3AA);
 size(1000,150);
 }
  void draw()
 {
   frameRate(8);
   fill(a);
   a=a+m;
  strokeWeight(3);
  rect(l,k,15,15);
  l=l+17;
  if (l>width)
  {
    l=0;
    k=k+17;
  }
 }
