
//**Christopher Green - ISTA301 - Assignment 3

/*
  Global variables. 
*/
int blockNumber = 60; //the number of blocks on the screen
int blockSize;  //size of each block;
int textAlpha = 255;  //the alpha value for the text
Timer timer;  //timer for backgroud color change
ChangeColor bgColor;  //CC varible for the background  
FadingRect[] fp = new FadingRect[blockNumber]; //array of rectangles
PFont font;  //font for the text

/*
  Main setup method
*/
void setup() {
  size(720, 480, P2D);
  stroke(0,0,0,0);
  
  bgColor = new ChangeColor(0,0,0); 
  font = loadFont("Candara-Italic-48.vlw");
  blockSize = width/blockNumber;  //calculate block size

  //for loop to set up the blocks
  for(int x = 0; x < blockNumber; x++){
    fp[x] = new FadingRect(x*blockSize, blockSize, bgColor); 
  }
 
  timer = new Timer(); //get the timer instance, not starting timer yet.
}

/*
  Main draw method
*/
void draw() {
  //set the backgroud color, clearing the screen.
  background(bgColor.getR(), bgColor.getG(), bgColor.getB());
  
  //draw all blocks
  for(int x = 0; x < blockNumber; x++){
    fp[x].display();  
  }

  //check to see if timer is finished.
  if(timer.isFinished()){
    timer = new Timer();//get new instance of timer
    bgColor.change(); //change the color
    //set the color for block to the background
    for(int x = 0; x < blockNumber; x++){
      fp[x].setColorToBG();
    }
  }
  
  //alpha fader for the text.
  if(textAlpha > 0){
    textFont(font); 
    fill(255,textAlpha);
    text("Christopher Green", 15, 60);
    textAlpha--;
  }
  
}

/*
  FadingRect class is the representation for each block.
*/
class FadingRect{
  float a;  //this alpha value
  int x;  //this x coordinate
  int y;  //this y coordinate
  int s;  //this size value
  boolean active;  //is this block active?
  
  ChangeColor bgColor;  //pointer to the background color
  ChangeColor cc;  //this color instance
  
  
  /*
    Constructor.
  */
  FadingRect(int tempX, int tempS, ChangeColor tempCC){
    a = 255;  //alpha starts at full
    y = int(random(height));  //blocks start at the bottom of the screen
    x = tempX;  
    s = tempS;
    active = false;
    //create a new instance of the color value 
    cc = new ChangeColor(tempCC.getR(), tempCC.getG(), tempCC.getB());
    bgColor = tempCC;  //set the pointer.
  }
  
  
  /*
    Setter method that just stops drawing the blocks.
  */
  void setColorToBG(){
    active = false;
  }  
  
  /*
    Display method for this block
  */
  void display(){
    a = a - 1.5; //adjust the alpha as the block moves up.
    
    //when the mouseover a block
    if(!mousePressed && ((mouseX >= x) && (mouseX <= (x+s)))){
        y = mouseY - s/2; //move block the where the mouse is
        a = 255; //change it's alpha to full
    }else{ // else if not mouseover...
      y = y - 5; //move block up
      if(y <= -blockSize){ //reset values if block is at edge of screen 
        y = width;
        a = 255;
      }
    }
    
    //if mousepressed and mouseover...
    if(mousePressed && ((mouseX >= x) && (mouseX <= (x+s)))){
      timer.start(); //start timer
      cc.change();  //change color of block
      active = true; //set active to true;
    }else{
      //else just fill the block with current color and alpha.
      fill(cc.getR(),cc.getG(),cc.getB(),a);
    }
    
    //draw block. 
    if(active)
      rect(x,y, s, s);
  }
 
  
}


/*
  Color changing class.  More or less collect all color activities into
  one class.
*/
class ChangeColor{
  float r;  //red
  float g;  //green
  float b;  //blue

  /*
    Constructor.
  */
  ChangeColor(float tempR, float tempG, float tempB){
    //initial color of blocks
    r = tempR;
    g = tempG;
    b = tempB;
  }
  
  /*
    Randomly picks a color.
  */
  void change(){
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  /*
    Getter method for Red.
  */
  float getR(){
    return r;
  }
  
  /*
    Getter method for Green.
  */
  float getG(){
    return g;
  } 
  
  /*
    Getter method for Blue.
  */
  float getB(){
    return b; 
  }
}

/*
  Timer class for this specific usage.
*/
class Timer{
  int startTime; //holds the start time
  int timeSet;  //the amount of time that needs to pass.
  boolean alreadyStarted;  //has this timer been started?
  
  /*
    Constructor.
  */
  Timer(){
    startTime = -1;
    timeSet = -1;
    alreadyStarted = false;
  }
  
  /*
    Start method that starts the timer.
  */
  boolean start(){
    //if the timer is not already started...
    if (!alreadyStarted){
      startTime = millis(); //get the current timer
      //get a random value between 20 and 30 secs.
      timeSet = int(random(20000,30000)); 
      alreadyStarted = true; //set already started to true.
      return true; //return true.
    }
     
    return false; //return false when the timer has already been started.
    
  }
  
  /*
    Method to check when the timer has finished.
  */
  boolean isFinished(){
    //if the timer has been started...
    if(alreadyStarted){
      //calc to see if the timer is finished
      if((millis() - startTime) >= timeSet){
        alreadyStarted = false; //set alreadystarted to false.
        return true; //return true;
      }
    }
    
    return false; //return false if not already started or timer is not finished.
  }    
        
}


