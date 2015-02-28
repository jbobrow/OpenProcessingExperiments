
// Object declaration
Fly fly1;  

//Array for dots
int dotnumber = 100;   //Array size
Dot [] manyDots = new Dot[dotnumber];  // new Array

//variables
boolean start = false; // checks if game has already started
int xFrog = 25;        // Size of the Frog
int yFrog = 35;
int count = 1;        // checks if fly is catched

void setup(){
  size(800,800); //window size
  smooth();
  
   //Initialize each Dot
  for(int i = 0; i < manyDots.length; i++){
    manyDots[i] = new Dot(random(1,255),random(0,800),random(100,800));
  }
  
  //Initialize Fly
  fly1 = new Fly(100, width/2, height/2, 25, 20);  
}


void draw(){
  background(255);
  
  //checks if Game has already startet, if not starts function beforeStart()
  if(start == false){
    beforeStart();
  } else{
    
//calls functions on objects
  // Fly
  fly1.moveFly();
  fly1.displayFly();
  
  //Frog
  drawFrog();
  
  // displays all dots
  for(int i= 0; i < manyDots.length; i++){
    manyDots[i].drawDot();
  }
  
  //Text
  fill(color(50,160,50));
  PFont font;
  font = loadFont("Verdana-15.vlw");    
  textFont(font, 15);
  text("Catch the fly with the frog", 30, 50);
  }
  
  // if fly is catched function end() starts
  if(count==0){
     end();
    }
} // End of draw


void beforeStart(){  // when varibale start is false this function runs
  fill(color(50,160,50));
  PFont font;
  font = loadFont("Verdana-15.vlw");    
  textFont(font, 40);
  text("Click to start the Game", 160, 360);
}

void mouseClicked() { //function to set start to true to start the game
  if (start == false){
  start = true;
  }
}

void drawFrog(){
    noStroke();
    fill(color(50,160,50));
    ellipse(mouseX, mouseY, xFrog ,yFrog);
    fill(0);
    ellipse(mouseX-4, mouseY-8, 5, 5);
    ellipse(mouseX+4, mouseY-8, 5, 5);
  }


void end(){ // function which runs when variable count is 0
   fill(color(50,160,50));
   rect(0,0,800,800);
   fill(color(255));
  PFont font;
  font = loadFont("Verdana-15.vlw");    
  textFont(font, 40);
  text("Yum Yum!", 310, 380);
}


class Dot{

//variables
  float cD;           // dot colour
  float xDot;         // x position of dot
  float yDot;         // y position of dot
  int dotSizeX = 40;  // dot size x direction
  int dotSizeY = 40;  // dot size y direction
  
  
//Constructor
  Dot(float cD_, float xDot_, float yDot_){
    cD = cD_;
    xDot = xDot_;
    yDot = yDot_;
  }
  
//Function
  //draw dot
  void drawDot(){
    ellipseMode(CENTER);
    noStroke();
    fill(cD);
    ellipse(xDot, yDot, dotSizeX, dotSizeY);
  }
}


class Fly{

// variables  
  color cF;          // color of fly
  float xFly;        // x position of fly
  float yFly;        // y position of fly
  float flyXspeed;   // x Speed of  fly
  float flyYspeed;   // y speed of fly
  int fly_sizeX = 20;// x size of fly
  int fly_sizeY = 10;// y size of fly


//Constructor
  Fly(color cF_, float xFly_, float yFly_, float flyXspeed_, float flyYspeed_){
    cF = cF_;
    xFly = xFly_;
    yFly = yFly_;
    flyXspeed = flyXspeed_;
    flyYspeed = flyYspeed_;
  }
  
 
//Functions
  void displayFly(){
    ellipseMode(CENTER);
    fill(cF);
    ellipse(xFly, yFly, fly_sizeX, fly_sizeY);
  }
  
  void moveFly(){
    //moving
    xFly += flyXspeed;
    yFly += flyYspeed;
    
    // let the flys stay inside the window
    if((xFly > width - fly_sizeX) || (xFly < 0 + fly_sizeX)){
      flyXspeed = flyXspeed * -1;
    }
    // let the flys stay inside the window
    if((yFly > height - fly_sizeY) || (yFly < 0 + fly_sizeY)){
      flyYspeed = flyYspeed * -1;
    }
    // when the mouse hits the fly the colour change
    if (mouseX <= xFly+fly_sizeX && mouseX >= xFly-fly_sizeX && mouseY <= yFly+fly_sizeY && mouseY >= yFly-fly_sizeY){
        cF=255; // set the colour to white so the fly disappears
        count=0; // set count to 0 this activates the end() function
    }
  }
}// end of class
 
