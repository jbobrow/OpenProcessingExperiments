
import processing.pdf.*;


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
      x=100;
      y=100;
      O=random(TWO_PI);}
    }
  
    for(int b = 0; b < 3500; b++){
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
        x=50;
        y=550;
        O=random(TWO_PI);}
      }
      
      for(int b = 0; b < 3000; b++){
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
        x=275;
        y=170;
        O=random(TWO_PI);}
      }
      for(int b = 0; b < 3000; b++){
      stroke(35,200,greeny,50);
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
        x=450;
        y=575;
        O=random(TWO_PI);}
      }
      
  
      for(int b = 0; b < 4500; b++){
        stroke(35,200,greeny,50);
        float x2=x+L*cos(O);
        float y2=y+L*sin(O);
  
        count= count + 1.0;
  
        line(x,y,x2,y2);
        greeny=greeny+1;
        if(greeny>179){
          greeny=54;
        }
        x=x2;
        y=y2;
        O=O+random(-PI/10.0,PI/10.0);
  
        if(x<0 || y<0 || y>800 ||x>400){
          x=125;
          y=350;
          O=random(TWO_PI);
           filter(BLUR);
        }
      }
    
    }

