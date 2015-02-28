
void setup() {
  size(800,800);
  background(0);
  noStroke();
  smooth();
}

void crystal(float x1,float y1,float x2,float y2,float x3,float y3,float x4,float y4) {
  colorMode(RGB, 100);  
  color from = color(50,100,20);
  color to = color(20,70,100);
  fill(lerpColor(from,to,random(0.0,1.0)),random(100,150)); //color range
  quad(x1,y1,x2,y2,x3,y3,x4,y4);
}

int s = 0;

void draw() {
  float x = random(0,800); //random x value for random point x,y
  float y = random(0,800); //random y value for random point x,y
  float z = random(250,350); //distance away from the first vertex of the quads
  for (int h = 0; h < 10; h++) { //h affects the output number of quadrilaterals 
    crystal(x+z,y+z,x+random(1.5)*z,y+random(1.5)*z,x+random(1.5)*z,y+random(2.5)*z,x+random(2.5)*z,y+random(3.5)*z); //right cluster
    crystal(x-z,y-z,x-random(1.5)*z,y-random(1.5)*z,x-random(1.5)*z,y-random(2.5)*z,x-random(2.5)*z,y-random(3.5)*z); //left cluster
  }
  s++;
  if (s>5) { //s affects the time the program runs until it stops
    noLoop();
  }
}

void keyPressed(){
  saveFrame("pic-#.tif");
}


