
//ying+yang
//z3378304

void setup(){
  size(500, 500);
  background(255);
  smooth();
}


void draw() {
  
  if (mousePressed){
    background(255);
  }
  
  //random colours
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(255);
  fill (r,g,b,a);
  
  int x = mouseX;
  int y = mouseY;
  int circleRadius = 80;
  
  ellipse(x, y, circleRadius, circleRadius);
  
  float littleX = x - 10;
  float littleY = y + 15;
  float bigX = x + 10;
  float bigY = y - 15;
  float littleCircleRadius = circleRadius/10;
  
  ellipse(littleX, littleY, littleCircleRadius, littleCircleRadius);
  ellipse(bigX, bigY, littleCircleRadius, littleCircleRadius);
  
  float m = y - circleRadius/2;
  float n = x - circleRadius/4;
  float o = y - circleRadius/4;
  float p = x + circleRadius/4;
  float q = y + circleRadius/4;
  float s = y + circleRadius/2;
  
  bezier(x, m, n, o, p, q, x, s);
  
}
