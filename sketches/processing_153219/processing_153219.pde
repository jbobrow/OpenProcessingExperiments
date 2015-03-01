
float x=100, koko=1;
float y=100;
float xspeed=random(-10,10);
float yspeed=random(-10,10);

void setup(){
smooth(0);
size(800,500);
background(44,50,61);
}

void draw(){
if(mousePressed){
xspeed=random(-15,15);
yspeed=random(-15,15);
koko=random(100);}

x=x+xspeed;
y=y+yspeed;
stroke(255);
fill(44,50,61);
ellipse(x,y,koko,koko);

if (x>=width || x<=0){
xspeed=xspeed*-1;

}
if (y>=height || y<=0 ){
yspeed=yspeed*-1;
}
}
