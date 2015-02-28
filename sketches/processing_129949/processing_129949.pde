
//Practice Fractals
// SU HSIU PAI
// April and May is the season that corals they make babies!
// Eggs and sperms are everywhere in the sea, and they move with the moving waves.   
// Reference:
//suhsiupai@gmail.com


int _numChildren = 5;
int _maxLevels = 4;
Branch _trunk;

void setup() {
  size(750, 500);
  background(51,166,184);
  noFill();
  newTree();
  frameRate(15);
}


void draw(){

background(51,166,184);
_trunk.updateMe(width/2, height-110);
_trunk.drawMe();
noStroke();
fill(255);
rect(0,0,width, 80);
rect(0,0,90, height);
rect(width-90,0,width-90, height);
rect(0,height-120,width, 120);


//Text
  textFont(createFont("Centaur", 15));
  fill(50);
  text("Spring", width/2-100, height-90);
   text("the season of birth", width/2-100, height-70);
 
  }

void newTree() {
  _trunk = new Branch(1, 0, width/2, 400);
  _trunk.drawMe();
}

class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  float strokeW, alph;//line style
  float len, lenChange; // length
   float rot, rotChange;// rotation  
  
  Branch[] children = new Branch[0];

  Branch(float lev, float ind, float ex, float ey) {
    level= lev;
    index= ind;
    updateMe(ex, ey);
    
    strokeW=(1/level)*5;
    alph= random(150,255);
    len= (1/level)*random(200);
    lenChange = random(10)-5;
    rotChange = random(10)-5;
    

    if (level < _maxLevels) {
      children = new Branch[_numChildren];
      for (int i =0; i<_numChildren; i++) {
        children[i]= new Branch (level+1, i, endx, endy);
      }
    }
  }

  void updateMe(float nx, float ny) {
    x = nx;
    y = ny;
    
    
    
    rot += rotChange;
    len -= lenChange;
    if (len<0 || len>200){
    lenChange *= -1;
    
    }
    
    float radian = radians(rot);
    endx = x+(len*cos(radian));
    endy = y+(len*sin(radian));
    

    
    for (int i = 0; i<children.length;i++)
    {
    children[i].updateMe(endx,endy);
    }
    
    
    
  }

  void drawMe() {
    stroke(255,60);
    strokeWeight(strokeW/30);
    stroke(255,alph);
    line(x, y, endx, endy);
    stroke(254,253,225);
    fill(254,223,225,alph);
    ellipse(endx, endy,len/6,len/6);
    fill(255,255,0,200);
   
    for(int i = 0; i<children.length;i++)
    {
    children[i].drawMe();
    }
    
  }
}



