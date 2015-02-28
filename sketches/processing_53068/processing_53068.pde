

int x ;
int y ;
int speedx;
int speedy;


void setup() {
  size(583,130);
  smooth();
  background(255);
  x = 0;
  y = 0;
  speedx=5;
  speedy=5;
}
 

void draw(){



//first cube

x+=speedx;
y+=speedy;

//ball1
if (y>120){
  speedy=-5;
}

if (y<17){
  speedy=5;
}

if(x>579){
  speedx=-5;
}
if(x<15){
  speedx=5;
}

noStroke();
fill(x,y+4,100,20);
ellipse(x,y,20,20);





}

