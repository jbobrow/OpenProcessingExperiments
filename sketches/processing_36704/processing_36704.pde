
void setup(){
  size(700,700);
  smooth();
}

float x=200;
float y=100;
float xm=1;
float ym=0;
float g=.3;
float xf;
float yf;
float mpx;
float mpy;
float mrx;
float mry;
float timer=0;

void draw(){
  translate(0,-height/2);
  stroke(153);
  fill(0,50);
rectMode(CENTER);
rect(width/2,height/2,width*5,height*5);
fill(255);
    line(0,height,width,height);
  noStroke();
  xf=xm/500;
  yf=ym/500;
  xm=xm-xf;
  ym=ym-yf;
  
  x=x+xm;
  y=y+ym;
  ym=ym+g;
  
  ellipse(x,y,40,40);
  ellipse(x,-y+height*2,40,40);
  
 if(x>width-20){
   xm=-xm;
 }
 if(x<20){
   xm=-xm;
 }
 if(y>height-20){
   ym=-ym;
 }
 
 if(mousePressed){
   timer=timer+1;
 }
 if(timer==0){
   mpx=mouseX;
   mpy=mouseY;
 }
 println(mpx);
 println(mpy);
 println(mrx);
 println(mry);
 }
 
 void mouseReleased(){
   mrx=mouseX;
   mry=mouseY;
   xm=xm+(mpx-mrx)/15;
   ym=ym+(mpy-mry)/15;
 }

