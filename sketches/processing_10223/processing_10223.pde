
int x=20;
int y=20;
int r=255;
int v=0;
int w=0;
int h=0;

void setup(){
size(200,200);
background(0);
smooth();
noStroke();}

 void draw(){
int mod = v%2;
if (mod==0){w+=35;h+=35;} else {w+=25;h+=25;}
   fill(r,0,0);
   ellipse(x,y,w,h);
  x+=40;
if (x>180){
  x=20;
  y+=40;
  if (y>180){
    y=20;}}
    r-=5; 
if (r<0){
  r=255;}
  v+=1;
w=0;
h=0;
}


