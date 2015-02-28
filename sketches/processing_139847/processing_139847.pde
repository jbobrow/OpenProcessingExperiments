
BezCritter bez1;
BezCritter bez2;


void setup() {
  background(0);
  frameRate(20);
  size(800, 800);
 

 
}

void draw() {
   if(bez1 != null){

 bez1.display();
 bez1.swim(); 

   }
 
}

void mousePressed() {
  bez1 = new BezCritter(mouseX, mouseY); 
  
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
  
  int speed;
  
  
  // critter head traits
  
  int hx;
  int hy;
  int headHeight;
  int headWidth;
  
  BezCritter(int centerX, int centerY) {
    
   // critter head traits
  
  hx = centerX;  //94
  hy = centerY;  //91
  headHeight = 10;
  headWidth = 10;
  
   // bez traits
  
  x1 = 122; //mouseX
  y1 = 237; // mouseY
  x2 = x1 + (width - width/6);
  y2 = y1 + width/6;
  x3 = x1 - width/20;
  y3 = y1;
  x4 = hx;
  y4 = hy;
  
  x5 = 71;
  y5 = 209;
  x6 = x5 + (width - width/6);
  y6 = y5 + width/6;
  x7 = x5 - width/20;
  y7 = y5;
  x8 = hx;
  y8 = hy;
  
  speed = 10;


  }
  
void display() {
   background(0);
   noFill();
  stroke(90, 0, 0, 200);
  smooth();
 bezier(x1, y1, x2, y2, x3, y3, x4, y4); // middle bez
 bezier(x5, y5, x6, y6, x7, y7, x8, y8); //bottom bez
 fill(120, 0, 0, 175);
  ellipse(hx, hy, headHeight, headWidth);
}

void swim() {

 hx = hx + speed;
 hy = hy + speed;
 x4 = x4 + speed;
 y4 = y4 + speed;
 x8 = x8 + speed;
 y8 = y8 + speed;
 
 if(hx > width/2) {
   
   x3 = x3 + speed;
   y3 = y3 + speed;
   x7 = x7 + speed;
   y7 = y7 + speed;
   
   x2 = x2 + speed/2;
   y2 = y2 + speed/2;
   x6 = x6 + speed/2;
   y6 = y6 + speed/2;
   
   x1 = x1 + speed/3;
   y1 = y1 + speed/3;
   x5 = x5 + speed/3;
   y5 = y5 + speed/3;
   
 }
 
  if(hx > width && x3 > width && x4 > width && x7 > width && x8 > width) {
     hx  = hx - hx;
     x1 = x1 - x1;
     x2 = x2 - x2;
      x3 = x3 - x3;
      x4 = x4 - x4;
      x5 = x5 - x5;
      x6 = x6 - x6;
      x7 = x7 - x7;
      x8 = x8 - x8;
      
   }
 if(hy > width && y3 > width && y4 > width && y7 > width && y8 > width) {
     hy = hy - hy;
      y1 = y1 - y1;
     y2 = y2 - y2;
      y3 = y3 - y3;
      y4 = y4 - y4;
      y5 = y5 - y5;
      y6 = y6 - y6;
      y7 = y7 - y7;
      y8 = y8 - y8;
   }

 
 



}



}


