
int x=0;
int y=0;
int my=3;
int mx=3;
int P2Y=200;

int p1Score=0;
int p2Score=0;

void setup() {
size(600, 400);
}
void draw() {
background(0);
stroke(#0EEADA);
noFill();
rect(-1, 20, 602, 360);
line(300, 0, 300, 400);
ellipse(300, 200, 150, 150);
ellipse(x, y, 10, 10);

paddle(50,mouseY);
paddle(width-50,P2Y);

fill(255);
textSize(20);
text(p1Score, width+150, 20);
text(p2Score, width-150, 20);

x+=mx;
y+=my;
if (y>height || y<0) {
my *= -1;
}
if (x>width || x<0) {
mx*= -1;
}
//hit test!
if (abs(x-25)<40 && abs(y-mouseY)<40) {
mx=abs(mx);
}
//hit test for second paddle:
if (abs(x-575)<40&&abs(y-P2Y)<40) {
mx=-abs(mx);
}
if (x<0) {
mx +=-1;
x=width/2;
y=height/2;
p1Score += 100;
}
if (x>width) {
mx +=-1;
x=width/2;
y=height/2;
p2Score += 100;
}
}

//paddle
void paddle(int x, int y) {
rectMode(CENTER);
fill(#0EEADA);
rect(x, y, 10, 40);
}

void drawBackground() {
line(0, 200, 0, 400);
}


//note add if(keyPressed){

void keyPressed() {
if (key=='w') {
P2Y=P2Y-15;
}


if (key=='s') {
P2Y=P2Y+15;
}
}
