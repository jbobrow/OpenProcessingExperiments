
//Author: Weiyuh Li
//holiday greeting card
//concept:merry christmas & happy new year
//mouse left click to change season
//reference:http:class exercise by Sheng-Fen Nik Chi
//         


int _numChildren1= 5; 	
int _maxLevels1= 4;  	

int _numChildren2 = 8; 	
int _maxLevels2 = 4;  

int _numChildren3 = 5; 	
int _maxLevels3 = 6;  	

float t=50 ;

Branch _trunk; 
Branch2 _trunk2;
Branch3 _trunk3;


void setup() {
  size(1000, 600);
  background(20, 10, 40);
  noFill();
  smooth();
  fragment();
  firecracker();
  tree();
  frameRate(8);
}

void fragment() {
  _trunk = new Branch(1, 0, width/2, 50);
  _trunk.drawMe();
}
void firecracker() {
  _trunk2 = new Branch2(1, 0, width/2, 50);
  _trunk2.drawMe2();
}
void tree() {
  _trunk3 = new Branch3(1, 0, width/2, 50);
  _trunk3.drawMe3();
}
void draw() {
  fill(20, 10, 40, 130);
  rectMode(CENTER);
  rect(width/2, height/2, width, height);
  _trunk.updateMe(width/2, height-t);
  _trunk.drawMe();
  if (mousePressed) {
    _trunk2.updateMe2(width/2, t);
    _trunk2.drawMe2();
    stroke(0);
    line(width/2, 0, width/2, t);
  } 
  else {
    _trunk3.updateMe3(width/2, height-t);
    _trunk3.drawMe3();
    stroke(0);
    strokeWeight(7);
    line(width/2, height, width/2, height-t);
    
  }
}

// ======================= fragment
class Branch {
  float level, index;  
  float x, y;
  float endx, endy;

  float strokeW, alph;   	
  float len, lenChange;  	
  float rot, rotChange;  	

  Branch [] children = new Branch[0];	

  Branch(float lev, float ind, float ex, float why) {
    level = lev; 
    index = ind;

    strokeW = (1/level) * 10;
    alph = 255 / level+30;
    len = (1/level) * random(200);
    rot = random(360);
    lenChange = random(5) - 5;
    rotChange = random(5) - 5;

    updateMe(ex, why);

    if (level < _maxLevels1) {	
      children = new Branch[_numChildren1];
      for (int x=0; x<_numChildren1; x++) {
        children[x] = new Branch(level+1, x, endx, endy);
      }
    }
  }

  void updateMe(float ex, float why) {
    x = ex;
    y = why;

    rot += rotChange;		
    if (rot > 360) { 
      rot = 0;
    }		
    else if (rot < 0) { 
      rot = 360;
    }	

    len -= lenChange;		
    if (len < 0) { 
      lenChange *= -1;
    }		
    else if (len > 200) { 
      lenChange *= -1;
    }	

    float radian = radians(rot);	
    endx = x - (len * cos(radian));	
    endy = y - (len * tan(radian));	

    for (int i=0; i<children.length; i++) {	
      children[i].updateMe(endx, endy);
    }
  }


  void drawMe() {
    if (mousePressed) {  
      noStroke();
      fill(255, 70, 50, alph);
      rectMode(CENTER);
      rect(endx, endy, len/12, len/12);			
      for (int i=0; i<children.length; i++) {	
        children[i].drawMe();
      }
    } 
    else {
      noStroke();
      fill(255, alph);
      ellipse(endx, endy, len/12, len/12);			
      for (int i=0; i<children.length; i++) {	
        children[i].drawMe();
      }
    }
  }
}





// =======================firecracker

class Branch2 {
  float level, index;  
  float x, y;
  float endx, endy;

  float strokeW, alph;   	
  float len, lenChange;  	
  float rot, rotChange;  	

  Branch2 [] children = new Branch2[0];	

  Branch2(float lev, float ind, float ex, float why) {
    level = lev; 
    index = ind;

    strokeW = (1/level) * 20;
    alph = 255 / level;
    len = (1/level) * random(100)+20;
    rot = random(40, 140);
    lenChange = random(10) ;
    rotChange = random(5) ;

    updateMe2(ex, why);

    if (level < _maxLevels2) {	
      children = new Branch2[_numChildren2];
      for (int x=0; x<_numChildren2; x++) {
        children[x] = new Branch2(level+1, x, endx, endy);
      }
    }
  }

  void updateMe2(float ex, float why) {
    x = ex;
    y = why;

    rot += rotChange;		
    if (rot > 150) { 
      rotChange=rotChange*-1;
    }		
    else if (rot < 30) { 
      rotChange=rotChange*-1;
    }	

    len -= lenChange;		
    if (len < 30) { 
      lenChange *= -1;
    }		
    else if (len > 200) { 
      lenChange *= -1;
    }	

    float radian = radians(rot);	

    endx = x + (len * cos(radian));	
    endy = y + (len * sin(radian));

    for (int i=0; i<children.length; i++) {	
      children[i].updateMe2(endx, endy);
    }
  }


  void drawMe2() {
    strokeWeight(1);
    stroke(0, alph);
    fill(255, alph);
    line(x, y, endx, endy);
    rectMode(CENTER);
    strokeWeight(2);
    stroke(255, 0, 0, 50);
    fill(255, 10, 20);
    rect(endx, endy, len/20, len/10);
    noStroke();
    fill(random(255), random(255), random(255), 150);
    float r=random(12);
    ellipse(endx+random(-50, 50), endy+random(-50, 50), r, r);			
    for (int i=0; i<children.length; i++) {	
      children[i].drawMe2();
    }
  }
}


// ======================= tree

class Branch3 {
  float level, index;  
  float x, y;
  float endx, endy;

  float strokeW, alph;   	
  float len, lenChange;  	
  float rot, rotChange;  	

  Branch3 [] children = new Branch3[0];	

  Branch3(float lev, float ind, float ex, float why) {
    level = lev; 
    index = ind;

    strokeW = (1/level) * 20;
    alph = 255 / level;
    len = (1/level) * random(100)+20;
    rot = random(220, 320);

    rotChange = random(5) ;

    updateMe3(ex, why);

    if (level < _maxLevels3) {	
      children = new Branch3[_numChildren3];
      for (int x=0; x<_numChildren3; x++) {
        children[x] = new Branch3(level+1, x, endx, endy);
      }
    }
  }

  void updateMe3(float ex, float why) {
    x = ex;
    y = why;

    rot += rotChange;		
    if (rot > 330) { 
      rotChange=rotChange*-1;
    }		
    else if (rot < 210) { 
      rotChange=rotChange*-1;
    }	



    float radian = radians(rot);	

    endx = x + 3*(len * cos(radian));	
    endy = y + 2*(len * sin(radian));

    for (int i=0; i<children.length; i++) {	
      children[i].updateMe3(endx, endy);
    }
  }


  void drawMe3() {
    strokeWeight(strokeW/3);
    stroke(0, alph);
    fill(255, alph);
    line(x, y, endx, endy);

    strokeWeight(1);
    stroke(180, 30, 40, 100);
    fill(random(150, 255), random(10, 60), random(10, 60), 100);
    ellipse(endx, endy, 250/len, 250/len);
    noStroke();
    fill(random(200, 255), random(160, 200), random(30), 100);
    ellipse(x, y, 100/len, 100/len);
    fill(50, 150, 20, 100);
    ellipse((x+endx)/2, (y+endy)/2, 5, 5);

    for (int i=0; i<children.length; i++) {	
      children[i].drawMe3();
    }
  }
}

void keyPressed() {

  saveFrame("card.jpg");
}

