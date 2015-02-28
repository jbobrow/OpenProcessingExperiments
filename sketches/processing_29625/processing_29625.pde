
Kc [] kcs = new Kc [250];
 
void setup () {
size (500, 500);
 
for (int i=0; i <kcs.length; i++) {
int m = 2*i; // radius of the circle
float t = 0.003*i;

int r =int(random(0,255));
int g = int(random(0,255)); 
int b = int(random(0,255)); 
fill (r,g,b);
kcs[i] = new Kc (m, m, 50, r,g,b);
}
}
 
void draw () {
background (0);
for (int i = 0; i < kcs.length; i++) {
kcs[i].move();
}
}
 
class Kc {
 
float a; 
int m; 
float t;
int r;
int g;
int b;


Kc (float tempA, int tempM,float tempT, int tempR, int tempG, int tempB) {
a = tempA;
m = tempM;
t = tempT;
r= tempR;
g = tempG;
b = tempB;
}
 

 
void move () {
  frameRate(10);
int r =int(random(0,255));
int g = int(random(0,255)); 
int b = int(random(0,255)); 
fill (r,g,b);
noStroke();
ellipse (width/2 + sin(a)*m, height/2 + cos(a)*m,m/4,m/4);

a += t;
 

}
}



