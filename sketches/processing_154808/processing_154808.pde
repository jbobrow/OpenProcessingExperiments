
void setup(){
   size(801,801);
   rectMode(CENTER);
   background(0);
}
int bax = 1;
int po = 0;
int b = 0;
int bac = 0;

int a1 = 0;
int v1 = 1;

int a2 = 0;
int v2 = 1;

int a3 = 0;
int v3 = 1;

int a4 = 0;
int v4 = 1;

void draw(){
 background(bac);
 translate(401,401);
 beginShape();
vertex(-75, -75);
vertex(75, -75);
vertex(75, 75);
vertex(-71, 75);
endShape(CLOSE);
v1 = v1 - 1;
v2 = v2 - 1;
v3 = v3 + 1;
v4 = v4 + 1;
 
  a1 = 401 + v1;
 rect(a1,0,50,50);
 
 a2 = 401 + v2;
 rect(0,a2,50,50);
 
 a3 = -401 + v3;
 rect(a3,0,50,50);
 
 a4 = -401 + v4;
 rect(0,a4,50,50);

 if(a1 == b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v1 = 1;
}

if(a2 == b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v2 = 1;
}

if(a3 == b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v3 = 1a;
}

if(a4 == b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v4 = 1;
}
 if (keyPressed) {
    if (key == 'd' || key == 'D') {
po = 0;
    }
 }
 
 if (keyPressed) {
    if (key == 's' || key == 'S') {
po = 90;
    }
 }
 
 if (keyPressed) {
    if (key == 'a' || key == 'A') {
po = 180;
    }
 }
 
 if (keyPressed) {
    if (key == 'w' || key == 'W') {
po = 270;
    }
 }
 
rotate(radians(po));

if(mousePressed == true)
{
bax = bax + 1;
b = bax + 100;
rect(b,0,10,10);
}
else
{
bax = 0;
}

rect(100,0,100,10);
ellipse(0, 0, 100, 100);


}
