
int xi=30;
int yi=30;
int xf=150;
int yf=150;
int x=30;

float b;
float m;


void setup() {
  size(400,400);
}

void draw(){
  background(255,255,255);
  fill(255,0,0);
  ellipse(xi,yi,40,40);
  fill(0,255,0);
  ellipse(xf,yf,20,20);
  if (x<=xf){
  ellipse(x, m*x+b,40,40);
  }
x=x+1;
x = x % xf;
m=((yf-yi)/(xf-xi));
b=yi-m*xi;
}
