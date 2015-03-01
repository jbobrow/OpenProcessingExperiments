
float x=0;
int a=0;
int i;
int c1,c2,c3=0;

void setup()
{
  size(800,800);
  colorMode(HSB,360,100,100);
  frameRate(65);
}

void draw()
{
  translate(width/2,height/2);
  background(0,0,0);
  a+=2.5; //mawasu hayasa
  rotate(-45);
  
  for(i=0;i<20;i++)
  {
  x=(width/2)*cos(radians(a+i*4.5));
  
  c2=i%3;
  if(c2==0)c3=55;
  if(c2==1)c3=19;
  if(c2==2)c3=196;
  stroke(c3,90,80);
  strokeWeight(10);
  
  noFill();
  ellipse(0,0,x*(20-i)/20,height/2-i*20);

  }
}


