
float x=10;
float y=10;
int i=0;
float speed=0;
float gravity=0.1;
float[]xcord=new float[10];
float[]ycord=new float[10];
float movement=5;


void setup(){
  background(0);
  rectMode(CENTER);
  size(500,500);
  frameRate(30);
  smooth();
 
  for(i=0; i<10; i++){
xcord[i]=x;
ycord[i]=y;
x=x+20;
y=y+20;
  }
}

void draw(){
  for(i=0; i<10; i++){
    rect(xcord[i]*noise(movement+30), ycord[i]*noise(movement+50), 16, 16);
  }
  
  int i;
  for(i=0; i<10; i++){
    rect(xcord[i], ycord[i], 16, 16);
    fill(#2872BF);
    translate(xcord[i], ycord[i]);
    rotate(20*noise(movement+20));
    xcord[i]=x*noise(movement);
    ycord[i]=y*noise(movement);
    movement=movement+0.02;
  }
}
  


