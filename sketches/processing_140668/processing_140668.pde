
float x1=0;
float speed1=0; 
float y1=0;

float x2=0;
float speed2=0;
float y2=0;

float x3=250;
float speed3=0;
float y3=800;

float x4=800;
float speed4=0;
float y4=0;

float x5=550;
float speed5=0;
float y5=0;

float a=0;
float b=0.3;

float c=0;
float d=0.9;
void setup(){
  size(600,400);
  
}

void draw(){
  background(42,52,64);
  smooth();
 
 //rect
  a=a+b;
if (a>80||a<0){
  b=b*-1;}
  fill(130);
  rectMode(CENTER);
  rect(100,100,a,a);
  
  //rect 2
  c=c+d;
if (c>150||c<0){
  d=d*-1;}
  fill(180);
  rectMode(CENTER);
  rect(430,250,c,c);
  
  
  //circle 1
  if(150+x1<=250){
   speed1=speed1+0.1;
  }
    else
    {
      speed1=speed1-0.03;
    }
    x1=x1+speed1;  
    y1=1.5*x1;
  fill(232,224,124,180);
  ellipse(x1,-150+y1,100,100);
  
  //circle 2
  if(100+x2<=250){
   speed2=speed2+0.1;
  }
    else
    {
      speed2=speed2-0.03;
    }
    x2=x2+speed2;  
    y2=-0.667*x2;
  fill(133,179,163,180);
  ellipse(-50+x2,383.33+y2,90,90);
  
  //circle 3
    if(y3>250){
   speed3=speed3+0.05;
  }
    else
    {
      speed3=speed3-0.1;
    }
    y3=y3-speed3;
  fill(243,95,93,180);
  ellipse(250,y3,120,120);
  
  //circle 4
  if(x4<=250){
   speed4=speed4+0.1;
  }
    else
    {
      speed4=speed4-0.05;
    }
    x4=x4+speed4;  
    y4=-0.04*x4;
  fill(244,173,166,180);
  ellipse(x4,118+y4,100,100);
  
  //circle 5
  if(x5>360){
   speed5=speed5+0.25;
  }
    else
    {
      speed5=speed5-0.06;
    }
    x5=x5-speed5;  
    y5=0.5667*x5;
  fill(243,235,186,180);
  ellipse(650+x5,400+y5,70,70);
  
  
  

}
 


