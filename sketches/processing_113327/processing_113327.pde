
float incX = 2;
float incY = 3;
float distX = 250;
float distY = 100;
int x = 350;
int y = 200;
int w = 100;
int h = 130;

void setup(){
  size(500, 500);
  smooth();
  background(255);
  noStroke();
}

void draw(){
  
  background(255);
  fill(255, 0, 0);
  rect(x, y, w, h);
  fill(0);
  distX += incX;
  distY += incY;
  if(distX > width-20 || distX < 20){
    incX = incX*-1;
  }
  if(distX > x && distX < x+w  && distY > y && distY < y+h){
    incX = incX*-1;
    incY = incY*-1;
  }
  if(distY > height-20 || distY < 20){
    incY = incY*-1;
  }
  ellipse(distX, distY, 20, 20);
}


