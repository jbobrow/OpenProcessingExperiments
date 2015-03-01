
void setup(){
   size(801,801);
   rectMode(CENTER);
   background(0);
}
int bax = 1;
int po = 0;
int v = 0;
int l = 1;
int a = 0;
int b = 0;
int c = 0;
int t = 1;
int bac = 0;
void draw(){
 background(bac); 
 translate(401,401);
 v = l + t;
 l = l + 1;
 a = 801 - v;
 rect(a,0,50,50);
 
 rect(0,a,50,50);
 
 rect(-a,0,50,50);
 
 rect(0,-a,50,50);

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
b = bax +100;
rect(b,0,10,10);
}
else
{
bax = 0;
}
rect(100,0,100,10);
ellipse(0, 0, 100, 100);

if(a == b)
{
rect(0,0,1000,1000);
l = 1;
t = t + 1;
bac = bac + 50;
}

}
