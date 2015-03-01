
int xi=30;
int yi=30;
int xf=170;
int yf=170;
int x=40;
float b;
float m;



void setup(){
  size(200,200);
  
  }
void draw(){
    background(255);  
    textSize(9);
    textAlign(CENTER);
    fill(200, 0, 255);
text("Desplazamiento a un Punto", 100, 10); 
 fill(200, 0, 0);
text("E Inicial", 30, 45); 
text("E Final", 170, 185); 
fill(255,0,0);
    ellipse(xi, yi, 10, 10);
  fill(0,255,0);
    ellipse(xf, yf, 10, 10);
    calcular();
    if(x<=xf){
      ellipse(x,m*x+b,10,10);
     
}

x=x+1;
}
void calcular(){
  m=(xf-xi)/(xf-xi);
  b=yi-m*xi;
  
     
}

  
