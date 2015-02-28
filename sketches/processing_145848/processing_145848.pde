
//timer objects 
Timer timer;
Timer timer1;



//an array of bezcritters
ArrayList<BezCritter> bezcritters;
ArrayList<BezOneLeg> bezonelegs;


//BezCritter bez1;
//BezCritter bez2;


void setup() {

  frameRate(30);
  size(1000, 1000);

  //the length of timer and start timer
  timer = new Timer(3000);
  timer1 = new Timer(6000);
  timer.start();
  timer1.start();

  //initialize bezcritters
  bezcritters = new ArrayList<BezCritter>();
  bezonelegs = new ArrayList<BezOneLeg>();
}

void draw() {
  background(20);                  // (0, 25, 109);
  // bezcritters.add(new BezCritter());
  //  bezonelegs.add(new BezOneLeg());

  for (int i = 0; i < bezcritters.size(); i++) {
    BezCritter b = (BezCritter) bezcritters.get(i);
    b .display();
    b .swimUp();
    if (bezcritters.size() > 25) {
      b .fadeOut();
      bezcritters.remove(0);
    }
  }

  for (int i = 0; i < bezonelegs.size(); i++) {
    BezOneLeg l = (BezOneLeg) bezonelegs.get(i);
    l .display();
    l .swimDown();
    if (bezonelegs.size() > 10) {
      l .fadeOut();
      bezonelegs.remove(0);
    }
  }

  ///// how do I use arraylists with timer ////////////////////////////

  if (timer1.isFinished()) {
    BezOneLeg myBezOneLeg = new BezOneLeg();
    bezonelegs.add(new BezOneLeg());                // bezonelegs = (BezOneLeg[]) append(bezonelegs, myBezOneLeg);
    timer1.start();     //restart timer
  }

  if (timer.isFinished()) {              //when timer is finished make new bezzies
    BezCritter myBezCritter = new BezCritter();
    bezcritters.add(new BezCritter());                     // bezcritters = (BezCritter[]) append(bezcritters, myBezCritter);
    timer.start();     //restart timer
  }

  // remove critters when arraylist gets to 100




  //////////////////////////////////////////////////////////

  /////      mouseClick to create bezzies
  /*void mousePressed() { 
   BezCritter myBezCritter = new BezCritter();
   bezcritters = (BezCritter[]) append(bezcritters, myBezCritter);
   } 
   */
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
  float oThin = 0;                //175;                 // alpha for thin bez
  float oThick = 0;             //75;              // alpha for thick bez
  float bezFill = 0;           //25;
  float oHead = 0;             //180;

  float afill = 1;   // fade out rect alpha


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
  float g;                // rgb stroke green
  float cx = (x1+x3)/2;      // calculate center of bezier 
  float cy = (y1+y3)/2;     // calculate center of bezier

  // critter head traits

  float hx;      // x value for head ellipse
  float hy;      // y value for head ellipse
  int headHeight;     // height of head ellipse
  int headWidth;      // width of head ellipse

  BezCritter() {                                     //(int centerX, int centerY) {    // passing through centerX and centerY // mouseX and mouseY values

    // critter head traits

    hx = random( 20, 800);                   //centerX;  //94    // head x value is centerX
    hy =  random(20, 800);                  //centerY;  //91    // head y value is centerY
    headHeight = 15;      // set height of head ellipse
    headWidth = 15;     // set width of head ellipse

    // bez traits  // give all bezier control and anchor points a value

    x1 = hx*2;                 //centerX*2; //mouseX //122  //x3 - 40
    y1 = hy*2;                 //centerY*2; // mouseY //237 //x3 + 115
    x2 = x1 + width/2;
    y2 = y1 + width;
    x3 = x1 - width/20;


    x5 =  x1;                        //centerX*2;  //71 //x7 - 40
    y5 =  y1;                        //centerY*2; //209 //x5 + 138
    x6 = x5 + width/2;
    y6 = y5 + width;
    x7 = x5 - width/20;

    ///////////////////////////////////////////

    speed = random(2, 6);   // set speed of swim
    s =  0;                    //random(90, 120);    // red stroke will be random
    g = 207;
    b =  172;                  //random(10, 60);     // blue in stroke color will be random
  }

  void display() {    // this is what the beziers look like

    // Fade in effect for BezzieOneLegs
    ///////////////////////////////////////////////
    if (bezFill <= 25) {
      bezFill = bezFill + .2;
      //bezFill++
    }
    if (oThin <= 175) {
      oThin = oThin + .2;
      //oThin++;
    }
    if (oThick <= 100) {
      oThick = oThick + .2;
      //oThick++;
    }
    if (oHead <= 180) {
      oHead = oHead + .2;
      // oHead++;
    }

    ///////////////////////////////////////////


    fill(s, b, g, bezFill);
    strokeWeight(sthin);
    stroke(s, b, g, oThin);
    smooth();
    bezier(x1, y1, x2, y2, x3, y1, hx, hy); // top bez
    fill(s, g, b, bezFill);
    bezier(x5, y5, x6, y6, x7, y5, hx, hy); //bottom bez
    strokeWeight(sthick);
    stroke(s, b, g, oThick);
    bezier(x5, y5, x6, y6, x7, y5, hx, hy);
    bezier(x1, y1, x2, y2, x3, y1, hx, hy); 
    fill(223, 221, 222, oHead);
    ellipse(hx, hy, headHeight, headWidth);
  }

  /* // print variables ///////////
   
   println(        );
   println(" x6= "+x6);
   println(" y6= "+x6);
   println(" x3= "+x3); 
   println(" y1= "+y1);
   
   println(" x7= "+x7);
   println(" y5= "+y5);
   
   /////////////////////////////
   
   
   }
   */

  void swimUp() {            // this is how the bezier moves across the screen

    oThin = 125;   ///// trying to change opacity a bit as it moves too. Eventually maybe fade out as it moves across the screen. 
    oThick = 100;
    hx = hx - speed/2;
    hy = hy - speed/2;

    x1 = x1 - speed/2;
    y1 = y1 - speed/2;
    x5 = x5 - speed;
    y5 = y5 - speed;

    x3 = x3 - speed;
    x7 = x7 - speed;
  }

  void fadeOut() {

    if (bezFill >= 25) {
      bezFill = bezFill - .2;
      //bezFill++
    }
    if (oThin >= 175) {
      oThin = oThin - .2;
      //oThin++;
    }
    if (oThick >= 100) {
      oThick = oThick - .2;
      //oThick++;
    }
    if (oHead >= 180) {
      oHead = oHead - .2;
      // oHead++;
    }
  }
  /*
    fill(20, afill);       /// trying to fade out bezzies
   noStroke();
   rect(0, 0, width, height);
   afill++;
   
   if(afill >= 255) {
   afill = 0;
   }
   
   }
   */
}

class BezOneLeg {

  // bez traits

  float sthin = random(2, 6);       //random stroke values
  float sthick = random(6, 10);     //random stroke thickness 
  float oThin =   0;      //175;                 // alpha for thin bez
  float oThick =  0;        //100;                // alpha for thick bez
  float bezFill = 0;         //25;               // alpha for bez curve shape 
  float oHead =  180;               // alpha for head ellipse

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

  float speed;                 // speed variable of swim

  int s;                   // rgb stroke red
  int g;                   // rgb green color
  int b;                    // rgb blue




  // critter head traits

  float hx;                // x value for head ellipse
  float hy;               // y value for head ellipse
  float headHeight;         // height of head ellipse
  float headWidth;           // width of head ellipse

  BezOneLeg() {            // passing through centerX and centerY // mouseX and mouseY values

    // critter head traits

    hx = random(20, 800);                       //centerX;  //94      // head x value is centerX
    hy = random(20, 800);                       //centerY;  //91       // head y value is centerY
    headHeight = random(10, 20);            // set height of head ellipse
    headWidth = random(10, 20);           // set width of head ellipse

    // bez traits     // give all bezier control and anchor points a value

    x1 = hx*2;                        //centerX; //mouseX //122  //x3 - 40
    y1 = hy*2;                        //centerY; // mouseY //237 //x3 + 115
    x2 = x1 + (width - width/6);
    y2 = y1 + width/6;
    x3 = x1 - width/20;


    x5 = hx/4;                    //centerX/4;  //71 //x7 - 40
    y5 = hy/4;                   //centerY/4; //209 //x5 + 138
    x6 = x5 + (width - width/6);
    y6 = y5 + width/6;
    x7 = x5 - width/20;

    ///////////////////////////////////////////

    speed = random(2, 4);       // set speed of swim
    s = 250;       // red stroke will be random
    g = 255;
    b = 255;          // blue in stroke color will be random
  }

  void display() {             
  
 // Fade in effect for BezzieOneLegs
  ///////////////////////////////////////////////
  if(bezFill <= 25) {
    bezFill++;
  }
  if(oThin <= 175) {
    oThin++;
  }
  if(oThick <= 100) {
    oThick++;
  }
/*  if(oHead <= 180) {
    oHead++;
  }
 */
  ///////////////////////////////////////////

  
    // this is what the beziers look like
   //////////////////////////////////////////
    fill(s, g, b, bezFill);
    strokeWeight(sthin);
    stroke(s, g, b, oThin);
    smooth();
    // bezier(x1, y1, x2, y2, x3, y1, hx, hy); // top bez
    bezier(x5, y5, x6, y6, x7, y5, hx, hy); //bottom bez
    // strokeWeight(sthick);
    stroke(s, g, b, oThick);
    // bezier(x5, y5, x6, y6, x7, y5, hx, hy);
    // bezier(x1, y1, x2, y2, x3, y1, hx, hy); 
    fill(255, 221, 222, oHead);
    ellipse(hx, hy, headHeight, headWidth);
    
  //////////////////////////////////////////


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

  void swimDown() {            // this is how the bezier moves across the screen
    if (hx < width) {
      hx = hx + speed;
      hy = hy + speed;
    }
    if (hx > width/2) {

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
  } 
  
   void fadeOut() {

    if (bezFill >= 25) {
      bezFill = bezFill - .2;
      //bezFill++
    }
    if (oThin >= 175) {
      oThin = oThin - .2;
      //oThin++;
    }
    if (oThick >= 100) {
      oThick = oThick - .2;
      //oThick++;
    }
    if (oHead >= 180) {
      oHead = oHead - .2;
      // oHead++;
    }
  }

    /*
 if(x1 > width && x5 > width) {
     oThin = 100;
     oThick = 75;
     
     
     
     hx = hx - width;
     hy = hy - width;
     
     x2 = x1 - width/4;
     y2 = y1 - width/4;
     x3 = x1 - width/4;
     
     x6 = x5 - width/3;
     y6 = y5 - width/3;
     x7 = x5 - width/2;
     
     x5 = (x5 - width + width/2 - speed);
     y5 = (y5 - width + width/2 - speed);
     x1 = (x1 - width + width/2 - speed);
     y1 = (y1 - width + width/2 - speed);
     
     
     } */
    
 
  } 
  


class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in millis
    savedTime = millis();
  }

  // The function isFinished() returns true if 5,000 ms have passed. 

  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }


}




  
  
   
   
   
  


