

int x = 210;
int y = 500;
int bodyHeight = 140; //body height
int neckheight = 40; //neck height
int radius = 80;

float easing= 0.024;


void setup(){
  size(420, 640) ;
  smooth() ;
  background(204) ;
}

void draw () {
  background(225) ;
  int targetX=mouseX;
  x+= (targetX-x) *easing;
   
  if (mousePressed) {
  y=400;
} else {
  y=500;
}


fill(102, 102, 255) ; 
rect(x-20, y-290, 10, 30) ; //neck joint on head left
rect(x+10, y-290, 10, 30) ; //neck joint on head right
rect(x-90, y-250, 30, 10) ; //joint on arm left
rect(x+60, y-250, 30, 10) ; //joint on arm right
rect(x-40, y-150, 10, 30) ; //leg joint left 
rect(x+30, y-150, 10, 30) ; //leg joint right 


strokeWeight(2) ;
line(x-10, y-360, x-50, y-420) ; //antennae one
line(x+10, y-360, x+50, y-420) ; //antennae two 


strokeWeight(0) ; 
fill(153, 000, 255) ; //body colour 
rect(x-70, y-270, 140, 130) ; //body


fill(204, 102, 255) ; //body colour
rect(x-50, y-130, 30, 130) ; //leg one
rect(x+20, y-130, 30, 130) ; //leg two 


fill(255, 153, 255) ; //body colour
rect(x-100, y-260, 20, 110) ; //arm one 
rect(x+80, y-260, 20, 110) ; //arm two 


ellipse(x-50, y-420, 20, 20) ; //antennae circle one 
ellipse(x+50, y-420, 20, 20) ; //antennae circle two 

//head
fill(204, 102, 255) ; //head colour
rect(x-40, y-360, 80, 80) ; //head
fill(255) ; // inside eyes 
ellipse(x-20, y-330, 20, 30) ; //eye one 
ellipse(x+20, y-330, 20, 30) ; //eye two 
fill(0) ; //black dots
ellipse(x-20, y-330, 10, 10) ; //circle in eye one
ellipse(x+20, y-330, 10, 10) ; //circle in eye two 
fill(255) ; //white mouth
rect(x-20, y-310, 40, 10) ; //mouth


}


