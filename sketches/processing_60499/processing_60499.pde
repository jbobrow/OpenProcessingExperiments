
PImage myType;
int a,b;
float vy, vx, x, y, frictiony,frictionx,gravity;
int value = 20;
int mode=0;

void setup(){
  //myType = loadImage("game.gif");
  size(800,600);
  vy=0;
  vx=2;
  x=0;
  y=0;
mode=0;
 frictiony=-.6;
 frictionx=.998;
 gravity=.04;
  if(x>750 && y<100) {
 fill(0);

 }else{
   fill(0,0,600);
 }
 rect(750,500,130,100);
}
void draw(){
  background(255);
 if(mode < 1){
    startScreen();
  } else{ //if (mode == 1) {
    //fun();

     
  fun();
 }
}



void mouseReleased(){
 vy -= 3;
mode = 10;
}


void startScreen(){
  background(255,0,0);
 // myType.get(a,b);
}



void fun(){  vy += gravity;
  vx *= frictionx;
  x += vx;
  y += vy;
  if(y> height){
    y=height;
    vy*= frictiony;
 
  }
    ellipse(x,y,random(20),random(20));
rect(750,400,50,50);
if(x>750 && y>400){
  fill(0,250,0);
}
}


 

