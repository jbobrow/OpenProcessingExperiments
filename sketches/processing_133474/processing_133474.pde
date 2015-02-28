
int topLineX=0;
int topLineY=100;
int topLineW = 100;

int middleLineX = topLineX;
int middleLineY = topLineY + 20;
int middleLineW = 200;

int bottomLineX = topLineX;
int bottomLineY = middleLineY + 20;
int bottomLineW = 150;

void setup() {
  size(400, 400);
}

void draw() {
  //need to reset the background to see it move
  background(255);
  
  //topLine
  line(topLineX, topLineY, topLineX + topLineW, topLineY);
  
  //middle line 
  line(middleLineX, middleLineY, middleLineX + middleLineW, middleLineY);
  
  //bottom line
  line(bottomLineX, bottomLineY, bottomLineX + bottomLineW, bottomLineY);
  
  //make each line move
  topLineX++;
  middleLineX = middleLineX +2; // this line will go faster because I am increasing by two, rather than one
  bottomLineX++;
  
  
}


