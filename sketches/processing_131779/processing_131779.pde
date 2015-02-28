
size(400,400);
background(#3dfcd0);
int i=50;
if (i<100) {
  for(int x=10;x<=200;x+=10){
    for(int j=15; j<=400;j+=10){
      float r=random(0,400);
      float m=random(0,400);
      stroke(#b60354);
      fill(#237DF2);
      ellipse(i,j, m, r);
} 
  }}
  int a=20;
  if(a<100){
    for(int b=20;b<=400; b+=5){
      for(int c=5; c<=400; c+=10){
        float r=random(0,400);
        float m=random(0,400);
        stroke(#A77B53);
        line(r*m,m%r,r*m,m*r);
      }}}
      
