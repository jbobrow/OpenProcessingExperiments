

float curvefitting = .003;
int w = 20;
int h = 10;
float x = 1;
int y;
int dir;
float varTaille=1;
void setup(){
  size(400,400);
  smooth();
  strokeWeight(2);
  background(255);
  y=height/2;
  dir=1;
  frameRate(30);
}
void draw(){
  background(255);
  if(x>=width-w){ dir = -1;}
  if(x>=0&&x<1){ dir = 1;} 
  print("x="+x+"\n");
  if(dir==1){
  stroke(0);
  fill(255,255,random(255));
  x*=1.1;
  varTaille*=1.1;
  //ellipse(x,y,varTaille+x/1.1,varTaille);
  rect(x+height/2,y,w,h);
  rect(y,x,h,w);
  }
  else {
    varTaille=1;
    x=x/1.01;
    rect(x,y,w,h);
    rect(y,x,h,w);
  }
for(int i=0;i<1;i++){
  curve(y,x,x*x,y*y,y/1.5+i,x/1.5-i,y,x);
  curve(x,y,y*y,x*x,cos(y/1.5+i),x/1.5-i,x,y);
  noFill();
  curve(x,y,0,height/2,width,height/100,cos(y*2),-x*cos(x*varTaille));
  ellipse(100,100,50,50);
}
}

