


final int WIDTH = 500, HEIGHT = WIDTH;

final color BG_COLOR     = color(204);
final color ROOF_COLOR   = color(0,120,0);
final color LIGHTS_COLOR = color(255,255,0);
final color DOOR_COLOR   = color(95,63,0);
final color KNOB_COLOR   = color(206,184,12);
final color SIDING_COLOR = color(170,12,12);
final color STROKE_COLOR = color(0);

void setup()
{
  size(WIDTH,HEIGHT);
  smooth();
  noLoop();
  drawFrameArea();
  drawRoofArea();
  drawFrame();
  drawWindow();
  rectMode(CORNER);
  drawChimney();
  drawRoof();
  drawDoor();
}

float mainWidth,mainHeight,mainX,mainY;
void drawFrameArea()
//Which draws the bottom half of the house.
{
  mainWidth = 0.75 * WIDTH;
  mainHeight = 0.5  * HEIGHT;
  mainX = 0.12 * WIDTH;
  mainY = 0.4  * HEIGHT;
}

float roofX1, roofY1, roofX2, roofY2, roofX3, roofY3;
float chimX, chimY;
void drawRoofArea()
//Which draws the top half of the house.
//These two functions will call the following functions:
{
  roofX1 = mainX; roofY1 = mainY;
  roofX2 = mainX + 0.5 * mainWidth; roofY2 = mainY - 0.6 * mainHeight;
  roofX3 = mainX + mainWidth; roofY3 = mainY;
}

void drawFrame()
//Which draws the brick frame of the house.
{
  fill(SIDING_COLOR);
  rect(mainX, mainY, mainWidth, mainHeight);
}

void drawDoor()
//Which draw the door and the doorknob.
{
  float doorHeight = 0.5  * mainHeight, doorWidth = 0.2  * mainWidth;
  float doorX = mainX + 0.41 * mainWidth, doorY = mainY + 0.5  * mainHeight;
  float knobX = doorX + 0.88 * doorWidth, knobY = doorY + 0.5  * doorHeight;
  float knobWidth = 0.12 * doorWidth, knobHeight = knobWidth;
  fill(DOOR_COLOR);
  rect(doorX, doorY, doorWidth, doorHeight);
  fill(KNOB_COLOR);
  noStroke();
  ellipse(knobX, knobY, knobWidth, knobHeight);
}

void drawChimney()
//Which draws the brick chimney.
{
  float chimX = mainX + 0.75 * mainWidth, chimY = mainY - 0.5 * mainHeight;
  float chimHeight = 0.5  * mainHeight, chimWidth = 0.15 * mainWidth;
  fill(SIDING_COLOR);
  rect(chimX, chimY, chimWidth, chimHeight);
} 

void drawRoof()
//Which draws to triangular roof.
//The code that calls the top-level, area, functions will be called from the function:
{
  fill(ROOF_COLOR);
  triangle(roofX1, roofY1, roofX2, roofY2, roofX3, roofY3);
}

void drawWindow()
//Which draws one window whose center is located at (xCenter, yCenter) including the lit window and the framing bars.
{
  float windowHeight = 0.22 * mainWidth, windowWidth = windowHeight;  
  float window1x = mainX + windowWidth, window1y = mainY + windowHeight;
  float window2x = window1x + mainWidth - windowWidth*2, window2y = window1y;
  rectMode(CENTER);
  fill(LIGHTS_COLOR);
  
  rect(window1x, window1y, windowWidth, windowHeight);
  line(window1x, window1y - windowHeight/2, window1x, window1y + windowHeight/2);
  line(window1x - windowWidth/2, window1y, window1x + windowWidth/2, window1y);
  
  rect(window2x, window2y, windowWidth, windowHeight);
  line(window2x, window2y - windowHeight/2, window2x, window1y + windowHeight/2);
  line(window2x - windowWidth/2, window2y, window2x + windowWidth/2, window1y);
}
