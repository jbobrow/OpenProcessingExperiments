
// change the numbers below from 1 to 7 (or higher depending on the power of your machine
// this will affect the number of levels and 'branches'.  Currently set at 6 each = 6x6x6x6x6x6 = 46,656 objects
 
int _numChildren =4; //changed to 4 from 6
int _maxLevels =4;  //changed to 4 from 6

Branch _trunk;

void setup(){
  size(750,500);   //alter the size of the canvas
  background(255); //change the background colour
  noFill();
  smooth();
  newTree();
}

void newTree(){
  _trunk = new Branch(1,0,width/3,height/3);  //changed to width/3 height/3 from 2
  _trunk.drawMe();
}

  void draw(){
    background(255);
    _trunk.updateMe(width/2,height/2);
    _trunk.drawMe();
  }

class Branch{
  float level, index;
  float x, y;
  float endx, endy;
  
  float strokeW, alph;
  float len, lenChange;
  float rot, rotChange;
  
  Branch[]children = new Branch[0];
  
  Branch(float lev, float ind, float ex, float why){
    level = lev;
    index = ind;
    
    strokeW = (2/level)*10;  //change the stroke weight of the branches
    alph = 200/level;
    len = (1/level)*random(500);  //randomised length properties
    rot = random(360);            //randomised rotation properties
    lenChange = random(10)-5;
    rotChange = random(10)-5;
    
    updateMe(ex,why);
    
    if(level< _maxLevels){
      children = new Branch[_numChildren];
      for(int x=0; x< _numChildren; x++){
        children[x] = new Branch(level+1,x,endx,endy);
      }
    }
  }
  
  void updateMe(float ex, float why){
    x = ex;
    y = why;
    
    rot += rotChange;
    if(rot > 360) {rot = 0;}
    else if(rot < 0) {rot = 360;}
    
    len -= lenChange;
    if(len < 0) {lenChange *= -1;}
    else if(len > 500) { lenChange *= -1;}
    
   float radian = radians(rot);
   endx = x+(len * cos(radian));
   endy = y+(len * sin(radian));
    
    for(int i=0; i<children.length; i++){
      children[i].updateMe(endx,endy);
    }
  }
  
  void drawMe(){
    
    if(level>1){
    
    strokeWeight(strokeW);
    stroke(0,alph);
    fill(255);
    line(x,y,endx,endy);
    triangle(endx, endy, len/12, len/12);  //changed to triabgle from ellipse
    }
    for(int i=0; i<children.length; i++){
      children[i].drawMe();
    }
  }
  
  }



