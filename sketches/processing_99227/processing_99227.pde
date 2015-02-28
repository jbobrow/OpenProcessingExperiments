
void setup(){
size(400,400);
background(255,228,225,150);
}
int x = 0;
int y = 0;
void draw(){
int l = random(-50,50);
int w = random(-50,50);
float x1 = random(0,400);
float r1 = random(0,255);
float r2 = random(0,255);
float r3 = random(0,255);
float r4 = random(0,255);
noStroke();
fill(r1, r2, r3, r4);
frameRate(30);
ellipse(200,200,x,y);
x=x+l;
y=y+w;
if((x>400)||(y>400)){
x=100;
y=100;
}
if((x<=0)||(y<=0)){
x=100;
y=100;
}
}
