
// Created by Vinnie Parlatore
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP
// Maison Curutchet by Le Corbusier 

int x = 4;
int y = 8;
int e = 4;
int p = 0;
int dir = 1;
int speed = 1;

void setup () {
  size (600, 800);
  background (0);
  frameRate(40);
}


void draw () {
  fill (0, 1);
  noStroke();
  rect(0, 0, 600, 800);
  stroke(p, width, width);
  line(p, 0, p, height);

  p +=speed*dir;
  if (p > width || p < 0) {
    dir = dir*-1;
  }

  int total_w = 400;
  int total_l = 600;
  fill (255);
  stroke(230, 130, 75);
  strokeWeight(12);
  rect(100, 100, total_w, total_l);

  int u = mouseX;
  int o = mouseY;

  strokeWeight(3);
  rect(100, 100, total_w, total_l);


  //top row of boxes
  fill (0.3*u, 0.3*o, 0.3*(u+o));
  stroke(170, 170, 255);
  rect(100, 100, total_w/x+0.3*u, total_l/y);
  rect(100+total_w/x+0.3*u, 100, total_w/x-0.1*u, total_l/y);
  rect(100+2*total_w/x+0.2*u, 100, total_w/x-0.1*u, total_l/y);
  rect(100+3*total_w/x+0.1*u, 100, total_w/x-0.1*u, total_l/y);


  //second row of boxes
  int y2 = 10;
  fill(0.2*(u+o), 0.15*u, 0.4*o);
  rect(100, 100+total_l/y, (total_w/x)-0.1*u, total_l/y2);
  rect((100+total_w/x)-0.1*u, 100+total_l/y, (total_w/x)-0.1*u, total_l/y2);
  rect((100+2*total_w/x)-0.2*u, 100+total_l/y, (total_w/x)-0.1*u, total_l/y2);
  rect((100+3*total_w/x)-0.3*u, 100+total_l/y, (total_w/x)+0.3*u, total_l/y2);


  //divider line
  stroke(230, 130, 75);
  strokeWeight(10);
  strokeCap (SQUARE);
  line(100, total_l/y2+107+total_l/y, 500, total_l/y2+107+total_l/y);


  //third row of boxes
  stroke(120, 240, 60);
  strokeWeight(6);
  int y3 = 4;
  fill(0.2*u, 0.4*o, 0.2*(u+o));
  rect(100, 115+total_l/y2+total_l/y, total_w/x+0.3*u, total_l/y3);
  rect((100+total_w/x)+0.3*u, 115+total_l/y2+total_l/y, (total_w/x)-0.1*u, total_l/y3);
  rect((100+2*total_w/x)+0.2*u, 115+total_l/y2+total_l/y, (total_w/x)-0.1*u, total_l/y3);
  rect((100+3*total_w/x)+0.1*u, 115+total_l/y2+total_l/y, (total_w/x)-0.1*u, total_l/y3);


  //fourth row of boxes
  int y4 = 13;
  fill(0.4*o, 0.2*(u+o), 0.2*o);
  rect(100, 115+total_l/y2+total_l/y+total_l/y3, (total_w/x)-0.1*u, total_l/y4);
  rect((100+total_w/x)-0.1*u, 115+total_l/y2+total_l/y+total_l/y3, (total_w/x)-0.1*u, total_l/y4);
  rect((100+2*total_w/x)-0.2*u, 115+total_l/y2+total_l/y+total_l/y3, (total_w/x)-0.1*u, total_l/y4);
  rect((100+3*total_w/x)-0.3*u, 115+total_l/y2+total_l/y+total_l/y3, (total_w/x)+0.3*u, total_l/y4);


  //prominent horizontal
  strokeWeight(30);
  strokeCap(SQUARE);
  line(100, total_l/y2+134+total_l/y+total_l/y3+total_l/y4, 500, total_l/y2+134+total_l/y+total_l/y3+total_l/y4);


  //fifth row of boxes
  int y5 = 6;
  strokeWeight(6);
  rect(100, 140+total_l/y2+total_l/y+total_l/y3+total_l/y4, total_w/x+0.3*u, total_l/y5);
  rect(100+total_w/x+0.3*u, 140+total_l/y2+total_l/y+total_l/y3+total_l/y4, total_w/x-0.1*u, total_l/y5);
  rect(100+2*total_w/x+0.2*u, 140+total_l/y2+total_l/y+total_l/y3+total_l/y4, total_w/x-0.1*u, total_l/y5);
  rect(100+3*total_w/x+0.1*u, 140+total_l/y2+total_l/y+total_l/y3+total_l/y4, total_w/x-0.1*u, total_l/y5);


  //door
  stroke(0);
  fill(0);
  rect(200, 175+total_l/y2+total_l/y+total_l/y3+total_l/y4+total_l/y5, total_w/8, 90);

}


