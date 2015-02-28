

float x=100;
float y=100;
float O=random(TWO_PI);
float L=15;
int a=141;
float count=1.0;
float b=0.0;


void setup(){
  
  size(300,600);
  background(0);
  strokeWeight(5);
  this.draw2();
  
}

void draw(){}

void draw2(){
  for(int b = 0; b < 10000; b++){
    stroke(a,227,23,8);
    float x2=x+L*cos(O);
    float y2=y+L*sin(O);
  
  
    line(x,y,x2,y2);
    a=a+1;
    if(a>202){
      a=141;
    }
    x=x2;
    y=y2;
    O=O+random(-PI/5.0,PI/5.0);
  
    if(x<0 || y<0 || y>600 ||x>300){
      x=50;
      y=50;
      O=random(TWO_PI);}
    }
  
}
    

