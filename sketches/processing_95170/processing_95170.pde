
//Dynamic Eyes Exercise
//Eyes follow mouse cursor
//James Lockrey
//3414862

float iLeftX, iLeftY, iRightX, iRightY; 

int blinkLength = 10, blinkCounter = 0;

PFont font;
PImage face, blink, iLeft, iRight, hair;

float mDownX, mDownY;
 
void setup(){
  face = loadImage("face.png");
  blink = loadImage("blink.png");
  iLeft = loadImage("eye_left.png");
  iRight = loadImage("eye_left.png");
  hair = loadImage("hair.png");
  
  font = createFont("Calibri",16, true);
  
  size(720,480);
}
 
void draw(){
  background(255);
   
  if(mousePressed){
     blinkCounter = blinkLength;
  } else {
    iLeftX = map(mouseX, 0, width, -20, 25);
    iRightX = map(mouseX, 0, width, -25, 20);
    iLeftY = map(mouseY, 0, height, -10, 10);
    iRightY = iLeftY;
  }
   
  image(iLeft, iLeftX, iLeftY);
  image(iRight, iRightX + 212, iRightY);
  
  if(blinkCounter > 0){
    blinkCounter -= 1;
    image(blink, 0, 0);
  } else {
    image(face, 0, 0);
  }
  image(hair,0,0);
  
  CursorPos();
  FrameRate();
}

void CursorPos(){
  fill(125,125,125);
  rect(width-80, height-25, 75, 20);
  textAlign(CENTER);
  textFont(font,12);
  String cursorPos = "x: "+floor(mouseX)+", y:"+floor(mouseY);
  fill(0,0,0,175);
  text(cursorPos, width-40, height-10);
}

void FrameRate(){
  fill(125,125,125);
  rect(width-80, height-55, 75, 20);
  textAlign(LEFT);
  textFont(font,12);
  fill(0);
  text("FPS: " + int(frameRate),width-60,height-40);
}


