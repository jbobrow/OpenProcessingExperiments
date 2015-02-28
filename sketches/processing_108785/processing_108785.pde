
void setup(){
size(400,400);
background(23,52,3);
rectMode(CORNERS);
gradientBox();
name();
}
void gradientBox(){
fill(46,162,15);
int w=10, x=10, y=390,z=390,a=0,b= 215,c= 255;
rect(w,x,y,z);
while(y!=300){
  a+=3;
  b-=3;
  c-=3;
  w+=2;
  y-=2;
  x+=3;
  z-=3;
  stroke(a,b,c);
  rect(w,x,y,z);
}
}
void name(){
//m
stroke(17,100,5);
strokeWeight(10);
line(110,160,110,240);
line(110,160,140,240);
line(170,160,140,240);
line(170, 160, 170,240);
//A
stroke(247,228,7);
line(180, 240, 210, 160);
line(240, 240, 210, 160);
line(195, 215, 230, 215);
//X
stroke(144, 10, 131);
line(250, 160, 290, 240);
line(250, 240, 290, 160); 
}


