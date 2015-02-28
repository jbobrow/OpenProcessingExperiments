
int x=20,y=20,dx=0,dy=0,a=2,b=2;

void setup()
{
  size(300, 250);
  background(255);
}

void draw()
{  
    background(255);
    fill(0,127,255);
    ellipse(x,y,20,20);
    if(key=='d') {dx=a;dy=0;}
    if(key=='a') {dx=-a;dy=0;}
    if(key=='w') {dy=-b;dx=0;}
    if(key=='s') {dy=b;dx=0;}
    if(key==' ') {dx=0;dy=0;}
    x+=dx;
    y+=dy;
    if(x>300-10) {x=300-10;}
    if(x<0+10) {x=0+10;}
    if(y>250-10) {y=250-10;}
    if(y<0+10) {y=0+10;}
}
