
float incX = 2;
float incY = 3;
float distX = 280;
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
  if(distX > width-10 || distX < 10){
    incX = incX*-1;
  }
  if(distX > x-10 && distX < x+w+10  && distY > y-10 && distY < y+h+10){
    incX = incX*-1;
    incY = incY*-1;
  }
  if(distY > height-10 || distY < 10){
    incY = incY*-1;
  }
  ellipse(distX, distY, 20, 20);
}


