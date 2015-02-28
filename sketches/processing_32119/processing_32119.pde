
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
  stroke(39,25,247,40);
  strokeWeight(3);
}

void draw(){
  
  line(topleft1,topleft2,topleft3,topleft4); //top left hand side line
  topleft3 = topleft3 + 10;
  topleft4 = topleft4 - 10;
  
  line(bottomleft1,bottomleft2,bottomleft3,bottomleft4); //bottom left hand side
  bottomleft1 = bottomleft1 + 10;
  bottomleft2 = bottomleft2 + 10;
  
  //line(250,250,500,500); //bottom right hand side line
  
  //line(500,0,250,250); //top right hand side
}

