
float h=0;
float w=0;
float speed=2.2;
int state=0;
PImage teal;
PImage turq;
PImage purp;
PImage dblue;
PImage ble;
PImage back;
PImage dp;
PImage bl;



void setup() {
  size(500, 1300);
  //background(255);
  teal=loadImage("teal.png");
  turq=loadImage("turq.png");
  purp=loadImage("purp.png");
  dblue=loadImage("dblue.png");
  ble=loadImage("ble.png");
  back=loadImage("back.png");
  dp=loadImage("dp.png");
  bl=loadImage("bl.png");
  
  
 
}


void draw(){
  background(255);
 state=0;
 tint(255,200);
 image(teal,175,0,150,h);
 image(turq,133,0,42,h);
 image(turq,325,0,42,h);
 image(purp,367,0,10,h);
 image(purp,123,0,10,h);
 image(dblue,377,0,25,h);
 image(dblue,98,0,25,h);
 image(dp,73,0,25,h);
 image(dp,402,0,25,h);
 image(back,418,0,40,h);
 image(back,43,0,40,h);
 image(ble,35,0,8,h);
 image(ble,458,0,8,h);
 image(bl,466,0,12,h);
 image(bl,23,0,12,h);
 image(turq,0,0,23,h);
 image(turq,478,0,23,h);
  if(state==0){
    h=h+speed;
if(mousePressed){
  w=w+speed;
  
image(turq,w,0,500,23);
image(bl,w,23,500,12);
image(ble,w,35,500,8);
image(back,w,43,500,40);
image(dp,w,83,500,25);
image(dblue,w,108,500,25);
image(purp,w,133,500,10);
image(turq,w,143,500,42);
image(teal,w,185,500,150);
image(turq,w,335,500,42);
image(purp,w,377,500,10);
image(dblue,w,387,500,25);
image(dp,w,412,500,25);
image(back,w,437,500,40);
image(ble,w,477,500,8);
image(bl,w,485,500,12);
image(turq,w,497,500,23);


image(teal,w,1150,500,65);
image(turq,w,1108,500,42);
image(purp,w,1098,500,10);
image(dblue,w,1073,500,25);
image(dp,w,1048,500,25);
image(back,w,1008,500,40);
image(ble,w,1000,500,8);
image(bl,w,988,500,12);
image(turq,w,965,500,23);
}
if(w>width){
  w=0;
  
}
}
}


