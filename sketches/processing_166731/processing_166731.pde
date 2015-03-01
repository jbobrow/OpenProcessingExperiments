
int xi=20;
int yi=20;
int xf=150;
int yf=150;
int x=30;
float b;
float m;

void setup(){
  size(400,400);
  
}
void draw () {
fill(135);
ellipse(xi,yi,20,20);
fill(0);
ellipse(xf,yf,20,20);

calcular();
if(x<=xf){
ellipse(x,m*x+b,20,20);
}
x=x+1;
}

void calcular (){
 m=(yf-yi)/(xf-xi);
b=yi-m*xi; 
}
