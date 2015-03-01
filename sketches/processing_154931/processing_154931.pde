
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

int go = 0;
int nv = 1;
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
 
  a1 = -nv + 901 + v1;
 rect(a1,0,50,50);
 
 a2 = -nv + 1101 + v2;
 rect(0,a2,50,50);
 
 a3 = nv -1301 + v3;
 rect(a3,0,50,50);
 
 a4 = nv -1501 + v4;
 rect(0,a4,50,50);

 if(a1 == b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v1 = 1;
nv = nv + 10;
}

if(a2 == b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v2 = 1;
nv = nv + 10;
}

if(a3 == b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v3 = 1;
nv = nv + 10;
}

if(a4 == b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v4 = 1;
nv = nv + 10;
}

 if(a1 + 1== b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v1 = 1;
nv = nv + 10;
}

if(a2 + 1== b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v2 = 1;
nv = nv + 10;
}

if(a3 + 1== b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v3 = 1;
nv = nv + 10;
}

if(a4 + 1== b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v4 = 1;
nv = nv + 10;
}

 if(a1 == 100)
{
v1 = 10000;
go = 10000;
}

 if(a2 == 100)
{
v2 = 10000;
go = 10000;
}

 if(a3 == -100)
{
v3 = 10000;
go = 10000;
}

 if(a4 == -100)
{
v4 = 10000;
go = 10000;
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

if(mousePressed == true)
{
  
  if(po == 0)
{
bax = bax + 1;
b = bax + 100;
rect(b,0,10,10);
}

  if(po == 90)
{
bax = bax + 1;
b = bax + 100;
rect(0,b,10,10);
}

  if(po == 180)
{
bax = bax - 1;
b = -100 + bax;
rect(b,0,10,10);
}

  if(po == 270)
{
bax = bax - 1;
b = -100 + bax;
rect(0,b,10,10);
}

}
else
{
bax = 0;
}

rotate(radians(po));

rect(100,0,100,10);
ellipse(0, 0, 100, 100);
rect(0,0,go,go);
}
