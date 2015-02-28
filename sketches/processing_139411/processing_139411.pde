
BezCritter bez1;


void setup() {
  frameRate(15);
  size(500, 500);
  background(0);

bez1 = new BezCritter();  
}

void draw() {
 bez1.display();
 
}

/*
void bezcritter() {
  
  // bez traits
  
  int x1 = 122;
  int y1 = 237;
  int x2 = 372;
  int y2 = 287;
  int x3 = 107;
  int y3 = 237;
  int x4 = 94;
  int y4 = 98;
  
  // critter head traits
  
  int hx = 94;
  int hy = 91;
  int headHeight = 10;
  int headWidth = 10;
  
   noFill();
  stroke(90, 0, 0, 50);
  smooth();
 // bezier(218, 196, 468, 246, 203, 196, 94, 98); //top bez
 bezier(x1, y1, x2, y2, x3, y3, x4, y4); // middle bez
// bezier(71, 209, 321, 259, 56, 209, 94, 89); // bottom bez
 fill(120, 0, 0, 75);
  ellipse(hx, hy, headHeight, headWidth);
}
*/



class BezCritter {
  
  // bez traits
  
  int x1;
  int y1;
  int x2;
  int y2;
  int x3;
  int y3;
  int x4;
  int y4;
  
  int x5;
  int y5;
  int x6;
  int y6;
  int x7;
  int y7;
  int x8;
  int y8;
  
  
  // critter head traits
  
  int hx;
  int hy;
  int headHeight;
  int headWidth;
  
  BezCritter() {
   // bez traits
  
  x1 = 122;
  y1 = 237;
  x2 = 372;
  y2 = 287;
  x3 = 107;
  y3 = 237;
  x4 = 94;
  y4 = 98;
  
  x5 = 71;
  y5 = 209;
  x6 = 321;
  y6 = 259;
  x7 = 56;
  y7 = 209;
  x8 = 94;
  y8 = 89;
  
  
  // critter head traits
  
  hx = 94;
  hy = 91;
  headHeight = 10;
  headWidth = 10;
  }
  
void display() {
   noFill();
  stroke(90, 0, 0, 50);
  smooth();
 bezier(x1, y1, x2, y2, x3, y3, x4, y4); // middle bez
 bezier(x5, y5, x6, y6, x7, y7, x8, y8); //bottom bez
 fill(120, 0, 0, 75);
  ellipse(hx, hy, headHeight, headWidth);
}


}


  


