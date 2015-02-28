
int num = 5;
Particle[] pArr;


void setup(){
  size(500, 300);
  smooth();
  frameRate(30);
  clearBackground();
  
  pArr = new Particle[num];
  for (int i=0;i<num;i++) {
    pArr[i] = new Particle(i);
  }
}

void clearBackground() {
  background(0);
}
  
void draw()  {
  // clearBackground();
  for (int i=0;i<num;i++) {
    pArr[i].update();
  }
}

void mousePressed() {
  clearBackground();
  for (int i=0;i<num;i++) {
    pArr[i].init();
  }
  
//  save("tmp.jpg");
}  

class Particle{
  int id;
  float radius;  

  float x, y;
  float xx,yy;
  float step = 30;
  
  
  Particle (int num) {
    id = num;
    init();
  }
  
  void init() {
    radius = random(15)+5;
    x = random(width);
    y = random(height);
    fill(random(50,255),random(100,255));
  } 
 
  void update() { 
    xx = x+random(-step,step);
    yy = y+random(-step,step);
    ellipse(xx,yy,radius/2+random(radius/3),radius/2+random(radius/3));
    x = xx; y =yy;
    if(xx > width || yy > height){init();}
    
    //mirror
    float mirrorx = width - x;
    float mirrory = height - y;
    ellipse(mirrorx,mirrory,random(3)+1,random(3)+1);
 
    
  }
  
  
  
  
  
  
  
  
  
}
