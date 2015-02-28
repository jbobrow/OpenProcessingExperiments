
float centerX = 250;
float centerY = 250;


float dir = 1;

void setup(){
  size(500,500);
  smooth();
}

void draw(){
  float a = random(0,50);
  
  background(100,250, 250);
  
  blob(a,50,50);
  moveH(.2);
  
}


void blob(float a, int b, int c){
  noStroke();
  fill(250, 100, 100,250);
  ellipse(centerX, centerY, a,a);
  fill(250, 150, 150, 180);
  ellipse(centerX-10, centerY-5, b, b);
  fill(200, 150, 150, 200);
  ellipse(centerX+5, centerY-20, c, c);
}

void moveH(float sp){
  centerX = centerX+sp*dir;
  
  if (centerX>width || centerX<0){
    dir=dir*-1;
  }
}



