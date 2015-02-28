
import controlP5.*;



ControlP5 myControlX;  //// attractor point X position control
ControlP5 myControlY;  //// attractor point Y position control 
ControlP5 myControlS;  //// division constant for distance control


public float X;
public float Y;
public float S;
public float a;

void setup(){
size(600,600);
smooth();

myControlX = new ControlP5(this);    ///  X position slider

Slider X  = myControlX.addSlider("X",0,400,0,width-150,height-80,100,10);


myControlY = new ControlP5(this);    ///  Y position slider

Slider Y  = myControlY.addSlider("Y",0,500,0,width-150,height-60,100,10);

myControlS = new ControlP5(this);    ///  S size slider


Slider S  = myControlS.addSlider("S",0,100,0,width-150,height-40,100,10);

}

void draw(){
background(0);

fill(255,0,120);
for(int i = 4;i<40;i +=1){
for(int j = 2;j<60;j+=1){
a = dist(i*10,j*10,X,Y)/S;  
  ellipse(i*10,j*10,a,a);

}
}

  
}

