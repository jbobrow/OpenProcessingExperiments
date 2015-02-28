
int x;
int y;
int r=20;
int vx=6;
int vy=6;

void setup(){
size(600,600);
smooth();
x=int(random(0,width));
y=int(random(0,height));
}

void draw(){
background(0);
ellipse(x,y,r,r);
x=x+vx;
y=y+vy;

if((x>width-r/2)||(x<0+r/2)){
 vx=-vx;

}else{
  
if((y>height-r/2)||(y<0+r/2)){
  vy=-vy;
}
}
}
