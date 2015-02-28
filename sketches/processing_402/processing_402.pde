
//-----------VARS---------
float shrinkRate;
float ellipseSize;
float xPos, yPos;
float xOff = 0.0;
float yOff = 0.0;
float scalarX, scalarY;
int circleColor;
int colorChangeRate;

//-----------FUNCTIONS-------------
void reset(){
  ellipseSize = random(20, 80);
  xPos = width/2;
  yPos = height/2;
  shrinkRate = random(-2.0, -.4);
  scalarX = random(10, 20);
  scalarY = random(10, 20);
  //circleColor = (0, 177, 255);
  colorChangeRate = (int)random(10);
  println(shrinkRate);
}


//-----------MAIN---------
void setup() {
  size (800, 600);
  frameRate(150);
  reset();
  smooth();
  background(255);
}

void draw(){
  if (ellipseSize > 0){
  
  fill(0, 177, 255);
  stroke(50);
  ellipse(xPos, yPos, ellipseSize, ellipseSize);
  ellipseSize = ellipseSize + shrinkRate;
  xOff = xOff + .05;
  yOff = yOff + .02;
  xPos = xPos + (noise(xOff) - .5)*scalarX;
  yPos = yPos + (noise(yOff) - .5)*scalarY;
  //circleColor = circleColor + colorChangeRate;
  
  
  }
  else {
    reset();
  }
}
  


