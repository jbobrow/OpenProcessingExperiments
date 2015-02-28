
//variable color
//mfang
//week2 Jan 25

int directionX;
int directionY;
int directionX2;
int directionY2;
int x;
int y;
int x2;
int y2;



void setup(){
  size(800,400);   
  directionY = 30;
  directionX = 40;
  directionY2 = 100;
  directionX2 = 20;
  x = 20;
  y = 20;
  x2 = 100;
  y2 = 100;
}

void draw(){
  background(255);
  // ellipse 1
  x +=directionX;
  y +=directionY;
  fill(33,227,232);
  noStroke();
  ellipse(x,y,40,40);
  if(x >width){
    directionX = -5;
  }
  if(x < 0){
    directionX = 12;
  }
  if(y > height){
    directionY = -13;
  }
  if(y < 0){
    directionY = 15;
  }
  // ellipse 2  
  x2 +=directionX2;
  y2 +=directionY2;
  fill(33,227,232);
  noStroke();
  ellipse(x2,y2,40,40);
  if(x2 > width){
    directionX2 = -12;
  }
  if(x2 < 0){
    directionX2 = 12;
  }
  if(y2 >height){
    directionY2 = -14;
  }
  if(y2 < 0){
    directionY2 = 15;
  }
}


