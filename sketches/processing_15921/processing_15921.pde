
PImage mandrake;
int num = 330; //number of particles default = 330
int mouseState = 0; //int for toggling gravity
int keyState = 0; //int for toggling image reform
int pixWidth = 3; //default = 3
 
Pix[][] pix = new Pix[num][num];
 
void setup(){
  mandrake = loadImage("1.jpg");
  size(328, 328, P2D);
  noStroke();
  frameRate(25);
  for (int i=0; i<num; i+=pixWidth){
    for (int j=0; j<num; j+=pixWidth){
      pix[i][j] = new Pix(i, j, random(-1, 1), random(1, 2), i, j, random(0.1, 0.5), pixWidth);
    }
  }
}
 
void draw(){
  background(0);
 
  for(int i=0; i<num; i+=pixWidth){
    for(int j=0; j<num; j+=pixWidth){
      color pixel = mandrake.get(i, j);
      fill(pixel, 200);
      pix[i][j].display();
 
      if(keyState==1){
        mouseState=0;
        pix[i][j].reform();
      }
      else if(mouseState==1){
        keyState=0;
        pix[i][j].move();
      }
    }
  }
}
 
void mousePressed(){
  keyState=0;
  mouseState+=1;
  if (mouseState>1){
    mouseState=0;
  }
}
 
void keyPressed(){
  if (key==32){
    keyState+=1;
    mouseState=0;
    if(keyState>1){
      keyState=0;
    }
  }
}
 
class Pix{
  float x, y;
  float nx, ny;
  float ox, oy;
  float gravity;
  int w;
  int del=16;
 
  Pix(float _x, float _y, float _nx, float _ny, float _ox, float _oy, float _gravity, int _w){
    x = _x;
    y = _y;
    nx = _nx;
    ny = _ny;
    ox = _ox;
    oy = _oy;
    gravity = _gravity;
    w = _w;
  }
 
  void display(){
    noStroke();
    rectMode(CENTER);
    rect(x, y, w, w);
  }
 
  void move(){
    x = x+nx+gravity;
    y = y+ny+gravity;
 
    if(y>height || y<0){
      ny = ny * -0.4;
    }
    if(x>width || x<0){
      nx = nx * -0.4;
    }
  }
 
  void reform(){
    x+=(ox-x)/del;
    y+=(oy-y)/del;
  }
}


