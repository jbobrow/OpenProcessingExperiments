
void setup()
{
  size(800,600);
  background(160);
  frameRate(45);
}
 
int a = 164;
int b = 240;
int c = 260;
int d = 340;
int e = 164;
int f = 164;
short g = 262;
int h = 190;
short i = 325;
int j = 140;
int k = 164;
short l = 340;
int m = 144;
short n = 400;
int o = 185; 
 
void draw()
{
  background(160);
  fill(240,222,27);
  

  ellipse(a,b,40,40);
  line(e,c,e,d);
  line(f,g,h,i);
  line(f,g,j,i);
  line(k,l,m,n);
  line(k,l,o,n);
   
  
  a = a +1;
   
  
  e = e + 1;
   
  
  f = f + 1;
  h = h + 1;
  j = j + 1;
   
  
  k = k + 1;
  m = m + 1;
  o = o + 1;
}
