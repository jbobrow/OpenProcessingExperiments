
int xi=30;
int yi=30;
int xf=150;
int yf=150;
int x=30;
float b;
float m;
void setup(){
  size(400,400);
  
}

void draw (){
  background(255);
  fill (255,0,0);
  ellipse(xi,yi,20,20);
  fill(0,255,0);
  ellipse(xf,yf,20,20);
calcular ();
if(x<=xf) {
  ellipse(x,m*x+b,20,20);
   }
x=x+1;
}
void calcular (){
  m=(yf-yi)/(xf-xi);
b=yi-m*xi;
}
