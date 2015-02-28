
int topleftx = 0;
int toplefty = 0;
int toprightx = 500;
int toprighty = 0;
int bottomtopx = 500;
int bottomtopy = 500;
int bottomdownx = 0;
int bottomdowny = 500;

void setup(){
  
  size(500,500);
  background(0);
  stroke(191,59,39);
  strokeWeight(3);
}

void draw(){
  
  line(topleftx,toplefty,toprightx,toprighty);
  toplefty = toplefty + 10;
  toprightx = toprightx - 10;
  line(bottomtopx,bottomtopy,bottomdownx,bottomdowny);
  bottomtopy = bottomtopy - 10;
  bottomdownx = bottomdownx + 10;
}

