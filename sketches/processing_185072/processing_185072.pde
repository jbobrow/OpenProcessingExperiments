
int j=20; int l=20;
void setup(){
  size(700,400);
  background(63,219,5);
}
//ball
int x=0; int speed=9;
void draw(){
frameRate(30);
background(63,219,5);
stroke(255);
fill(255,222,6);
ellipse(x,200,10,10); 
x=x+speed; 
if ((x<0)||(x>=700)){ 
speed=speed*-1; 
}
courtlines(j,l);
}
//courtlines
void courtlines(int j, int l){
  stroke(255); noFill();strokeWeight(3);
rect(j,l,j*33,l*18);
rect(j,l*3,j*33,l*14);
line(350,0,350,400);line(165,200,515,200);
line(165,60,165,340);line(515,60,515,340);
}
