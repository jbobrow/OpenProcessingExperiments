
int x=0;
int speed=8;
int y=150;
int j=8;
void setup(){
  size(500,800);
  noStroke();
  smooth();
  fill(150,0,0);
}
void draw(){
  background(255);
  frameRate(30);
  fill(0);
  for(int t=50;t<255;t=t+40){
  fill(t,t/2,t);
  ellipse(y,x,20,20);
  x=x+speed;
  y=y+j;
  if((x<0)||(x>=800)){
    speed=speed*-1;
  }
  if((y<0)||(y>=500)){
    j=j*-1;
  }
}
  
}
