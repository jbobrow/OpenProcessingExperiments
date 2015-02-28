
float x;
float y;
float c;
float t;
void setup(){
  size(800,400);
  
  x =100;
c=100;
t=100;
}

void draw(){
  background(0);
  smooth();
c = 175 + sin(radians(y))*375;
t = 275+cos(radians(x))*375;
  y = 375 +  sin(radians(x))*375;
  for (int i=0;i<8;i++){
    fill(y,y+100,100);
 ellipse(c,c,50,50);
 fill(t,c,y);
    ellipse(y,y,y,y);
    fill(t+y,c+x,y);
    ellipse(t,t,c,c);
    fill(y,t,50);
    ellipse(t+y,c,t,t);
    fill(c,y+t,50);
    ellipse(t-y,y,c,c);
  

    x=x+0.3;
  }
}




