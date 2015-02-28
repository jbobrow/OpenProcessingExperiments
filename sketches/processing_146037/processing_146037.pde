
// Plays the chaos game with an equilateral triangle and a factor of 1/2. 

class tpoint{
  int xpos;
  int ypos; // Will serve as the x and y coordinates of a point
  
  tpoint(float x, float y){
    xpos = int(x);
    ypos = int(y);
  }
}

float rx;
float ry;

tpoint tpa;
tpoint tpb;
tpoint tpc;
  
void setup(){
  size(650,650);
  frameRate(15);
  noStroke();
  background(0);
  
  float triheight = 300*sqrt(3);
  float vertgap = (650-triheight)/2;
  
  tpa = new tpoint(25, vertgap + triheight);
  tpb = new tpoint(625, vertgap + triheight);
  tpc = new tpoint(325, vertgap);
  
  // Creates the three vertices of the equilateral triangle
  fill(255);
  ellipse(tpa.xpos,tpa.ypos,5,5); // Point A
  ellipse(tpb.xpos,tpb.ypos,5,5); // Point B
  ellipse(tpc.xpos,tpc.ypos,5,5); // Point C
  
  
  rx = int(random(650));
  ry = int(random(650));
}

void draw(){
  int rdice = int(random(3));
  if (rdice == 0)
  {
    rx = (rx + tpa.xpos)/2;
    ry = (ry + tpa.ypos)/2;
    stroke(255,0,255);
    fill(255,0,255);
  }
  else if (rdice == 1)
  {
    rx = (rx + tpb.xpos)/2;
    ry = (ry + tpb.ypos)/2;
    stroke(0,255,255);
    fill(0,255,255);
  }
  else if (rdice == 2)
  {
    rx = (rx + tpc.xpos)/2;
    ry = (ry + tpc.ypos)/2;
    stroke(255,255,0);
    fill(255,255,0);
  }
  
    
  ellipse(rx, ry, 0.5, 0.5);
    
}

  


