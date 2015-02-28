
float a = 0;

float k = 5;
float l = 1;
float step =0.01;
float q = 1;
float s = 1;
float d = 1;
float f = 1;
float aOffset=0;
float aOffsetS=0.01;
float qs = 0.001;
float ss = 0.003;
float ds = 0.002;
float fs = 0.0005;
float icount = 1;
float jcount = 1;
float r = 250;
int i=0;
int j=0;
float complexity = 5;
void setup()
{
frameRate(30);
colorMode(HSB,100);
qs=random(-0.005,0.005);
ss=random(-0.005,0.005);
ds=random(-0.005,0.005);
fs=random(-0.005,0.005);

size(800,800);

q=1;
s=1;
d=1;
f=1;
}
void draw()
{
  aOffset+=aOffsetS;
  noStroke();
  //fill(0,0,100,5);
  background(100,0,100);
  q+=qs;
  s+=ss;
  d+=ds;
  f+=fs;
  if(q>complexity || q<0.1)
  {
    qs*=-1;
  }
  
  if(s>complexity || s<0.1)
  {
    ss*=-1;
  }
 if(d>complexity || d<0.1)
  {
    ds*=-1;
  }
   if(f>complexity || f<0.1)
  {
    fs*=-1;
  }
  float moy = (q+s+d+f)/4;
  translate((width/2),(height/2));
  rotate(PI/16*aOffset);
  a=aOffset;
  
  while(a<PI*2+aOffset)
  {
  
  PVector p1=new PVector(r*cos(q*a)*cos(s*a),r*sin(d*a)*sin(f*a));
  a+=step;
  PVector p2=new PVector(r*cos(q*a)*cos(s*a),r*sin(d*a)*sin(f*a));
  stroke(75,0,0,100);
  float greyness = dist(p1.x,p1.y,p2.x,p2.y)*0.5;
  strokeWeight(max((20/icount)-dist(p1.x,p1.y,p2.x,p2.y)*(4/moy),3));
  line(p2.x,p2.y,p1.x,p1.y);
  }
  
  i++;
  //save("img_"+str(i));
}


