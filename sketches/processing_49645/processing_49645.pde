


float _boost = 0.5;
int _num = 40;
int _nodes = 6;
Particle[] _dotArr = new Particle[_num];
Node[] _nodeArr = new Node[_nodes];

//================================= init

void setup(){
  size(900, 450);
  smooth(); 
  frameRate(112);
  restart();
}

void restart() {
  clearBackground();
  for(int i=0;i<_num;i++){
    _dotArr[i]=new Particle();
  }
  for(int i=0;i<_nodes;i++){
    _nodeArr[i]=new Node();
  }
}

void clearBackground() {
  fill(255, 10);
  noStroke();
  rect(0,0,width,height);
}

//================================= frame loop

void draw(){
  clearBackground();
  for(int i=0;i<_num;i++){
    _dotArr[i].update();
    _dotArr[i].drawMe();
  }
  for(int i=0;i<_nodes;i++){
    _nodeArr[i].drawMe();
  }  
}

//================================= interaction

void mousePressed(){
  restart();
}

//================================= objects

class Particle {
  float xpos, ypos, vx, vy, gain;
  color col;
  Particle() {
    xpos=random(width);
    ypos=random(height);
    if (random(1) > 0.5) {
      col = color(random(255), random(5),random(5));
    } else {
      col = color(0, 150);
    }
  }
  
  void update(){
    for(int i=0; i<_nodes; i++){
      gain = dist(xpos, ypos, _nodeArr[i].xpos, _nodeArr[i].ypos);
      if (gain > 1) {
        vx+=((_nodeArr[i].xpos-xpos) * _boost) /gain;
        vy+=((_nodeArr[i].ypos-ypos) * _boost) /gain;
        xpos += vx;
        ypos += vy;
      }
    }
  }
  
  void drawMe() {
    strokeWeight(random(3));
    for(int i=0;i<_num;i++){
      float dis = dist(xpos, ypos, _dotArr[i].xpos, _dotArr[i].ypos);
      if (dis > 50) {
        if (dis > 198) { dis = 198; }
        stroke(col, 200-dis);
        line(xpos, ypos, _dotArr[i].xpos, _dotArr[i].ypos);
      }
    } 
  }
}

class Node {
  float xpos,ypos;
  
  Node(){
   xpos = random(-200, width+500);
   ypos = random(-200, height+500);
  }
  
  void drawMe() {
    noFill();
    strokeWeight(0.5);
    stroke(255, 100);
    ellipse(xpos, ypos, 30, 30);
  }
    
}
