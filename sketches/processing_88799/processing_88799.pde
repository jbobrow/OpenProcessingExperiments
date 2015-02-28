
//easing

color[] bh={#003056,#04518c,#00a1d9,#47d9bf,#f2d03b};

int W =600;
int H =600;

int d=50;

float x1= random(W);
float y1= random(H);
float e1= .07;

float x2= random(W);
float y2= random(H);
float e2= .05;

float x3= random(W);
float y3= random(H);
float e3= .03;

float x4= random(W);
float y4= random(H);
float e4= .01;

void setup(){
size(W,H);
smooth();
noCursor();


}

void draw(){
background(bh[0]);
  // cursor
stroke(#FFFFFF);
strokeWeight(5);
fill(bh[0]);
ellipse(mouseX,mouseY,d,d);

noStroke();
fill(bh[1]);
ellipse(x1,y1,d-10,d-10);
x1 +=(mouseX-x1)*e1;
y1+=(mouseY-y1)*e1;

noStroke();
fill(bh[2]);
ellipse(x2,y2,d-20,d-20);
x2 +=(mouseX-x2)*e2;
y2+=(mouseY-y2)*e2;

noStroke();
fill(bh[3]);
ellipse(x3,y3,d-30,d-30);
x3 +=(mouseX-x3)*e3;
y3+=(mouseY-y3)*e3;

noStroke();
fill(bh[4]);
ellipse(x4,y4,d-40,d-40);
x4 +=(mouseX-x4)*e4;
y4+=(mouseY-y4)*e4;
}
