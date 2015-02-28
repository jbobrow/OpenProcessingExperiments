
size(400,400);

void BG(){
background(255,215,0,100);
noFill();
for (int i=10; i<400; i=i+10) {
if (i<400)
{
float r=random(255);
float m=random(255);
float p=random(255);
noStroke();
fill(r,m,p,200-i);
ellipse(200,2*i,i*1.5,i*1.5);
}
}
}

int x=0;
int speed=10;
void draw(){
BG();
fill(0,0,0,x);
frameRate(10);
ellipse(x*2+220,x*4,x,x);
ellipse(-x*2+180,x*4,x,x);
x=x+speed;
if (x>=100){
x=0;
}
}

