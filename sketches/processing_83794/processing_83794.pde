
class particle{
  float x,y,x0,y0;
  boolean qua=false;
  particle(float X,float Y){
    x=x0=X;
    y=y0=Y;
    display();
  }
  void display(){
    point(x,y);
  }
  void moveToMouse(){
    float distance=sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y));
    if(qua){distance*=distance/10;}
    float rate=50*particles02.multiplier/(50+distance);
    float angle=atan2(mouseY-y,mouseX-x);
    float c=cos(angle);
    float s=sin(angle);
    float p=abs(abs(c)+abs(s));
    x+=rate*c*p;
    y+=rate*s*p;

  }
  void backToOrigin(){
    x-=(x-x0)/10;
    y-=(y-y0)/10;
  }
}

