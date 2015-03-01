
 int  x = 30;
 int q = 90 ;
 int w = 60;
 int e = 55;
 int r = 55;
 int t = 75;
 int y = 55;
 int u = 80;
 int i = 101;
 int o = 99;
 int p = 100;
 int a = 121;
 int s = 141;
 
 
 void setup () {
size (500,200);
}

void draw () {
  background(#E5D027);
  fill(#E52734);
  noStroke();
  
  rect ( u,70,20,10);
  u= u + 1 ;
  
  fill(#09810A);
  triangle(x,40,q,40,w,120);
  x = x+1;
  q = q+1;
  w = w+1;
  
  fill(#551109,155);
  rect(e,0,15,40);
  e = e+1;
  
  fill (#3C1DCB);
  ellipse(r,60,10,10);
  r = r+1;
  
  ellipse (t,60,10,10);
  t = t + 1;
  
  rect (y,80,20,10);
 
  y = y + 1;
  
  fill(255);
  ellipse(i,75,15,15);
 
  i = i + 1;
  fill(#5A2005);
  rect(o,20,5,50);
  o = o + 1;
  fill(#056714);
  rect(p,20,20,30);
  p = p + 1 ;
  
  fill(255);
  rect(a,20,20,30);
  a = a + 1 ;
  
  fill (#F00518);
  rect(s,20,20,30);
  s = s + 1 ;
  
  

  
  
  
  
  
  }
  

