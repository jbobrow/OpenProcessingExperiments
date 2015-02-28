
float a=0,y;
void setup(){size(600,600,P3D);strokeWeight(3);stroke(155,114,0,30);fill(61,56,0,200);}
void draw(){translate(300+500*cos(a)+60*cos(a/2), y=100+a*15,y-400);rotateZ(-cos(a+sin(a/9))*(2.5+sin(a/19)));box(100+a);a+=.005;}


