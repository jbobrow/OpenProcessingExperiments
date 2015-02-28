
/* In this code there is a bouncing ball (you can make more)
   and 4 blocks if you activate a block (by clicking on it)
   it will make a sound if the ball touches it.
   You can deactivate it when you click on it again
*/
import ddf.minim.*;
Minim minim;
AudioSample [] AudioSamples = new AudioSample[4];

Blocks [] myBlocks = new Blocks [4];

Ball[] myBall = new Ball[1];
//the x and y position of the ball
float x_position = random (50,250);
float y_position = random (50,250);

void setup (){
  size(300,300);
  // load the sounds
  minim = new Minim(this);
  AudioSamples[0] = minim.loadSample("chime.wav", 2048);
  AudioSamples[1] = minim.loadSample("church.mp3",2048);
  AudioSamples[2] = minim.loadSample("gong.aiff",2048);
  AudioSamples[3] = minim.loadSample("ship.wav",2048);
  
  
  for (int i = 0; i < myBlocks.length; i ++) {
    myBlocks[i] = new Blocks();
  }
  
  for (int i = 0; i < myBall.length; i ++) {
    myBall[i] = new Ball();
  }
}

void draw (){
  background(0);
  for (int i = 0; i < myBall.length; i++){
    // operate Ball object
    // call the classes and voids
    //move the ball
    myBall[i].move();
    //draw the ball
    myBall[i].drawball();
    //display the blocks
    myBlocks[i].display();
    //trigger the sound when te block is active
    myBlocks[i].trigger();
  }
}

// the class for the bouncing ball
class Ball {
  color c_ball;  
  float bounce;
  float xdirection; 
  float ydirection;
  int xs, ys;
  float s;
  float r;
  
  Ball(){
    // color of the ball
    c_ball = color(random (0,255),random (0,255), random (0,255));
    // the moving direction
    xdirection=2;
    ydirection=3;
    // the speed
    xs=1;
    ys=1;
  }
  
  // makes the ball move
  public void move () {
    x_position += xdirection*xs;
    y_position += ydirection*ys;
    if (x_position>width-30 || x_position < 30) 
    {
      xdirection = -xdirection;
    }
    if (y_position>height-30 || y_position < 30) 
    {
      ydirection= -ydirection;
    }
  }
  
  // draw the ball
   void drawball() {
     fill(c_ball);
     ellipseMode(CENTER);
     ellipse(x_position,y_position,20,20);
   }
}

// the class for the blocks
class Blocks {
  boolean active0;
  boolean active1;
  boolean active2;
  boolean active3;

// draws the blocks they have a different color when they are active and when they are not active
  void display() {    
    if (active0) fill(0,0,255);
    else fill (102,153,255);
    rect(0,20,20,height-40);
    
    if (active1) fill(0,255,0);
    else fill (153,255,153);
    rect(width-20,20,20,height-40);
    
    if (active2) fill(255,255,0);
    else fill (255,255,153);
    rect(20,0,width-40,20);
    
    if (active3) fill(255,0,0);
    else fill(255,102,102);
    rect(20,height-20,width-40,20);
  }
  
  // makes the sound play if the block is actie
  void trigger()  { 
    if(active0){
      if (x_position<31){ AudioSamples[0].trigger();}
    }
    if(active1){
      if (x_position>width-32){ AudioSamples[1].trigger();}
    }
    if(active2){
      if (y_position<31) {AudioSamples[2].trigger();}
    }
    if(active3){
      if (y_position>height-31){ AudioSamples[3].trigger();}
    }
  }

  /* checks the position of the mouse and if it meets the conditions that are in the 'if'
     it will activate or deactivate the block
  */
  void checkMouse(int xpos, int ypos) {
    if (((xpos<20) && (ypos>20) && (ypos<(height-20))))  {
      if(mousePressed)     {
        if (active0) active0 = false;
        else active0 = true;
      }
    }
    if (((xpos>(width-20)) && (ypos>20) && (ypos<(height-20))))  {
      if(mousePressed)     {
         if (active1) active1 = false;
         else active1 = true;
      }
    }
    if (((xpos>20) && (xpos<(width-20)) && (ypos<20)))  {
      if(mousePressed)     {
        if (active2) active2 = false;
         else active2 = true;
      }
    }
    if (((xpos>20) && (xpos<(width-20)) &&(ypos>(height-20))))  {
      if(mousePressed)     {
        if (active3) active3 = false;
        else active3 = true;
      }
    }
  }
}

void mousePressed(){
  for (int i=0;i<1;i++)  {
    if (i < myBlocks.length){ 
      myBlocks[i].checkMouse(mouseX,mouseY);
    }
  }
}

// closes the minum audio cases
void stop(){
  for (int i = 0; i<4 ; i++)  {
    AudioSamples[i].close();
  }
  minim.stop();
  super.stop();
}



