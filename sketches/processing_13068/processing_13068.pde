
float x=500;
float y=500;
float q=300;
float w=300;
float m=500;
float n=300;
float l=300;
float r=100;
float g=150;
float b=200;
float a=200;

void setup () {
  size (600,600);
  background (0);
  frameRate(1.5);
}
void draw (){

  x= random (300);
  y= random (300);
  q= random (300);
  w= random (300);
  m= random (500);
  n= random (300);
  l= random (300);
  r= random (255);
  g= random (255);
  b= random (255);
  a= random (255);
  
  rect(q,w,q,w);
  
  stroke(255);
  fill(a,g,r,b);
  ellipseMode(CENTER);
  ellipse(x,y,x,y);
  
  triangle(m,n,l,m,n,l);
  
  
}

