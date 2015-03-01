
int xi=30;
int yi=30;
int xf=150;
int yf=150;
int x=40;
float b;
float m;



void setup(){
  size(300,300);
  
}
void draw(){
  background(0);
  fill(0,255,255);
  ellipse(xi, yi, 20, 20);
  fill(138,255,0);
    ellipse(xf, yf, 20, 20);
    calcular();
    if(x<=xf){
      fill(255,128,0);
      ellipse(x,m*x+b,20,20);
     
}
x=x+1;
}
void calcular(){
  m=(xf-xi)/(xf-xi);
  b=yi-m*xi;
  
}
