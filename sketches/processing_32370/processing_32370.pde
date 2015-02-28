
int topleftx = 0;
int toplefty = 0;
int toprightx = 500;
int toprighty = 0;
int x1 = 0;
int y1 = 0;
int x2 = 0;
int y2 = 500;
int x21 = 0;
int y21 = 0;
int x22 = 500;
int y22 = 0;
int bottomtopx = 500;
int bottomtopy = 500;
int bottomdownx = 0;
int bottomdowny = 500;

void setup(){
  
  size(500,500);
  background(255);
  stroke(154,35,191,40);
  strokeWeight(3);
}

void draw(){
  
  line(topleftx,toplefty,toprightx,toprighty);
  toplefty = toplefty + 10;
  toprightx = toprightx - 10;
   line(x1,y1,x2,y2);
  y1 = y1 + 10;
  x2 = x2 + 10;
  line(x21,y21,x22,y22);
  x21 = x21 + 10;
  y22 = y22 + 10;
  line(bottomtopx,bottomtopy,bottomdownx,bottomdowny);
  bottomtopy = bottomtopy - 10;
  bottomdownx = bottomdownx + 10;
}

