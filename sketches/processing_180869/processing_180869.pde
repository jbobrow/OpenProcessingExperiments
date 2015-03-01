
float x=0;
int a=0;
int i=0;

void setup()
{
  size(800,800);
  colorMode(HSB,360,100,100);
  frameRate(60);
}

void draw()
{
  translate(width/2,height/2);
  background(0,0,0);
  a++;
  x=(width/2)*cos(radians(a));
  
  for(i=0;i<40;i++)
  {
  stroke(9*i,100,80);
  strokeWeight(3);
  noFill();
  ellipse(0,0,x-i*(x/40),height/2-i*10);
  
 //rotate(PI/8);//+frameCount);

  }
}


