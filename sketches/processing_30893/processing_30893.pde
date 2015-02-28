
float x,y,r,_x,_y,_r;
int s,_s;
obj[] i = new obj[6];
void setup(){
size(450,450);
x=200;
y=200;
s=2;
r=30;
_s=2;
_r=20;
mouseX=150;
mouseY=100;
for(int lop=0; lop< i.length; lop++){
i[lop]= new obj(random(20,width-20),random(20,height-20), random(5,20),1);
}
}

void draw(){
background(255);
for(int lop=0; lop< i.length; lop++){
i[lop].update();
float d=dist(i[lop].x,i[lop].y,mouseX,mouseY);
if(d  <(r+_r)+4 && d > _r+r)  {
s*=-1;
_s*=-1;
}
}
_x=mouseX;
_y=mouseY;
stroke(0);
fill(255,0,0,10);
//ellipse(x,y,r*2,r*2);
r+=s;
if(r<2 || r>400) s*=-1;
if(x+r > width || x-r <0) s*=-1; 
if(y+r > height || y-r <0) s*=-1
fill(0,0,255,10);
//ellipse(_x,_y,_r*2,_r*2);
//_r+=_s;
//if(_r<2 ||_r>400) _s*=-1;
//if(_x+_r > width || _x-_r <0) _s*=-1; 
//if(_y+_r > height || _y-_r <0) _s*=-1;

float d=dist(x,y,mouseX,mouseY);
if(d  <(r+_r)+4 && d > _r+r)  {
s*=-1;
_s*=-1;
}
}                   

class obj{
float x,y,r,s;
obj(xp, yp,R,S){
r=R;
x=xp;
y=yp;
s=S;
}
void update(){
fill(0,255,0,10);
ellipse(x,y,r*2,r*2);
r+=s;
if(r<2 ||r>400) s*=-1;
if(x+r > width || x-r <0) s*=-1; 
if(y+r > height || y-r <0) s*=-1;
}
}                                                                                                                                           
