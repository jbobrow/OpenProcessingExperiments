
int directionX;
int x;
int directionY;
int y;


void setup(){
  size(600,600);
  directionX = 1;
  x = 50;
  directionY = 1;
  y = 100;
}

void draw(){
  background (0);
  x += directionX;
  y +=directionY;
  rect(x, y, 250, 250);
  
if(y > 600){
  directionY=-1;
}

if(y< 1){
  directionY=1;
}

if(x>600){
  directionX=-1;
}

if(x<1){
  directionX=1;
}

}


