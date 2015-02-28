
float x=100;
float y=0;
float speed=0;
float gravity=0.1;
float g=.5;
float g1=.45;
float g2=.4;
float g3=.35;
float g4=.3;
float g5=.55;
float g6=.28;
float g7=.26;
float g8=.47;
float s=1;
float s1=1.5;
float s2=0.5;
float s3=1.1;
float s4=0.8;
float s5=1.7;
float s6=0.3;
float s7=0.45;
float s8=0.15;
float s9=1.6;
float a=30;
float b=20;
float c=13;
float d=5;
float e=25;
float f=9;
float h=18;
float i=23;
float j=28;
float k=15;


void setup(){
  size(400,700);
}
void draw(){
  background(#FFD073);
  fill(0);
  noStroke();
  rectMode(CENTER);
  ellipse(x,y,30,30);
  y=y+speed;
  speed=speed+gravity;
  if(y>height){
    speed=speed*-.95;
  }
  fill(#FF4040);
  ellipse(250,b,20,20);
  b=b+s;
  s=s+g;
  if(b>height){
    s=s*-.95;
  }
fill(#006363);
ellipse(10,a,30,30);
a=a+s1;
s1=s1+gravity;
if(a>height){
  s1=s1*-.95;
}
fill(#FF0000);
ellipse(350,c,30,30);
c=c+s2;
s2=s2+g1;
if(c>height){
  s2=s2*-.95;
}

fill(#A66F00);
ellipse(2,d,13,13);
d=d+s3;
s3=s3+g2;
if(d>height){
  s3=s3*-.95;
}
fill(#FFAA00);
ellipse(200,e,35,35);
e=e+s4;
s4=s4+g3;
if(e>height){
  s4=s4*-.95;
}
fill(#A60000);
ellipse(190,f,28,28);
f=f+s5;
s5=s5+g4;
if(f>height){
  s5=s5*-.95;
}
fill(#BF3030,100);
ellipse(80,h,19,19);
h=h+s6;
s6=s6+g5;
if(h>height){
  s6=s6*-.95;
}
fill(#33CCCC);
ellipse(390,i,19,19);
i=i+s7;
s7=s7+g6;
if(i>height){
 s7=s7*-.95;
}
fill(#1D7373,100);
ellipse(195,j,15,15);
j=j+s8;
s8=s8+g7;
if(j>height){
 s8=s8*-.95;
}
fill(#FFBF40,200);
ellipse(330,k,23,23);
k=k+s9;
s9=s9+g8;
if(k>height){
 s9=s9*-.95;
}
}



