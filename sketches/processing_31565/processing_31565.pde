
int x1 = 0;
int y1 = 0;
int x2 = 0;
int y2 = 500;
int x21 = 0;
int y21 = 0;
int x22 = 500;
int y22 = 0;
int x321 = 0;
int y321 = 500;
int x322 = 0;
int y322 = 0;

void setup(){
  
  size(500,500);
  background(0);
  stroke(33,41,234,50);
}

void draw(){
  
  line(x1,y1,x2,y2);
  y1 = y1 + 10;
  x2 = x2 + 10;
  line(x21,y21,x22,y22);
  x21 = x21 + 10;
  y22 = y22 + 10;
  line(x321,y321,x322,y322);
  x322 = x322 + 10;
  y322 = y322 + 10;
  line(y321,x321,x322,y322);
}

