
int x=250;
int y=250;
int speedX=4;
int speedY=4;

void setup(){
  size(600,500);
  smooth();
}

void draw(){
  fill(0,20);//alpha channel is the key to get motion blur effect! Try different value.
  rect(0,0,width,height);
  x=x+speedX;
  y=y+speedY;
  if ((x+16>width) || (x-16<0)){
    speedX=speedX*-1;
  }
  if ((y+16>height) || (y-16<0)){
    speedY=speedY*-1;
  }
  
  noStroke();
  fill(255);
  ellipse(x,y,32,32);
}

