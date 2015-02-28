

class Animation{
  PImage[] frames;   
  float fps;         
  int timer;         
  int currentFrame;  
  float locX, changeX;
  float locY, changeY;
  float origX, origY;
  int id, numFrames;
  
  public Animation(float locX, float locY, PImage[] frames, String name, float fps, int id, int numFrames){
    this.locX = locX;
    origX = locX;
    this.locY = locY;
    origY = locY;
    this.frames = frames;
    this.fps = fps;
    this.id = id;
    this.numFrames = numFrames;
    timer = 0;
    currentFrame = 0;
    handle();
  }
  
  public Animation(PImage[] frames, String name, float fps, int id, int numFrames){
    this.locX = locX;
    this.locY = locY;
    this.frames = frames;
    this.fps = fps;
    this.numFrames = numFrames;
    timer = 0;
    currentFrame = 0;
  }
  
  public void handle(){
    changeX = 0;
    changeY = 0;
    run();
  }    
  
  public void handle(float changeX, float changeY){
    this.changeX = changeX;
    this.changeY = changeY;
    run();
  }
  
  public float getCurrentX(){
    return locX;
  }
  
  public void setX(float x){
    locX = x;
  }
  
  public float getCurrentY(){
    return locY;
  }
  
  public PVector getFrameDimensions(){
    int x = frames[currentFrame].width;
    int y = frames[currentFrame].height;
    PVector dim = new PVector(x, y);
    return dim;
  }
  
  public void run(){
    locX += changeX;
    locY += changeY;
    timer--;
    if(timer < 0){
      currentFrame ++;
      timer = (int) (frameRate/fps);
    }
    if (currentFrame >= numFrames)
      currentFrame = 0;
    image(frames[currentFrame], locX, locY); 
    timer--;
  }
}

class AnimationHandler extends Thread{
  
  Animation idle, moveLeft, moveRight, moveUp, moveDown;

  int currentState;

  float locX;
  float locY;

  float changeX;
  float changeY;
  
  float origX;
  float origY;
  
  PGraphics offScreenBuffer;
  
  public AnimationHandler(String name, float startX, float startY){
    super(name);
    locX = startX;
    locY = startY;
    origX = startX;
    origY = startY;
    currentState = 0;
    offScreenBuffer = createGraphics(200,200, P2D);
    offScreenBuffer.noStroke();

  }

  public void setAllAnimations(Animation i, Animation ml, Animation mr, Animation mu, Animation md){
    idle = i;
    moveLeft = ml;
    moveRight = mr;
    moveUp = mu;
    moveDown = md;
  }

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
  
  public void handle(float changeX, float changeY){
    this.changeX = changeX;
    this.changeY = changeY;
    run();
  }
  
  public void handleBackground(int feedTopLeftX, int feedTopLeftY, int feedXsize, int feedYsize){
    frameRate(500);
    println(frameRate);
    offScreenBuffer.beginDraw();
    offScreenBuffer.fill(random(200,255), random(200,255),random(200,255));
    offScreenBuffer.ellipse(random(offScreenBuffer.width), random(offScreenBuffer.height), 5, 5);
    offScreenBuffer.ellipse(random(offScreenBuffer.width), random(offScreenBuffer.height), 5, 5);
    PImage feed = offScreenBuffer.get(feedTopLeftX, feedTopLeftY, feedXsize, feedYsize);
    offScreenBuffer.image(feed,0,0,offScreenBuffer.width,offScreenBuffer.height);
    offScreenBuffer.endDraw();
    image(offScreenBuffer.get(0,0,offScreenBuffer.width,offScreenBuffer.height), 0, 0, width, height);
    image(offScreenBuffer.get(0,0,offScreenBuffer.width,offScreenBuffer.height), 0, 0, width, height);

  }
  
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


