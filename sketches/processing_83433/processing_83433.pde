
int radius=80;
//inicio
float x=110; 
float speed=2.5;
float inf=0.52;
float sup=5.76;
float boca=0.1;
int direction =1;

void setup(){
size(800,400);
ellipseMode(RADIUS);
}

void draw(){
background(0);
x+=speed*direction;
inf-=boca;
sup+=boca;
if( x > width + radius){
x=-radius;
}

if ((x > width - radius) || (x < radius)) {
direction= -direction;
}

arc(x,200,radius,radius,inf,sup);
if((inf < 0-0.31)||(sup > TWO_PI+0.31)){
boca=-boca;
}
if((inf > 1.26)||(sup < 5.03)){
boca=-boca;
}


}
