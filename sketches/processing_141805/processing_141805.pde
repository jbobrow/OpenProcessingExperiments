

//an array of bezcritters
BezCritter[] bezcritters;


//BezCritter bez1;
//BezCritter bez2;


void setup() {
 
  frameRate(30);
  size(800, 800);
  //initialize bezcritters
 bezcritters = new BezCritter[0];
 

 
}

void draw() {
   background(0);
 
for (int i = 0; i < bezcritters.length; i++) {
 bezcritters[i].display();
bezcritters[i].swim(); 
}
 
 
}

void mousePressed() {
  BezCritter myBezCritter = new BezCritter(mouseX, mouseY);
  bezcritters = (BezCritter[]) append(bezcritters, myBezCritter);
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
  
  int sthin = 2;
  int sthick = 8;
  
  int x1;
  int y1;
  int x2;
  int y2;
  int x3;
  int y3;
 
  int x5;
  int y5;
  int x6;
  int y6;
  int x7;
  int y7;

  
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
  headHeight = 15;
  headWidth = 15;
  
   // bez traits
 
  x1 = centerX; //mouseX //122  //x3 - 40
  y1 = centerY; // mouseY //237 //x3 + 115
  x2 = x1 + (width - width/6);
  y2 = y1 + width/6;
  x3 = x1 - width/20;
 
 
  x5 = centerX/4;  //71 //x7 - 40
  y5 = centerY/4; //209 //x5 + 138
  x6 = x5 + (width - width/6);
  y6 = y5 + width/6;
  x7 = x5 - width/20;
  
  speed = 8;


  }
  
void display() {

   noFill();
   strokeWeight(sthin);
  stroke(90, 0, 0, 175);
  smooth();
 bezier(x1, y1, x2, y2, x3, y1, hx, hy); // middle bez
 bezier(x5, y5, x6, y6, x7, y5, hx, hy); //bottom bez
 strokeWeight(sthick);
 stroke(90, 0, 20, 100);
 bezier(x5, y5, x6, y6, x7, y5, hx, hy);
  bezier(x1, y1, x2, y2, x3, y1, hx, hy); 
 fill(120, 0, 0, 180);
  ellipse(hx, hy, headHeight, headWidth);
}

void swim() {

 hx = hx + speed;
 hy = hy + speed;


 
 if(hx > width/2) {
   hx = hx + speed/2;
   hy = hy + speed/2;
   
  x3 = x3 + speed*2;
   x7 = x7 + speed*2;
  
   
  
  y2 = y2 + speed/2;
   y6 = y6 + speed;
   
   x1 = x1 + speed;
   y1 = y1 + speed;
   x5 = x5 + speed;
   y5 = y5 + speed;
   
 }
 
  
 /*if(hy > width/2 && y3 > width/2) {
     hy = hy - hy;
      y1 = y1 - y1;
     y2 = y2 - y2;
      y5 = y5 - y5;
      y6 = y6 - y6;
   
   } */

 
 



}



}


