
int y = 0;
int x = 0;
int i = 0;
int p = 0;
int b = 0;
float r = random(1);
int speed = 2;
void setup () {size(1000, 400);}
void draw () {
 background(0,191,255);
 frameRate(30);
noStroke();
fill(255,215,0,175);
ellipse(500,y,200,200);
x=x+speed;
y=y+speed;
  if((y<0)||(y>=500)||(x<0)||(x>1000))
  {
    speed = speed*-1;
  }
  
  
  {fill(255,255,255,100);
  stroke(255);
line(x,y,x,y);
line(x,y,0,0);
line(x,200,x,50);
line(x*x,y*y,200,200);
line(100,y*2,100,100);
line(x,50,x,y);
line(1000,0,2*x,2*y);
noStroke();
fill(255,0,0,100);
triangle(75,y,200,x,0,0);
fill(0,255,0,100);
triangle(0,0,0,75,x,y);
fill(0,0,255,100);
triangle(0,0,x,0,x,y);
fill(255,255,255,100);
triangle(0,y,x,y,x,0);
fill(255,0,0,150);
triangle(1000,0,500,0,x,y);
triangle(1000,400,500,400,x,y);
triangle(1000,150,1000,250,x,y);
p=p+speed;
if (p>=1100){
p=0;
}
}
  fill(46,170,87,255);
  noStroke();
ellipse(500,500,1200,400);
for(i = 0; i<300; i = i +1){
  float r = random (10);
 float m = random (1000);
  float n = random (250);
  float b = random (1000);
  float z = random (250);
  float q = random (255);
  float w = random (255);
  float e = random (255);
  noStroke();
  fill(q,w,e,5);
  ellipse(m,n,100,100);
  fill(0,191,255,5);
  ellipse(m,n,100,100);
}
}
