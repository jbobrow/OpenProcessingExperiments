
int _numChildren = 5;
int _maxLevels = 4;

Branch _trunk;

void setup(){
  size(1400,1000);
  background(255);
  noFill();
  smooth();
  newTree();
}


void newTree(){
  _trunk = new Branch(1, 0, width/2, height/2);
  _trunk.drawMe();
  
}void draw(){
  background(0);
  strokeWeight(5);
  line(width/2, 0, width/2, height/2);
  _trunk.updateMe(width/2, height/2);
  _trunk.drawMe();
}


class Branch{
  float level, index;
  float x, y;
  float endx, endy;
  
  float strokeW, alph;
  float len, lenChange;
  float rot, rotChange;
  
  Branch [] children = new Branch[0];
  
  Branch(float lev, float ind, float ex, float why){
    level = lev;
    index = ind;
    
    strokeW = (1/level) * 10;
    alph = 255 / level;
    len = (1/level) * random(500);
    rot = random(360);
    lenChange = random(16) - 5;
    rotChange = random(16) - 5;
    
    updateMe(ex, why);
    
    if(level < _maxLevels){
      children = new Branch[_numChildren];
      for(int x = 0; x<_numChildren; x++){
        children[x] = new Branch(level+1, x, endx, endy);
      }
    }
  }
  
  
  
  void updateMe(float ex, float why){
    x = ex;
    y = why;
    
    rot += lenChange;
    if(rot > 360){rot = 0; }
    else if (rot < 0) {rot = 360;}
    
    len -= lenChange;
    if (len < 0) { lenChange *= -1;}
    else if(len > 360){lenChange *= -1; }
    
    float radian = radians(rot);
    endx = x + (len * cos(radian));
    endy = y + (len * sin(radian));
    
    for(int i = 0; i<children.length; i++){
      children[i].updateMe(endx, endy);
    }
  }
  
  void drawMe(){
    if(level > 1){
    strokeWeight(strokeW);
    stroke(252, 235,41, alph);
    fill(255, alph);
    line(x, y, endx, endy);
    ellipse(endx, endy, len/12, len/12);
    }
    for(int i=0; i<children.length; i++){
      children[i].drawMe();
    }
    }
}



