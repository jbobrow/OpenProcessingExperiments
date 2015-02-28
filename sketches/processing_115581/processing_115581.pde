
House[] houses=new House[10];

void setup() {
  size(400, 400);
  rectMode(CORNER);
  int x=0;
  int y=height-20;
  background(255);
  for (int i=0; i<houses.length;i++) {
    houses[i]= new House(x, y);   
    x+=houses[i].hausWidth;
  }
  fill(5);
  noStroke();
  rect(0, height-20, width, height);
}


void draw() {


  for (int i=0; i<houses.length;i++) {
    houses[i].draw();
  }

  fill(0, random(255), 0);
  rect(int(random(width)), int(random(height-20, height)), 1, int(random(1, 6)));
}


class House {

  color col;
  int x, y;
  float hausWidth;
  float hausHeight;

  //constructor
  House(int xloc, int yloc) {
    x=xloc;
    y=yloc;    //?
    col= color((int)random(100, 255), 0, 0);
    hausWidth=(int)random(30, 70);
    hausHeight=(int)random(30, 100);
  }

  void draw() {
    noStroke();
    fill(col);
    rect(x, y-hausHeight, hausWidth, hausHeight);
    triangle(x, y-hausHeight, x+hausWidth, y-hausHeight, x+hausWidth/2, (y-hausHeight)-hausWidth/2);
  }
}



