
nt xi=0;
int yi=200;

int xf=400;
int yf=200;
int x=30;

float b;
float m;


void setup() {
  size(400,400);
}

void draw(){
  background(255,255,255);
 
  if (x<=xf){
      ellipse(x, m*x+b,40,40);
      fill(0,255,0);
  }
    
  x=(x+3)%400;
  m=((yf-yi)/(xf-xi));
  b=yi-m*xi;

  fill(255,0,0);
  rect(100, 100, 50, 300);
  rect(200, 100, 50, 300);
  fill(125,125,125);
}
