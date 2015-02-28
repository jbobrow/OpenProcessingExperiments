
void setup(){
size (400,400)
}
int x=200;
int y=200;
//int speed=10;
void draw(){
background(0);
fill(255);
ellipse(200,200,400,400);
int speedx = random(-25,25);
int speedy = random(-25,25);
float x1 = random(0,400);
float r1 = random(0,255);
float r2 = random(0,255);
float r3 = random(0,255);
float r4 = random(0,255);
fill(r1, r2, r3, r4);
frameRate(15);
ellipse(x,y,15,15);
x=x+speedx;
y=y+speedy;
if ((x<0)||(x>=400)||(y<0)||(y>=400)){
x=200;
y=200; 
}
}
