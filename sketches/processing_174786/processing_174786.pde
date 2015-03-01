
int xi=30;
int yi=30;
int xf=150;
int yf=150;
int x=40;
float b;
float m;



void setup(){
  size(400,400);
  
}
void draw(){
  background(100);
  fill(255,255,255);
  ellipse(xi, yi, 30, 30);
  fill(0,255,0);
    ellipse(xf, yf, 30, 30);
    calcular();
    if(x<=xf){
      fill(0,128,0);
      ellipse(x,m*x+b,30,30);
     
}
x=x+1;
}
void calcular(){
  m=(xf-xi)/(xf-xi);
  b=yi-m*xi;
  
}
