
float x=100;
float y=100;
float O=random(TWO_PI);
float L=15;
int a=0;
float count=1.0;
float b=0.0;
float greeny=54;


void setup(){
  
  size(300,600);
  background(0);
  strokeWeight(5);
  this.draw2();
  
}

void draw(){}

void draw2(){
  for(int b = 0; b < 5000; b++){
    stroke(255,a,0,20);
    float x2=x+L*cos(O);
    float y2=y+L*sin(O);
  
  
    line(x,y,x2,y2);
    a=a+1;
    if(a>20){
      a=0;
    }
    x=x2;
    y=y2;
    O=O+random(-PI/10.0,PI/10.0);
  
    if(x<0 || y<0 || y>800 ||x>400){
      x=width/2;
      y=height/2;
      O=random(TWO_PI);}
    }
    
}

