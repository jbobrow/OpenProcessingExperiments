
//spinning square

int x;
int y;
int directionX;
int directionY;

void setup(){
  background(255);
  size(600,600);
  smooth();
  x = 50;
  y = 50;
  directionX = 1;
  directionY = 1;
}

void draw(){
  background(255);
  fill(0,220,0);
  rect(x,y,40,40);
  x+=directionX;
  y+=directionY;
  
  if (mouseX == x+25){
    directionX=-1;
  }
  if (mouseX == x-25){
    directionX=+1;
  }
  if (mouseY == y+25){
    directionY=-1;
  }
  if (mouseY == y-25){
    directionY=+1;
  }
}

