
int x;
int y;
int x1;
int y1;
int xdirection;
int ydirection;
int xdirection1;
int ydirection1;

void setup(){
  size(600, 600);
  x = 100;
  y = 500;
  x1 = 100;
  y1 = 100;
  xdirection = 2;
  ydirection = 2;
  xdirection1 = 2;
  ydirection1 = 2;
}

void draw(){
  background(90, 11, 34);
  x += xdirection;
  y += ydirection;
    if(y > 600){
      ydirection = 2;
    }
    if(x > 600){
      xdirection = -2;
    }
    if(x > 600){
      xdirection = -2;
    }
    if (y > 600){
      ydirection = -2;
    }
    if(y < 1){
      ydirection = 2;
    }
    if(x < 1){
      xdirection = 2;
    }
    if(x < 1){
      xdirection = 2;
    }
    if(y < 1){
      ydirection = 2;
    }
  
  noStroke();
  ellipse(x, y, 60, 60);
  fill(230, 23, 122);
  ellipse(x, x, 40, 40);
  fill(200, 43, 120);
  ellipse(y, y, 50, 50);
  fill(230, 53, 115);
  ellipse(y, x, 70, 70);
  fill(242, 24, 123);
  
}

