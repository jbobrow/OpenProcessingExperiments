
void setup()
{
  size(1000,600);
}
int l=100;
float h=500;//width/2;
float k=300;//height/2;
float x;
float y;
float theta1;
float alpha;
float d;
float theta2;
float beta;


void draw()
{
  background(0);
  strokeWeight(20);
  stroke(200,120);
  d=dist(mouseX,mouseY,h,k);
  
  beta=acos(d/(2*l));
  alpha=atan2(mouseY-k,mouseX-h);
  theta1=alpha+beta;
  theta2=beta-alpha;
  if(d>2*l)
  {
    theta2=-atan2(mouseY-k,mouseX-h);
    theta1=atan2(mouseY-k,mouseX-h);
  }
  
  strike(h,k,l,theta1);
  strike(h+l*cos(theta1),k+l*sin(theta1),l,-theta2);
  
}

void strike(float x,float y,float l,float theta)
{
  line(x,y,x+l*cos(theta),y+l*sin(theta));
}


