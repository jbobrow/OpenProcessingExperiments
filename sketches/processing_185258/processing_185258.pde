
int x,y;
float xIntheBox;
float yIntheBox;

void setup(){
  size(640,480);
}
void draw(){
  background(255);
  fill(255,0,0);
  //map(value,start1,stopo1,start2,stop2);
  x=width;
  y=height;
 
  xIntheBox=map(x,0,639,144,360);
  yIntheBox=map(y,0,479,108,108+150);
  println(frameRate);
  ellipse(xIntheBox,yIntheBox,20,20);
 noFill();
  rect(144,108,216,150);
  
}
