
int topleft1 = 0;
int topleft2 = 0;
int topleft3 = 250;
int topleft4 = 250;

int bottomleft1 = 250;
int bottomleft2 = 250;
int bottomleft3 = 0;
int bottomleft4 = 500;

int bottomright1 = 250;
int bottomright2 = 250;
int bottomright3 = 500;
int bottomright4 = 500;

int topright1 = 500;
int topright2 = 0;
int topright3 = 250;
int topright4 = 250;

void setup(){
  
  size(500,500);
  background(0);
  stroke(24,180,121,40);
  strokeWeight(3);
}

void draw(){
  
  line(topleft1,topleft2,topleft3,topleft4); //top left hand side line
  topleft3 = topleft3 - 10;
  topleft4 = topleft4 + 10;
  
  line(bottomleft1,bottomleft2,bottomleft3,bottomleft4); //bottom left hand side
  bottomleft1 = bottomleft1 + 10;
  bottomleft2 = bottomleft2 + 10;
  
  line(bottomright1,bottomright2,bottomright3,bottomright4); //bottom right hand side line
  bottomright1 = bottomright1 + 10;
  bottomright2 = bottomright2 - 10;
  
  line(topright1,topright2,topright3,topright4); //top right hand side
  topright3 = topright3 - 10;
  topright4 = topright4 - 10;

}

