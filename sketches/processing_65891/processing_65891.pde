
int n=500;
Bolas[] b;

void setup(){
size(600,400,P2D);
colorMode (RGB, 255,255,255);
smooth();
background(255);
frameRate(15);
b=new Bolas[n];
for(int i=0;i<n;i++){
  b[i]=new Bolas(random(32,width-32),random(32,height-32),int(random(11,16)),random(0.25,2),random(0.25,2),1,1);
}
}

void draw(){
  println(int(frameCount/60));
background(0);
for(int i=0;i<b.length;i++){
b[i].dibuja();
b[i].mueve();
b[i].click();
}
}

class Bolas{
float x;
float y;
int r;
float vx=random(0.25,2);
float vy=random(0.25,2);
int dx;
int dy;
Bolas(float _x,float _y,int _r,float _vx,float _vy,int _dx,int _dy){
this.x=_x;
this.y=_y;
this.r=_r;
this.vx=_vx;
this.vy=_vy;
this.dx=_dx;
this.dy=_dy;
}
void dibuja(){
//float rand_blur = random(3,5); //Blur random 
//filter(BLUR,rand_blur);
stroke(0,0,255,125);
strokeWeight(3);
int m=int(random(255));
fill(255,0,0,125);
ellipse(x,y,r,r);
fill(255,255);
ellipse(x,y,int(r/2),int(r/2));
}

void mueve(){
x+=vx*dx;
y+=vy*dy;
if(x<r/2||x>width-r/2){
dx*=-1;
}
if(y<r/2||y>height-r/2){
dy*=-1;
}
}

void click(){
if(mousePressed){
x=random(width-33);
y=random(height-33);
}
}

}


