
float r=0;
float t=0;
void setup() {
  size(600, 600);
  background(0, 244, 100);
  rectMode(CENTER);
  noStroke();
  //smooth();
}

void turn(int red,int blue, int green)
{
  rotate(r);
    fill(red,blue,green);
    rect(0, 40, 30, 30);
    rotate(-2*r);
    rect(0, 80, 30, 30);
    rotate(2*r);
    rect(0, 120, 30, 30);
    rotate(-2*r);
    rect(0, 160, 30, 30);
    rotate(2*r);
    rect(0, 200, 30, 30);
}
    
    
void draw() {
  r=r+.01;
  translate(300, 300);
  
  if (r<2*PI) 
  {
  turn(255,255,255);
  }
  else if (r<4*PI) 
  {
  turn(0, 244, 100);
  }
  else if (r<6*PI) 
  {
    r = 0;
  }
  
  
}

