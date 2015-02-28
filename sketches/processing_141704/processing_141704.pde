
PImage[] pics = new PImage[2]; //<>//
//Declares images, ready to be filled in later
PFont neue;
//Declares the font for the timer
int x=30;
int xhigher=250;
int y=180;
int speed=2;
//Sets values for the table movement
float xarc=70;
float xarc2=xarc;
float xarclower=290;
float xarc2lower=xarclower;
float yarc=238;
float yarclower=358;
//Sets values for the chair movement. Much more complicated :p
int stopper = 0; 
int stop=0; 
int stop2=0;
//Sets values for use in stopping infinite movement
int actualTime;
//Sets values for the timer/clock for the countdown
void setup() {
  DrawFurniture tcb = new DrawFurniture();
  size(/*1*/400, 400);  //Set the size at 400x400 pixels, the limit for the static
  //smooth(); //Enablle anti-aliasing
  tcb.drawCarpet();}

void draw() {
  DrawFurniture tcb = new DrawFurniture();
  Motion m = new Motion();
  //Births all the classes for use here
  tcb.drawCarpet();//Draws the carpet image before anything else
  tcb.drawTables(); //Draws the tables with constructors
  tcb.drawChairs(5);//Same for chairs
  tcb.drawBoard(); //Draws the SmartBoard
  m.motion(160); //Makes the tables move with a constructor
  //to stop the movmement after they go off the screen
  if (stopper==160) {//Makes the chairs move AFTER the tables move
    m.chairMotion(155, 80); //Moves the chairs into a circle
  }
  if (stop2==80) {//Starts the time after the chairs finish moving
    tcb.theTimer(18000);
  }
}
class DrawFurniture {
  void drawCarpet() {
    pics[0]=loadImage("rug0.jpg"); //Loads the rug picture
    image(pics[0], 0, 0); //places the rug onscreen
  }

  void drawTables() {
    rectMode(CORNER);
    fill(#B542D8); //Makes a light purple-ish fill
    stroke(0);
    strokeWeight(3); //Outlines the following desks
    rect(x, y, 130, 50, 20);
    rect(x, y+120, 130, 50, 20);
    rect(xhigher, y, 130, 50, 20);
    rect(xhigher, y+120, 130, 50, 20); //Creates the 4 desks
  }

  void drawChairs(int rot) {
    if (actualTime == -1) {
//    translate(200,300);//Moves the origin point for easier
//    rotateX(rot);
//    rotateY(rot);
//    rotateZ(rot); 
    }
    strokeWeight(6); //Increases the outline to something more pronounced
    fill(#D8A642); //Fills the chairs with an orange-ish color

    arc(xarc, yarc, 30, 25, 0, PI);
    arc(xarc+45, yarc, 30, 25, 0, PI);
    arc(xarclower, yarc, 30, 25, 0, PI);
    arc(xarclower+45, yarc, 30, 25, 0, PI); //Chairs of the first row

    arc(xarc2, yarclower, 30, 25, 0, PI);
    arc(xarc2+45, yarclower, 30, 25, 0, PI);
    arc(xarc2lower, yarclower, 30, 25, 0, PI);
    arc(xarc2lower+45, yarclower, 30, 25, 0, PI); //Chairs of the second row
  }

  void drawBoard() { 
    pics[1] = loadImage("greenblackboard.jpg"); //Loads 2nd picture
    fill(255);
    strokeWeight(5);
    rect(80, 50, 230, 70); //Creates a smartboard
    image(pics[1], 80, 50);//Loads the picture over it
  }

  void theTimer(int totalTime) {//Countsdown to the beginning of the music show
    int savedTime = millis();
    //int passedTime=savedTime-millis();
    int remainingTime = totalTime-savedTime;
    actualTime = (remainingTime/1000);
    if (remainingTime<totalTime) {
      clock();
    }
  }

  void clock() {
    neue = loadFont("HelveticaNeue-MediumCond-72.vlw"); 
    textFont(neue); //Loading the font type
    textAlign(CENTER, CENTER); //Sets up font settings
    if (actualTime>-1) {
    text(actualTime, 190, 200);
    } else if (actualTime == -1) {
        text("", -100, 100);
    }
  }
}
class Motion { //<>//
  void motion(int counter) {
    if (stopper<counter) {//Stops movement after going offscreen
      //to prevent slowdown
      x = x-speed; //Moves tables to left if they're on the left side
      xhigher = xhigher+speed; //Moves tables to right if they're on the right side
      stopper++;
    }
  }

  void chairMotion(int counter, int counter2) {
    if (stop<counter) {//Stops movement after going offscreen
      //to prevent slowdown
      xarc=xarc+1;
      xarclower=xarclower-1;
      xarc2=xarc2+1;
      xarc2lower=xarc2lower-1; //Moves everything left/right
      //            if (xarc==xarc2) {
      //              background(127);
      //            }//Collosion detection (sort of; doesn't work right now)
      stop++;
    }

    if (stop==counter) {//When the above is finished
      //we go to move the y values
      if (stop2<counter2) {      
        yarc=yarc+1;
        yarclower=yarclower-1;
        //      if (dist(xarc,yarc,xarc2,yarc))<60.0 {
        //        fill(255); 
        //      }//Collosion detection (sort of; doesn't work right now)
        stop2++;
      }
    }
  }
}


