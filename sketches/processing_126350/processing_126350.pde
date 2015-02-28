
float m = 5; //mass
float b = 0; //fluid resistance constant
float g = 9.8; //acceleration due to gravity
float a = 0; //initial acceleration value
float v = 10; // initial y velocity (downwards is positive)
float y = 0; //initial y-position
float k = 0; //spring constant
 
 
int oldY = 0;
float dt = 0.05; //time-step - DO NOT CHANGE!


boolean spring = false;
boolean damp = false;

int xs = 50;
int ys = 315;
int ws = 100;
int hs = 75;

int xd = 450;
int yd = 315;
int wd = 100;
int hd = 75;

int xblock = 200;
int wblock = 200;
int hblock = 100;

float xspring = 200;
float yspring = 0;
float wspring =200;
float hspring =0;
float xdamp = 200;
float ydamp = 0;
float wdamp = 200;
float hdamp = 0;


void setup(){
   
size(600,400);
background(0);
smooth();
 
}
 
void draw(){
  background(255);
  fill(100);
  textSize(32);
  text("Spring",50,300);
  text("Dampener",420,300);
  noStroke();
 
 
 int vy = mouseY - oldY;
  if(mousePressed && (spring)){
    y = 20;
    v = v;
   
  } else if (mousePressed && (damp)){
    y = height/2-50;
    v=80;
    g=0;
  } else {
    y=y;
    v=v;
  }
//background(255);
a = (g - (b/m)*v-(k/m)*(y-200));
v = v + a*dt;
y = y + v*dt;

wspring = 200 -y/2;
wdamp = 200 - wspring;

hspring = y;
hdamp = y;

fill(171,171,171);
rect(xblock,y,wblock,hblock);

if (damp){

 xspring = 200;

} else {
 
  xspring = 300-wspring/2;
}

if (spring){
  xdamp= xspring+wspring;
  
} else {
  xdamp = 300-wdamp/2;
}

if (spring){
fill(250,160,199);
rect(xspring,yspring,wspring,hspring);
}

if (damp){
  fill(139,195,238);
  rect(xdamp,ydamp,wdamp,hdamp);
}

//} else if ((spring) && (damp)){
//  rect(height/2-100,0,200-y/2,y);
//
//} else {
//}

  if (spring) {
    k=15;
    fill(114,250,123);
    
  } else {
   k=0;
  fill(253,79,79);
  }
  rect(xs,ys,ws,hs);
  
   if (damp) {
    b=1.5;
    fill(114,250,123);
  } else {
   b=0;
  fill(253,79,79);
  }
 
  

  rect(xd,yd,wd,hd);
  
}

void mousePressed() {
  if (mouseX > xs && mouseX < xs+ws && mouseY > ys && mouseY < ys+hs) {
    spring = !spring;
  }
 if (mouseX > xd && mouseX < xd+wd && mouseY > yd && mouseY < yd+hd) {
    damp = !damp;   
  }  
  }

