

float x=100;
float y=100;
float O=random(TWO_PI);
float L=15;
int a=0;
float count=1.0;
float b=0.0;
int redy=0;
int orangey=30;


void setup(){
  
  size(300,600);
  background(0);
  strokeWeight(5);
  this.draw2();
  
}

void draw(){}

void draw2(){
 for(int b = 0; b < 1000; b++){
  stroke(255,redy,0,10);
  float x2=x+L*cos(O);
  float y2=y+L*sin(O);
  
  
  line(x,y,x2,y2);
  redy=redy+1;
  if(redy>40){
  redy=0;}
  x=x2;
  y=y2;
  O=O+random(-PI/10.0,PI/10.0);
  
  if(x<0 || y<0 || y>600 ||x>300){
    x=50;
    y=100;
    O=random(TWO_PI);}
    
  }
  
 for(int b = 0; b < 1500; b++){
 stroke(255,orangey,0,20);
  float x2=x+L*cos(O);
  float y2=y+L*sin(O);
  
  line(x,y,x2,y2);
  orangey=orangey+1;
  if(orangey>115){
  orangey=30;}
  x=x2;
  y=y2;
  O=O+random(-PI/10.0,PI/10.0);
  
  if(x<0 || y<0 || y>600 ||x>300){
    x=200;
    y=250;
    O=random(TWO_PI);}
    
  }
  for(int b = 0; b < 1500; b++){
  {stroke(255,redy,0,5);
  float x2=x+L*cos(O);
  float y2=y+L*sin(O);
  
  count= count + 1.0;
  
  line(x,y,x2,y2);
  redy=redy+1;
  if(redy>20){
  redy=0;}
  x=x2;
  y=y2;
  O=O+random(-PI/10.0,PI/10.0);
  
  if(x<0 || y<0 || y>600 ||x>300){
    x=125;
    y=500;
    O=random(TWO_PI);}
 
     }
    
   }
   
}

