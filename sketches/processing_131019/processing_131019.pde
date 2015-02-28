
PImage bike;
int x = 0;
int y = 266;
int z = 532;
float deg = 0;
float angle;
float angle2;
float angle3;
float angle4;
float angle5;
float angle6;
float angle7;
float angle8;

void setup(){
  size(800,800);
bike = loadImage("bike.png");
}
void draw(){
 background(#30DAFA);
 fill(#FFF700);
 noStroke();
 ellipse(0,0,200,200);
 fill(#A5A5A5);
 stroke(1);
 rect(0,330,800,800);
// rect(0,557,800,800);
 image(bike,200,200);
wheel(325,453);
wheel(735,453);
crack();
}

void wheel (int xcord,int ycord){
float angle = radians(deg);
float angle2= radians(deg+45);
float angle3= radians(deg+2*(45));
float angle4= radians(deg+3*(45));
float angle5= radians(deg+4*(45));
float angle6= radians(deg+5*(45));
float angle7= radians(deg+6*(45));
float angle8= radians(deg+7*(45));
noFill();
strokeWeight(10);
ellipse(xcord,ycord,200,200);
strokeWeight(4);
line(xcord,ycord,xcord+(100*cos(angle)),ycord+(100*sin(angle)));
line(xcord,ycord,xcord+(100*cos(angle2)),ycord+(100*sin(angle2)));
line(xcord,ycord,xcord+(100*cos(angle3)),ycord+(100*sin(angle3)));
line(xcord,ycord,xcord+(100*cos(angle4)),ycord+(100*sin(angle4)));
line(xcord,ycord,xcord+(100*cos(angle5)),ycord+(100*sin(angle5)));
line(xcord,ycord,xcord+(100*cos(angle6)),ycord+(100*sin(angle6)));
line(xcord,ycord,xcord+(100*cos(angle7)),ycord+(100*sin(angle7)));
line(xcord,ycord,xcord+(100*cos(angle8)),ycord+(100*sin(angle8)));
deg=deg-2;

}

void crack (){
  if (x>=800){
    x=0;
  }
  if (y>=800){
    y=0;
  }
  if (z>=800){
    z=0;
  }
  line(x,330,x,800);
  line(y,330,y,800);
  line(z,330,z,800);
x=x+10;
y=y+10;
z=z+10;
}


