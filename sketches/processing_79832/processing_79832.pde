
float r = 31; 
float g = 26; 
float b = 25;
int diameter = 5;
int x = 0; 
int y = 300;
int a = 0; 
int c = 300;
int d = 0;
int e = 295;
int k = 300; 
int l = 5;
int m = 0; 
int n = 5;
int o = 0; 
int p = 5;

void setup(){
  size(300,300);
  noFill();
  frameRate(40);
  while(x < 300) {
    stroke(r,g,b);
    line(x,0,x,300);
    x = x + 1;
    r = r + (244-46)/300.0;
    g = g + (139-164)/300.0;
    b = b + (96-87)/300.0;}
  while(x < 151) {
    stroke(r,g,b);
    line(y,0,300,y);
    y = y - 1;
    r = r + (244-46)/300.0;
    g = g + (139-164)/300.0;
    b = b + (96-87)/300.0;}
}
void draw(){
  stroke(18,8,1); 
  line(d,300,300,e);   
  d = d + 5;  
  e = e - 5; 
  line(0,k,l,0);   
  l = l + 5;  
  k = k - 5; 
  line(0,m,n,300);   
  m = m + 5;  
  n = n + 5; 
  line(o,0,300,p);   
  o = o + 5;  
  p = p + 5; 
  ellipse (150,150,diameter,diameter);
  diameter = diameter + 5;
}



