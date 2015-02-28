
// 1. give http://www.zenbullets.com a credit

//================================= global vars

float _boost = 0.02;
int _num = 2500;
int _nodes = 15;
Particle[] _dotArr = new Particle[_num];
Node[] _nodeArr = new Node[_nodes];

//================================= init

void setup() {
  //size(1280, 800);
  size(720,480);
  smooth(); 
  noCursor();
  sampleColour();
  background(255);
  restart();
}

int numcols = 1000; // 30x20
color[] colArr = new color[numcols];

void sampleColour() {
  PImage img;
  img = loadImage("palet.jpg");
  image(img,0,0);
  int count = 0;
  for (int x=0; x < img.width; x++){
    for (int y=0; y < img.height; y++) {
      if (count < numcols) {
        color c = get(x,y);
        colArr[count] = c;
      }
      count++;
    }
  }  
}

void restart() {
  clearBackground();
  for (int i=0;i<_num;i++) {
    _dotArr[i]=new Particle();
  }
  for (int i=0;i<_nodes;i++) {
    _nodeArr[i]=new Node();
  }
}

void clearBackground() {
  //background(140);
  fill(255,40);
  noStroke();
  rect(0,0,width,height);
}

//================================= frame loop

void draw() {
  clearBackground();
  for (int i=0;i<_num;i++) {
    _dotArr[i].update();
    _dotArr[i].drawMe();
  }
  for (int i=0;i<_nodes;i++) {
    _nodeArr[i].drawMe();
  }
}

//================================= interaction

void mousePressed() {
  restart();
}

//================================= objects

class Particle {
  float xpos, ypos, vx, vy, gain;
  int myCol;
  
  Particle() {
    xpos=random(width);
    ypos=random(height);
  }

  void update() {
    for (int i=0; i<_nodes; i++) {
      gain = dist(xpos, ypos, _nodeArr[i].xpos, _nodeArr[i].ypos);
      if (gain > 1) {
        vx+=((_nodeArr[i].xpos-xpos) * _boost) /gain;
        vy+=((_nodeArr[i].ypos-ypos) * _boost) /gain;
        xpos += vx;
        ypos += vy;
      }
    }
    myCol = colArr[int(random(numcols))];
  }

  void drawMe() {
    strokeWeight(1);
    stroke(0, 100);
    fill(myCol, 100);
    ellipse(xpos, ypos, 10, 10);
  }
}

class Node {
  float xpos, ypos;

  Node() {
    //xpos = random(width/2-600, width/2+400);
    ypos = random(height);
    xpos = width/2;
    //ypos = height/2;
  }

  void drawMe() {
//    strokeWeight(1);
//    noFill();
//    stroke(255, 20, 0, 100);
//    ellipse(xpos, ypos, 10, 10);
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("Cell-####.png");
  }
}




