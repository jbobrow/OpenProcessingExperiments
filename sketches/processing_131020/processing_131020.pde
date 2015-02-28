
int x = 0;
int y = 266;
int z = 532;
int wheelx = 0;
int wheely =28;
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
  background(101);
}

void draw (){
  background(101);
  wheel(wheelx,wheely);
    wheelx=wheelx+1;
  if(wheelx>=800){
  wheely=wheely+50;
  wheelx=0;
  }

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
strokeWeight(5);
ellipse(xcord,ycord,50,50);
strokeWeight(2);
line(xcord,ycord,xcord+(25*cos(angle)),ycord+(25*sin(angle)));
line(xcord,ycord,xcord+(25*cos(angle2)),ycord+(25*sin(angle2)));
line(xcord,ycord,xcord+(25*cos(angle3)),ycord+(25*sin(angle3)));
line(xcord,ycord,xcord+(25*cos(angle4)),ycord+(25*sin(angle4)));
line(xcord,ycord,xcord+(25*cos(angle5)),ycord+(25*sin(angle5)));
line(xcord,ycord,xcord+(25*cos(angle6)),ycord+(25*sin(angle6)));
line(xcord,ycord,xcord+(25*cos(angle7)),ycord+(25*sin(angle7)));
line(xcord,ycord,xcord+(25*cos(angle8)),ycord+(25*sin(angle8)));
deg=deg+2;

}



