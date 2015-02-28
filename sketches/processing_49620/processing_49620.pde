

float _boost = 0.02;
int _num = 1000;
int _nodes = 5;
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
  background(140);
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
  float xpos,ypos,vx,vy,gain;
  Particle() {
    xpos=random(width);
    ypos=random(height);
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
    strokeWeight(1);
    stroke(0,100);
    fill(55, 100,200);
    ellipse(xpos,ypos,10,10);
  }
}

class Node {
  float xpos,ypos;
  
  Node(){
    xpos = random(-100, width+100);
    ypos = random(-100, height+100);
  }
  
  void drawMe() {
    strokeWeight(3);
    noFill();
    stroke(255,20,0, 100);
    ellipse(xpos,ypos,20,20);
  }
    
}
