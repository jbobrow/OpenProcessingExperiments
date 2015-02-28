
int directionX;
int directionY;
int x;
int y;

void setup(){
  size(600,600);
  directionX=1;
  directionY=1;
  x=50;
  y=100;
  
}


void draw(){
  x += directionX;
  y += directionY;
  ellipse(x,y,50,150);
 
if(y>600){
  directionX=1;
  directionY=-1;
}

if(y<1){
  directionY=1;
  
}

if(x>600){
  directionX=-1;
}

if (x<1){
  directionX=1;
  
}
  
}

