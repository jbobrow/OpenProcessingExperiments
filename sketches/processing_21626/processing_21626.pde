
PImage snowflake;
int num = 800; //number of particles
int pixWidth = 1; //can also try different numbers above 1

Pix[][] pix = new Pix[num][num]; //creating 2D array

void setup() {
  snowflake = loadImage("snowflake.jpg");
  snowflake.loadPixels();
  size(509, 339, P2D); //using P2D because otherwise it's too slow 
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      pix[i][j] = new Pix(i, j, random(-1, 1), random(1, 2), i, j, random(0.1, 0.5), pixWidth); //random values control how far pixels will move in all directions
    }
  }
}

void draw() {
  //background(0); //make active for a different effect of a plain black screen rather than streaks
  for(int i=0; i<num; i++) {
    for(int j=0; j<num; j++) {
      color pixel = snowflake.get(i, j);
      fill(pixel, 255);
      pix[i][j].display();
    }

    if(mousePressed==true) {  //click and hold mouse to watch animation
      for(int j=0; j<num; j++) {
        color pixel = snowflake.get(i, j);
        pix[i][j].move();
      }
    }
  }
}


class Pix { //gravity code
  float x, y;
  float nx, ny;
  float ox, oy;
  float gravity;
  int w;
  int del=16;

  Pix(float _x, float _y, float _nx, float _ny, float _ox, float _oy, float _gravity, int _w) {
    x = _x;
    y = _y;
    nx = _nx;
    ny = _ny;
    ox = _ox;
    oy = _oy;
    gravity = _gravity;
    w = _w;
  }

  void display() {
    noStroke();
    rectMode(CENTER);
    rect(x, y, w, w);
  }

  void move() {
    x = x+nx+gravity;
    y = y+ny+gravity;

    if(y>height || y<0) {
      ny = ny * -0.4;
    }
    if(x>width || x<0) {
      nx = nx * -0.4;
    }
  }
}


