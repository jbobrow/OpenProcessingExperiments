

float x=100;
float y=100;
float O=random(TWO_PI);
float L=15;
int a=68;
float count=1.0;
float b=0.0;


void setup(){
  
  size(300,600);
  background(0);
  strokeWeight(10);
  this.draw2();
  
}

void draw(){}

void draw2(){
  for(int b = 0; b < 1500; b++){
    stroke(23,227,a,20);
    float x2=x+L*cos(O);
    float y2=y+L*sin(O);
  
  
    line(x,y,x2,y2);
    a=a+1;
    if(a>143){
      a=68;
    }
    x=x2;
    y=y2;
    O=O+random(-PI/1.0,PI/1.0);
  
    if(x<0 || y<0 || y>600||x>300){
      x=100;
      y=100;
      O=random(TWO_PI);}
    }
  
    for(int b = 0; b < 1500; b++){
      stroke(23,227,a,20);
      float x2=x+L*cos(O);
      float y2=y+L*sin(O);
  
      line(x,y,x2,y2);
      a=a+1;
  
      if(a>143){
        a=0;
      }
      x=x2;
      y=y2;
      O=O+random(-PI/1.0,PI/1.0);
  
      if(x<0 || y<0 || y>600 ||x>300){
        x=150;
        y=400;
        O=random(TWO_PI);}
      }
  
      for(int b = 0; b < 1500; b++){
        stroke(23,227,a,20);
        float x2=x+L*cos(O);
        float y2=y+L*sin(O);
  
        count= count + 1.0;
  
        line(x,y,x2,y2);
        a=a+1;
        if(a>255){
          a=0;
        }
        x=x2;
        y=y2;
        O=O+random(-PI/1.0,PI/1.0);
  
        if(x<0 || y<0 || y>600 ||x>300){
          x=350;
          y=200;
          O=random(TWO_PI);
        }
      }
      
    }
    

