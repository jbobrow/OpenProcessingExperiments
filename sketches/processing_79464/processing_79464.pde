
/*
J. Dailey
 Code derived from:
 "" & "" by Brian Schrank, Phd.
 
 
 Top-down sprite is credited to Prinz Eugn via GameDev.net
 */
PFont font;

int timer = 21; //this is the countdown tim
int timeLast = 0;

int stack = 0;
int success = 0; //Comet misses strike.
//this is the variable where we store the last known second

//
PImage Earth,BG,BG2;  int BG_y = 0; 
int Earth_x = 45; int Earth_y = 460;

// Number of animation frames in the animation.
int framesCursor = 0; //Cursor.
int numFramesCursor = 4;
//
int Cursor_x = 10;
int Cursor_y = 440;
// "Frame rate" for the images.
PImage[] imagesCursor = new PImage[numFramesCursor];

int framesHolderGrab = 0; //
int numFramesHolderGrab = 4; // Holding animation.
PImage[] imagesHolderGrab = new PImage[numFramesHolderGrab]; 


//Comet
int Comet_x = 0;
float Comet_y = 0;
float CometSpeed = 0;
int framesComet = 0; //
int numFramesComet = 5; // Holding animation.
PImage[] imagesComet= new PImage[numFramesComet];

//imagesHolderHolding;
int Holder_x = 0;
int Holder_y = 0;



/* 
 int framesHolderIdle = 0; //Cursor.
 int numFramesHolderIdle = 3;
 PImage[] imagesHolderIdle = new PImage[numFramesHolderIdle];
 */
PImage imagesHolderIdle;

void setup()
{
  //
  frameRate(30);
  timeLast = second(); 
  
  size(220, 500);
  background(0, 102, 153);
 
  //Background

  BG2 = loadImage("BG_2.png"); // transparent
  //Earth
  Earth = loadImage("Earth.png");
  //Holder images, which reqires no animation.
  imagesHolderIdle = loadImage("Holder_Idle.png");
  
  // imagesHolderHolding = loadImage("Holder_Ani003.png");

  //Holder images, requiring animation. "Grabing"
  imagesHolderGrab[0] = loadImage("Holder_Idle.png");
  imagesHolderGrab[1] = loadImage("Holder_Ani003.png");
  imagesHolderGrab[2] = loadImage("Holder_Ani003.png");
  imagesHolderGrab[3] = loadImage("Holder_Ani003.png");

  //Cursor
  imagesCursor[0] = loadImage("Cursor001.png");
  imagesCursor[1] = loadImage("Cursor002.png");
  imagesCursor[2] = loadImage("Cursor003.png");
  imagesCursor[3] = loadImage("Cursor004.png");
  //imagesCursor[] = loadImage("Cursor'''.png");

  //
  imagesComet[0] = loadImage("Comet01.png");
  imagesComet[1] = loadImage("Comet01.png");
  imagesComet[2] = loadImage("Comet01.png");
  imagesComet[3] = loadImage("Comet01.png");
  imagesComet[4] = loadImage("Comet02.png");

  CometSpeed = 5;
  
  text("Timer: " + timer + " second(s) left", 25, 40);
  text("Stack Bonus:  +" +  stack + "  second(s)", 25,25); fill(0);
  
  
  //image(imagesComet[framesComet], Comet_x, Comet_y - 80); 
}

void draw()
{
  background(0, 102, 153);
  font = loadFont("Dialog.bold-20.vlw");
  //
  _Cursor();
  _Holder();
  _Comet();
  
  //
  textAlign(LEFT);
  text("Timer: " + timer + " second(s) left", 25, 40);
  text("Stack Bonus:  +" +  stack + "  second(s)", 25,25); fill(0);

  //Coordinates 10,60,110,160.
  image(imagesComet[framesComet], Comet_x, Comet_y - 80);    
  Comet_y -= -(CometSpeed);

  translate(0, 0);
  //Background
  image(BG2, 0, BG_y, width, height);
  BG_y += 1;
  
  if (BG_y >= 230)
  { BG_y = 0; }
  
  image(Earth, Earth_x, Earth_y); 

  //
  if (timer > 0)
  { //this runs the game as long as the timer hasn't run out
    game(); //this runs a method we created called "game()"
  }
  else
  { 
   fill(0, 102, 153); rect(-1, -1, width, height);fill(0);
   textAlign(CENTER); text("Comets have destroyed the Earth!", width/2, height/2); fill(0, 102, 153);
  }
     
  if (dist(Comet_x, Comet_y, Earth_x, Earth_y) <= 50)
  {
    fill(0, 102, 153); rect(-1, -1, width, height);fill(0);  
   // This previents menu interruption.
   // if (Comet_y += 0;)
    textAlign(CENTER); text("Comets have destroyed the Earth!", width/2, height/2); fill(0, 102, 153); exit();
  }
  
}

void keyPressed()
{ 
   //Coordinates 10,60,110,160.
    if (dist(Holder_x, Holder_y, Comet_x, Comet_y) <= 65)
  {
  if (keyCode == UP)
    {
       Comet_y -=  CometSpeed * random(1,10);
       stack += .5;
    }
  }
  if (keyCode == ' ')
    {
      if (stack >= 10) { 
        timer += stack; stack = 0; success += 1;
      }
    }
  if (key == CODED) 
  {
    if (keyCode == LEFT)
    {
      if (Cursor_x > 10) { 
        Cursor_x -= 50;
      }
    }
    else if (keyCode == RIGHT)
    {
      if (Cursor_x < 160) { 
        Cursor_x += 50;
      }
    }
  }
}

void _Cursor()
{
  framesCursor = framesCursor + 1;
  if (framesCursor >= numFramesCursor) { 
    framesCursor = 0;
  } 
  image(imagesCursor[framesCursor], Cursor_x, 440);
}

void _Holder()
{
  //image(imagesHolderIdle, Cursor_x + 10 ,Holder_y + 450, 34,23.5);
  image(imagesHolderIdle, Holder_x + 10, Holder_y, 34, 23.5);
  Holder_x = Cursor_x; 
  Holder_y = Cursor_y;
}

void game() { //this is a method that holds much of the game
  if (second()!=timeLast) { //this sees if a second has passed
    timeLast=second(); //if a second has passed then we update the timeLast variable
    timer-=1; //this makes the timer countdown by one
  }
}

void _Comet()
{

  translate(0, 0);
  framesComet = framesComet + 1;
  if (framesComet >= numFramesComet) { 
    framesComet = 0;
  } 

  if (success > 19)
  { stack += 10; success = 0; success = 0;}

}


