

void l(float len)
{
  line(0,0,len,0);
}

void b(float x, float y, float d, float len,int n)
{
 pushMatrix();
 translate(x,y);
 rotate(radians(d));
 if (n!=0) {
   strokeWeight(n);
   stroke(color(0,150,0));
 
 l(len);
 b(len/2,0, 80, len/2,n-1);
 b(len/2,0, -80,len/2,n-1);
 
 b(len,0, 0,len/2,n-1);
}
else
{
  fill(color(200,0,0));
  ellipse(0,0,5,5);
}
// rotate(radians(d));
// line(0,0,l,0);
// stroke(255);
// translate(1/2,0);
// rotate(radians(90));
// l(0,1/2,d+90,1/2);
 popMatrix();
}
void draw()
{
  background(200);
  b(100,190, -90, 80,4);
}

void setup() {
  size(200,200);
}
  
 
 
  


