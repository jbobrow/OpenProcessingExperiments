
/* 
   The Animation Handler Class.
   By Gerard Geer
   Revision 1.0
   This works by having a base Animation class, that stores all the information for each animation,
   such as name, various frames, intended fps, etc. and can in each its own thread, handles/updates
   the current frame and position of each frame. This functionality is accessed by each of the various
   handle methods in the actual AnimationHandler Class.
*/
class Animation extends Thread{
  //Various variables used by each Animation
  PImage[] frames;   //array holding every frame needed for the animation
  String name;       //name of the animation. Used as the name of it's thread, and as identification
  float fps;         //the intended speed of the animation
  int timer;         //timer used in conjunction with fps to tell when to switch to the next frame
  int currentFrame;  //index of the current frame being drawn
  float locX, changeX; //X location and intended X increment used to move the animation on the screen
  float locY, changeY; //Y location and intended Y increment used to move the animation on the screen
  float origX, origY;  //Original X and Y locations.
  int id;
  
  //constructor, used to intantiate the Thread constructor, and initialize several of the variables.
  public Animation(float locX, float locY, PImage[] frames, String name, float fps, int id){
    super(name);
    this.locX = locX;
    origX = locX;
    this.locY = locY;
    origY = locY;
    this.frames = frames;
    this.name = name;
    this.fps = fps;
    this.id = id;
    timer = 0;
    currentFrame = 0;
    handle();
  }
  public Animation(PImage[] frames, String name, float fps, int id){
    super(name);
    this.locX = locX;
    this.locY = locY;
    this.frames = frames;
    this.name = name;
    this.fps = fps;
    timer = 0;
    currentFrame = 0;
  }
  
  //original handle method, which is used to draw the first image frame to the screen, right when the 
  //animation is instantiated.
  public void handle(){
    changeX = 0;
    changeY = 0;
    run();
  }    
  
  //Successively used handle method, used when updating the animation after it has been instantiated.
  public void handle(float changeX, float changeY){
    this.changeX = changeX;
    this.changeY = changeY;
    run();
  }
  
  //returns the name of the animation if the variable is private.
  public String getAnimationName(){
    return name;
  }
  
  //returns the current X coordinate if the variable is private.
  public float getCurrentX(){
    return locX;
  }
  
  //sets the X coordinate. Used if the animation was not handled upon initialization
  public void setX(float x){
    locX = x;
  }
  
  //sets the Y coordinate. Used if the animation was not handled upon initialization
  
  //returns the current Y coordinate if the variable is private.
  public float getCurrentY(){
    return locY;
  }
  
  //returns the x and y dimensions of the image considered to be the current frame
  public PVector getFrameDimensions(){
    int x = frames[currentFrame].width;
    int y = frames[currentFrame].height;
    PVector dim = new PVector(x, y);
    return dim;
  }
  
  //the run method overridden from the Thread class allowing the animation handling to run in
  //its own thead.
  public void run(){
    locX += changeX;
    locY += changeY;
    timer--;
    if(timer < 0){
      currentFrame ++;
      timer = (int) (frameRate/fps);
    }
    if (currentFrame >= frames.length)
      currentFrame = 0;
    image(frames[currentFrame], locX, locY); 
    timer--;
  }
}

class AnimationHandler extends Thread{

  //various local instances of the Animation class that 
  //represent the different states the item can be in.
  Animation idle, moveLeft, moveRight, moveUp, moveDown;

  //integer representing the current animation state of the AnimationHandler
  int currentState;

  //floats representing the current location of the item.
  float locX;
  float locY;

  //floats representing how much you want the locX and locY
  //values to change by when you call the handle method.
  float changeX;
  float changeY;
  
  //floats representing the original location of the animationHandler
  float origX;
  float origY;
  
  //Offscreenbuffer used in the background algorithm;
  PGraphics offScreenBuffer;
  //constructor. Pass a String that will be used as the name of the internal Thread, and an
  //initial x and y location.
  public AnimationHandler(String name, float startX, float startY){
    super(name);
    locX = startX;
    locY = startY;
    origX = startX;
    origY = startY;
    currentState = 0;
    offScreenBuffer = createGraphics(200,200, P2D);
    offScreenBuffer.noStroke();
    //offScreenBuffer.smooth();

  }

  //use this method if you want to define all the animation states at once.
  public void setAllAnimations(Animation i, Animation ml, Animation mr, Animation mu, Animation md){
    idle = i;
    moveLeft = ml;
    moveRight = mr;
    moveUp = mu;
    moveDown = md;
  }

  //use these methods if you want to define only one animation state at a time.
  public void setIdleAnimation(Animation anim){
    idle = anim;
  }

  public void setMoveLeftAnimation(Animation anim){
    moveLeft = anim;
  }

  public void setMoveRightAnimation(Animation anim){
    moveRight = anim;
  }

  public void setMoveUpAnimation(Animation anim){
    moveUp = anim;
  }

  public void setMoveDownnimation(Animation anim){
    moveDown = anim;
  }

  //handle method. call this each frame you want the item to be displayed,
  //and pass two floats that represent how far you want it to move, in the
  //x and y direction.
  public void handle(float changeX, float changeY){
    this.changeX = changeX;
    this.changeY = changeY;
    run();
  }
  
  //takes a portion of the current frame, then redraws it larger, giving the zoom effect.
  //as of right now it will do the same with anything on the screen. I will rewrite this using
  //a second graphics buffer that draws only the background, then grab frames from it, so that
  //the ships and lasers don't do the zoom thing as well.
  public void handleBackground(int feedTopLeftX, int feedTopLeftY, int feedXsize, int feedYsize){
    frameRate(500);
    println(frameRate);
    offScreenBuffer.beginDraw();
    //offScreenBuffer.fill(random(150), random(150),random(200,255));
    //offScreenBuffer.ellipse(offScreenBuffer.width/2+6, offScreenBuffer.height/2+6, random(1,6), random(1,6));
    offScreenBuffer.fill(random(200,255), random(200,255),random(200,255));
    offScreenBuffer.ellipse(random(offScreenBuffer.width), random(offScreenBuffer.height), 5, 5);
    offScreenBuffer.ellipse(random(offScreenBuffer.width), random(offScreenBuffer.height), 5, 5);
    PImage feed = offScreenBuffer.get(feedTopLeftX, feedTopLeftY, feedXsize, feedYsize);
    offScreenBuffer.image(feed,0,0,offScreenBuffer.width,offScreenBuffer.height);
    offScreenBuffer.endDraw();
    image(offScreenBuffer.get(0,0,offScreenBuffer.width,offScreenBuffer.height), 0, 0, width, height);
    image(offScreenBuffer.get(0,0,offScreenBuffer.width,offScreenBuffer.height), 0, 0, width, height);

  }
  //Don't fret about this just yet.
  public void run(){
    locX += changeX;
   locY += changeY;
   if (changeX == 0){
      if(changeY == 0){
        currentState = 0;
        idle.locX = locX;
        idle.locY = locY;
        idle.handle();
        currentState = 0;
      }
      else if(changeY < 0){
	currentState = 1;
        moveUp.locX = locX;
        moveUp.locY = locY;
        moveUp.handle();
        currentState = 1;
      }
      else if(changeY > 0){
	currentState = 2;
        moveDown.locX = locX;
        moveDown.locY = locY;
        moveDown.handle();
        currentState = 2;
      }
    }
    else if(changeX < 0){
      currentState = 3;
      moveLeft.locX = locX;
      moveLeft.locY = locY;
      moveLeft.handle();
      currentState = 3;
    }
    else if(changeX > 0){
      currentState = 4;
      moveRight.locX = locX;
      moveRight.locY = locY;
      moveRight.handle();
      currentState = 4;
    }
  }

  public Animation getCurrentAnimation(){
    switch (currentState){
      case 0: return idle;
      case 1: return moveUp;
      case 2: return moveDown;
      case 3: return moveLeft;
      case 4: return moveRight;
      default:return idle;
    }
  }
}


