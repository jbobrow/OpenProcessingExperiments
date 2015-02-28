
  color safeColor;
  color unSafeColor;
  color ballColor;
  color unSafeColorUpper;
  color unSafeColorLower;
  float ballSize;
  float x;
  float y;
  float ySpeed;
  float blockY;
  float blockX;
  float XSpeed;
  float blockWidth;
  float blockHeight;
  float[] upperLines;
  float[] lowerLines;
  float lineLength;
  double slopeUpper;
  float slopeCounterUpper;
  int lastChangedUpper;
  double slopeLower;
  float slopeCounterLower;
  int lastChangedLower;
  float score;
  
 void setup() {
    size(displayWidth, displayHeight);
    score = 0;
    lastChangedUpper = 0;
    lastChangedLower = 0;
    slopeLower = Math.random() * 10 - 5;
    slopeUpper = Math.random() * 10 - 5;
    ballColor = color(255,0,0);
    safeColor = color(153,204,255);
    unSafeColor = color(0,153,0);
    unSafeColorUpper = color(0,153,0);
    unSafeColorLower = color(0,153,0);
    background(safeColor);
    lineLength = 100;
    ballSize = 20;
    x = 400;
    y = height/2;
    ySpeed = 3;
    XSpeed = 5;
    blockHeight = 200;
    blockWidth = 100;
    blockX = width;
    blockY = (height - blockHeight)/2;
    upperLines = new float[width];
    lowerLines = new float[width];
    for(int i = 0; i < upperLines.length; i++){
      upperLines[i] = 30;
    }
    for(int i = 1; i < width; i++){
      float nextValue = (float) (upperLines[lastChangedUpper] + (i - lastChangedUpper) * slopeUpper);
      if(nextValue < 30 || nextValue > height/2 - blockHeight/2 - ySpeed - ballSize*4){
        lastChangedUpper = i;
        slopeUpper = Math.random() * 10 - 5;
        slopeCounterUpper = lineLength;
        nextValue = (float) (upperLines[lastChangedUpper-1] + (i - lastChangedUpper) * slopeUpper);
        upperLines[i] = nextValue;
      }else{
        upperLines[i] = nextValue;
      }
    }
    for(int i = 0; i < lowerLines.length; i++){
      lowerLines[i] = height-30;
    }
    for(int i = 1; i < width; i++){
      float nextValue = (float) (lowerLines[lastChangedLower] + (i - lastChangedLower) * slopeLower);
      if(nextValue > height - 30 || nextValue < height/2 + blockHeight/2 + ySpeed + ballSize*4){
        lastChangedLower = i;
        slopeLower = Math.random() * 10 - 5;
        slopeCounterLower = lineLength;
        nextValue = (float) (lowerLines[lastChangedLower-1] + (i - lastChangedLower) * slopeLower);
        lowerLines[i] = nextValue;
      }else{
        lowerLines[i] = nextValue;
      }
    }
    drawLines();
    blocks();
  }
  
  boolean sketchFullScreen() {
    return true;
  }

  void draw() {
    while(ballon()){
      try {
        gameOver();
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
    shift();
    
  }
  
  
  void shift(){
    loadPixels();
    
    // Loop through every pixel column
    for (int x = (int) XSpeed; x < width; x++) {
      // Loop through every pixel row
      for (int y = 0; y < height; y++) {
        // Use the formula to find the 1D location
        int loc = x + y * width;
        int locReplace = (int) ((x -XSpeed) + y * width);
        pixels[locReplace] = pixels[loc];
      }
    }
    
    for (int x = (int) (width - XSpeed); x < width; x++) {
        // Loop through every pixel row
        for (int y = 0; y < height; y++) {
          // Use the formula to find the 1D location
          int loc = x + y * width;
          pixels[loc] = 0;
        }
    }
    updatePixels();
    stroke(safeColor);
    fill(safeColor);
    rect(width-XSpeed, 0, XSpeed, height);
    blockX -= XSpeed;
    if(blockX < 0){
      blockX = width;
      fill(unSafeColor);
      rect(blockX,blockY,-blockWidth,blockHeight);
    }
    
    for(int i = (int) XSpeed; i < width; i++){
      upperLines[(int) (i - XSpeed)] = upperLines[i]; 
      lowerLines[(int) (i - XSpeed)] = lowerLines[i]; 
    }
    
    lastChangedUpper --;
    lastChangedLower--;
    
    for(int i = (int) (width - XSpeed); i < width; i++){
      float nextValue = (float) (upperLines[lastChangedUpper] + (i - lastChangedUpper) * slopeUpper);
      if(nextValue < 30 || nextValue > height/2 - blockHeight/2 - ySpeed - ballSize*4){
        lastChangedUpper = i;
        slopeUpper = Math.random() * 10 - 5;
        slopeCounterUpper = lineLength;
        nextValue = (float) (upperLines[lastChangedUpper-1] + (i - lastChangedUpper) * slopeUpper);
        upperLines[i] = nextValue;
      }else{
        upperLines[i] = nextValue;
      }
    }
    for(int i = (int) (width - XSpeed); i < width; i++){
      float nextValue = (float) (lowerLines[lastChangedLower] + (i - lastChangedLower) * slopeLower);
      if(nextValue > height - 30 || nextValue < height/2 + blockHeight/2 + ySpeed + ballSize*4){
        lastChangedLower = i;
        slopeLower = Math.random() * 6 - 3;
        slopeCounterLower = lineLength;
        nextValue = (float) (lowerLines[lastChangedLower-1] + (i - lastChangedLower) * slopeLower);
        lowerLines[i] = nextValue;
      }else{
        lowerLines[i] = nextValue;
      }
    }
    for(int xValue = (int) (width - XSpeed); xValue < width; xValue++){
      strokeWeight(1);
      stroke(unSafeColorUpper);
      line(xValue,upperLines[xValue],xValue,0);
      stroke(unSafeColorLower);
      line(xValue,lowerLines[xValue],xValue,height);
    }
  }
  
  void drawLines(){
    for(int xValue = 0; xValue < width; xValue++){
      strokeWeight(1);
      stroke(unSafeColorUpper);
      line(xValue,upperLines[xValue],xValue,0);
      stroke(unSafeColorLower);
      line(xValue,lowerLines[xValue],xValue,height);
    }
  }
  
  boolean ballon(){
    stroke(safeColor);
    fill(safeColor);
    ellipse(x,y,ballSize,ballSize);
    ellipse(x - XSpeed -1,y,ballSize,ballSize);
    if(mousePressed){
      y -= ySpeed;
    }else{
      y += ySpeed;
    }
    if ((y > lowerLines[(int) x]) || (y < upperLines[(int) x])) {
      return true;
    }
    if(x>blockX-110 && x<blockX && y>blockY && y<blockY+210){
      return true;
    }
    fill(ballColor);
    ellipse(x,y,ballSize,ballSize);
    return false;
  }
  
  void blocks(){
    noStroke();
    fill(unSafeColor);
    rect(blockX,blockY,-blockWidth,blockHeight);
    if(blockX < 0){
      fill(unSafeColor);
      rect(blockX,blockY,blockWidth,blockHeight);
      blockX = width;
    }
  }
  
  void gameOver() throws InterruptedException{
    Thread.sleep(9999);
    System.exit((int)x);
    //TODO Make End Game
  }


