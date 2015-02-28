
int topleft1 = 0;
int topleft2 = 0;
int topleft3 = 250;
int topleft4 = 250;

int bottomleft1 = 250;
int bottomleft2 = 250;
int bottomleft3 = 0;
int bottomleft4 = 500;

void setup(){
  
  size(500,500);
  background(0);
  stroke(240,113,39,40);
  strokeWeight(3);
}

void draw(){
  
  line(topleft1,topleft2,topleft3,topleft4); //top left hand side line
  topleft1 = topleft1 + 10;
  topleft2 = topleft2 - 10;
  
  line(bottomleft1,bottomleft2,bottomleft3,bottomleft4); //bottom left hand side
  bottomleft3 = bottomleft3 + 10;
  bottomleft4 = bottomleft4 + 10;  
}

