
void setup ()
{
  size(600,600);
}

void rys(float x, float i)
{
  ellipse(-x,x, i/50, i/50);
 // translate(10, 10);
   ellipse(x,-x, i/50, i/50);
 // translate(-10, 10);
  ellipse(-x,-x, i/50, i/50);
 // translate(-0, -10);
   ellipse(x,x, i/50, i/50);
}
void draw(){
  translate(width/2,height/2);
  for(float i = 100; i > 0; i = i-pow(2,2)){
  rys(i,i*i);
}
}
