
int diameter = 5;

float yPos = 10;
float xPos = 10;
int x=95;
int y=95;
float r=25;
float g=89;
float b=150;
int i=0;

void setup() { // setup() runs once
size(200, 200);

noFill();
frameRate(500);
}

void draw() { // draw() loops forever, until stopped
background(b,r,g);
y=y-1;
yPos=yPos+2;
if (x<1){
x=95;
xPos=10;
}
yPos=yPos+2;
x=x-1;
xPos=xPos+2;
if (y<1)
y=95;
yPos = 25;
fill(r,g,b);
line(i,0,i,500);
i=i+1;
r=r+(244-125)/5000.0;
g=g+(184-349)/5000.0;
b=b+(245-120)/2000.0;
rect(x,y,xPos,xPos);

}



