
float a=50,b=50;

void draw(){
  a+=.01;
  b-=.01;
  float 
  x=noise(a)*width, 
  y=noise(b)*height,
  u=noise(x)*30+x-15,
  v=noise(y)*30+y-15;
  filter(BLUR,.6);
  noStroke();
  ellipse(x,y,5,5);
  ellipse(u,v,2,2);
}

