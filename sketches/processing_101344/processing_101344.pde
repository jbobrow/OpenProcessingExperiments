
int w=1000,c=w/2-135;

void setup(){
  size(2000,325);
  background(0);
  frameRate(1);
}

void draw()
{stroke(255);

for(float r=c*2;r>0;r-=.1)
{
  float a=r*(random(width)+random(height)*250)*.0001;
  if ((c + cos(a)*r*sin(r)) < 1000){
  point(c + cos(a)*r*sin(r), (c/2) + sin(a)*r*sin(r));
  }
} 
  filter(11);
  blend(0,0,w,w,-2,2,w+3,w-5,1);
}

