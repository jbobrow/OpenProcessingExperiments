
int x=1;
int speed=3;
int y=10;
void setup(){
size(400,400);
smooth();
fill(132,112,255);
noStroke();
}
void draw(){
background(255,185,15);
frameRate(30);
triangle(x,width/2,150,150, y,y);
x=x+speed;
if (x>width||x<0){
  speed=-1*speed;
}
}


