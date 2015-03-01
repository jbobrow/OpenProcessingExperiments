
float a,b,c,d,e,f,g;
float x;
float i,j,k,l,m,n;
float o;

float r=20;
float h=12;
float p=3;
float t=10;

void setup(){

  size(500,500);
  background(0);
 // strokeWeight(7);
}
void draw(){
  background(0);
  for(float x=1; x<500; x+=.5){
  b=x-1;
  if(key=='p'){}else{
  a=5*h*sin(x*PI/(r+p)+o);
  b=5*h*sin(x*PI/r);
  }
//  c=5*h*sin(x*PI/5);
//  d=5*h*sin(x*PI/4);
//  e=5*h*sin(x*PI/3);
//  f=5*h*sin(x*PI/2);
//  g=5*h*sin(x*PI/1);
  
//  i=250+c+d+e+f;
  j=250+a+b;
  k=5*h+a;
  l=500-5*h+b;
//  stroke(255,0,0);
//  strokeWeight(.3);
 // line(x,k,x,l);
//  strokeWeight(1);
  //point(x,i);
  
  stroke(0,255,0);
  point(x,j);
  stroke(0,0,255);
  point(x,k);
  stroke(0,255,255);
  point(x,l);
  fill(255);
  }
  text("the increase of an angle (q,w)             "+r,10,20);
  text("the change of the angle (a,s)               "+p,10,40);
  text("the speed of the changing angle (z,x)  "+t,10,60);
  text("the height of wave (g,h)                     "+h,10,80);
  
  o+=t*PI/180;
  
}
void keyPressed(){
 // background(0);
  if(key=='q'){
    r--;
  }
  if(key=='w'){
    r++;
  }
  if(key=='g'){
    h--;
  }
  if(key=='h'){
    h++;
  }
  if(key=='a'){
    p--;
  }
  if(key=='s'){
    p++;
  }
  if(key=='z'){
    t--;
  }
  if(key=='x'){
    t++;
  }
}
