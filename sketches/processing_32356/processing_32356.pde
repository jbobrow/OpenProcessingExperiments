


float x=100;
float y=100;
float O=random(TWO_PI);
float L=15;
int a=0;
float count=1.0;
float b=0.0;
int greeny=54;
int purple=0;


void setup(){
  
  size(300,600);
  background(0);
  strokeWeight(5);
  this.draw2();
  
}

void draw(){}

void draw2(){
  for(int b = 0; b < 4000; b++){
    stroke(a,129,255,20);
    float x2=x+L*cos(O);
    float y2=y+L*sin(O);
  
  
    line(x,y,x2,y2);
    a=a+1;
    if(a>255){
      a=0;
    }
    x=x2;
    y=y2;
    O=O+random(-PI/10.0,PI/10.0);
  
    if(x<0 || y<0 || y>800 ||x>400){
      x=225;
      y=500;
      O=random(TWO_PI);}
    }
    
    for(int b = 0; b < 1500; b++){
    stroke(a,129,255,20);
    float x2=x+L*cos(O);
    float y2=y+L*sin(O);
  
  
    line(x,y,x2,y2);
    a=a+1;
    if(a>255){
      a=0;
    }
    x=x2;
    y=y2;
    O=O+random(-PI/10.0,PI/10.0);
  
    if(x<0 || y<0 || y>800 ||x>400){
      x=255;
      y=250;
      O=random(TWO_PI);}
    }
        
      for(int b = 0; b < 2000; b++){
      stroke(a,129,255,50);
      float x2=x+L*cos(O);
      float y2=y+L*sin(O);
  
      line(x,y,x2,y2);
      a=a+1;
  
      if(a>255){
        a=0;
      }
      x=x2;
      y=y2;
      O=O+random(-PI/10.0,PI/10.0);
  
      if(x<0 || y<0 || y>800 ||x>400){
        x=100;
        y=450;
        O=random(TWO_PI);}
      }  
           
      for(int b = 0; b < 3000; b++){
      stroke(35,200,greeny,100);
      float x2=x+L*cos(O);
      float y2=y+L*sin(O);
  
      line(x,y,x2,y2);
      greeny=greeny+1;
  
      if(greeny>175){
        greeny=54;
      }
      x=x2;
      y=y2;
      O=O+random(-PI/10.0,PI/10.0);
  
      if(x<0 || y<0 || y>800 ||x>400){
        x=200;
        y=250;
        O=random(TWO_PI);}
      }
      
           
      for(int b = 0; b < 2000; b++){
      stroke(35,200,greeny,100);
      float x2=x+L*cos(O);
      float y2=y+L*sin(O);
  
      line(x,y,x2,y2);
      greeny=greeny+1;
  
      if(greeny>175){
        greeny=54;
      }
      x=x2;
      y=y2;
      O=O+random(-PI/10.0,PI/10.0);
  
      if(x<0 || y<0 || y>800 ||x>400){
        x=250;
        y=500;
        O=random(TWO_PI);}
      }
      
  
      for(int b = 0; b < 2000; b++){
        stroke(150,purple,222,50);
        float x2=x+L*cos(O);
        float y2=y+L*sin(O);
  
        count= count + 1.0;
  
        line(x,y,x2,y2);
        purple=purple+1;
        if(purple>100){
          purple=0;
        }
        x=x2;
        y=y2;
        O=O+random(-PI/10.0,PI/10.0);
  
        if(x<0 || y<0 || y>800 ||x>400){
          x=50;
          y=100;
          O=random(TWO_PI);
          filter(BLUR);
        }
      }
    
    }

