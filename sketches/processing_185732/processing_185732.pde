
void setup() {
  size(743,357); // You can change this variable! Set the Canvas Size
  int xPos = 200; // You can change this variable! Set the Startin X Position.
  int yPos = 0; 
  squareSize = 40; // You can change this variable! Set the width and height of the square in pixels 
  speed = 7; // You can change this variable! Set the sqaure's speed measured in pixels per frame. 
  cw = true; // You can change this variable! Set True to begin moving ClowWise. Set False to begin moving Counter Clockwise. 
  strokeThickness = 3; //You can change this variable! Set the thickness of the stroke in pixels.
  increase = cw; 
  x = constrain(round(xPos), 0, width-squareSize-1-strokeThickness);
  y = constrain(round(yPos),0,height-squareSize-1-strokeThickness);
}

boolean goHorizontal = true;
boolean increase; 
boolean cw;
int x;
int y;
int speed;
int startSpeed = 1;
int p;
int side;
int dir;
int strokeThikness;

void draw() {
  background(#000000);
  stroke(#ffcc04);
  strokeWeight(strokeThickness);
  fill(#ffffff);
  
  dir = (2 * int(increase)) -1; 
  
  x = x + (speed * int(goHorizontal) * dir);
  y = y + (speed * (1-int(goHorizontal)) * dir);
  
  rect(constrain(x,0,width-squareSize-strokeThickness),constrain(y,0,height-squareSize-strokeThickness),squareSize,squareSize);
  
  p = (x * int(goHorizontal)) + (y * (1-int(goHorizontal)));
  side = (width * int(goHorizontal)) + (height * (1-int(goHorizontal)));
  
  if ( p <= 0 || p >= side - squareSize ) {
    
    if ( (increase == true && goHorizontal == false && cw == true) || (increase == false && goHorizontal == false && cw == true) || (increase == false && goHorizontal == true && cw == false) || (increase == true && goHorizontal == true && cw == false) ) {
      increase = !increase;
    }
    goHorizontal = !goHorizontal;
  }
  
}

void mousePressed() {
  noLoop();
  increase = !increase;
  cw = !cw;
  loop();
}


