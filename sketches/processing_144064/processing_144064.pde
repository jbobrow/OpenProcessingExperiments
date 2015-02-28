

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
   background(20);
 
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
  
  float sthin = random(2, 6);      //random stroke values
  float sthick = random(6, 10);    //random stroke thickness 
  int oThin = 175;                 // alpha for thin bez
  int oThick = 100;              // alpha for thick bez
  
  
  // all bezier anchor and control points
  float x1;
  float y1;
  float x2;
  float y2;
  float x3;
  float y3;
 
  float x5;
  float y5;
  float x6;
  float y6;
  float x7;
  float y7;

 /////////////////////////////////////////////

 
  float speed;           // speed variable of swim
  float b;                // rgb blue
  float s;                // rgb stroke red
  float cx = (x1+x3)/2;      // calculate center of bezier 
  float cy = (y1+y3)/2;     // calculate center of bezier
  
  // critter head traits
  
  float hx;      // x value for head ellipse
  float hy;      // y value for head ellipse
  int headHeight;     // height of head ellipse
  int headWidth;      // width of head ellipse
  
  BezCritter(int centerX, int centerY) {    // passing through centerX and centerY // mouseX and mouseY values
    
   // critter head traits
  
  hx = centerX;  //94    // head x value is centerX
  hy = centerY;  //91    // head y value is centerY
  headHeight = 15;      // set height of head ellipse
  headWidth = 15;     // set width of head ellipse
  
   // bez traits  // give all bezier control and anchor points a value
 
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
  
  ///////////////////////////////////////////
  
  speed = 1;   // set speed of swim
  s = random(90, 120);    // red stroke will be random
  b = random(10, 60);     // blue in stroke color will be random


  }
  
void display() {    // this is what the beziers look like

   noFill();
   strokeWeight(sthin);
  stroke(s, 0, 0, oThin);
  smooth();
 bezier(x1, y1, x2, y2, x3, y1, hx, hy); // top bez
 bezier(x5, y5, x6, y6, x7, y5, hx, hy); //bottom bez
 strokeWeight(sthick);
 stroke(s, 0, b, oThick);
 bezier(x5, y5, x6, y6, x7, y5, hx, hy);
  bezier(x1, y1, x2, y2, x3, y1, hx, hy); 
  fill(s, 0, 0, 180);
  ellipse(hx, hy, headHeight, headWidth);
  
/* // print variables ///////////
  
   println(        );
   println(" x6= "+x2);
   println(" y6= "+x6);
   println(" x3= "+x3); 
   println(" y1= "+y1);

   println(" x7= "+x7);
   println(" y5= "+y5);
   
 /////////////////////////////
  */

}

void swim() {            // this is how the bezier moves across the screen
if(hx < width) {
 hx = hx - speed;
 hy = hy - speed;


}
 if(hx > width/2) {
   oThin = 125;   ///// trying to change opacity a bit as it moves too. Eventually maybe fade out as it moves across the screen. 
   oThick = 100;
   hx = hx - speed/2;
   hy = hy - speed/2;
   
 x3 = x3 - speed;
   x7 = x7 - speed;
  
   
  
   y2 = y2 - speed;
   x6 = x6 - speed;
   y6 = y6 - speed;
   
  x1 = x1 - speed;
   y1 = y1 - speed;
  x5 = x5 - speed;
   y5 = y5 - speed;
   x2 = x2 - speed;
   
 
  
 }  /// trying to figure out how to get the end points unstuck as it moves backwards.
//// Pretty sure it has something to do with the variables going negative. But not sure how to fix it yet.  

if(x7 <= 0) {
  x7 = 2;
}

if(y5 <= 0) {
  y5 = 2;
}
  

 
 



}


}



