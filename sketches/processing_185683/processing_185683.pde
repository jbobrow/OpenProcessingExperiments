
void setup() {
  size(743,240);
  
  int xPos = width/2;
  int yPos = 0;
  squareSize = 40;
  speed = 3;
  x = constrain(xPos, 0, width-squareSize-1);
  y = constrain(yPos,0,height-squareSize-1);
  startVariables();
}

boolean goCounterClockWise = false;
boolean testBool = true;
int testNumber = 0;
int squareSize;
float deg = 90;  
int speed;
int startSpeed = 1;
int x;
int y;
int i = 0;
int startX;
int[] side = new int[2];
int turningPoint;
int neg;

void draw() {
  background(#000000);
  noStroke();
  fill(#ffffff);
  
  x = x + (round(sin(radians(deg))) * startSpeed) * neg;
  y = y + (round(cos(radians(deg))) * startSpeed) * neg;
  i++;
  rect(x,y,squareSize,squareSize);
  
  turningPoint = round((side[0] - squareSize - round(startX)) / speed);
  
  if ( i == max(turningPoint, 1 ) ) {
    deg = (deg % 360) - 90 * neg;
    //deg = (deg % 360) - 90;
    i=0;
    startX = 0;
    side = reverse(side);
    println(deg);
  }
  startSpeed = speed;
  
}

void mousePressed() {
  noLoop();
  goCounterClockWise = !goCounterClockWise;
  startVariables();
  i = 0;
  //println(deg);
  loop();
}

void startVariables() {
  neg = 1 - (2 * int(goCounterClockWise));
  startX = (x * neg) + (int(goCounterClockWise) * (width - squareSize));
  side[0] = width; 
  side[1] = height;
}


