
//symbol stuff
final int SKETCH_WIDTH = 500;

final int SKETCH_HEIGHT = 400;

final int CENTER_X = SKETCH_WIDTH / 2;
final int CENTER_Y = SKETCH_HEIGHT / 2;

final int START_BOX_WIDTH = SKETCH_WIDTH / 3;
final int START_BOX_HEIGHT = SKETCH_HEIGHT / 3;

final int DELTA_MAX = 5;

//colors
final color BLACK = color (0);
final color RED = color (255,0,0);
final color GREEN = color (0,255,0);
final color BLUE = color (0,0,255);
final color YELLOW = color (255,255,0);
final color CYAN = color (0,255,255);
final color MAGENTA = color (255,0,255);

//GLOBAL VARIABLES
int ballx, bally, dx, dy;
int colorIndex;
color fillColor;
int diam, radius;
int paddleW = 5;
int paddleH = 40;
int paddle1 = 200;
int paddle2 = 200;
int distwall = 10;
int leftscore = 0;
int rightscore = 0;

void draw()
{
  int bb = constrain (paddle2, 40,360);
  int cc = constrain (paddle1, 40,360);
  rectMode(RADIUS);
  ellipseMode(CENTER);
  background(BLACK);
  ellipse(ballx, bally, diam, diam);
  rect(distwall,cc,paddleW, paddleH);
  rect(width-distwall,bb,paddleW, paddleH);
  fill(fillColor);
  text(rightscore,450,50);
  fill(fillColor);
  text(leftscore,50,50); 
  fill(fillColor);
  rect(250,250,1,400);
  moveBall();
  frameRate(60);
}

void setup()
{
  ellipseMode(RADIUS);
  size (500,400);
  noStroke();
  smooth();
  colorIndex = 0;
  fillColor = RED;
  diam = 10;
  radius = diam / 2;
  newBall();
}



void newBall()
{
  
  int delta, deltax, deltay;

  delta = START_BOX_WIDTH / 2;
  deltax = int(random(-delta, +delta));
  ballx = CENTER_X + deltax;

  delta = START_BOX_HEIGHT / 2;
  deltay = int(random(-delta, +delta));
  bally = CENTER_Y + deltay;

  delta = DELTA_MAX;
  dy = dx = 0;
  while ((dx = int(random(-delta, +delta))) == 0) {
    deltax = int(random(-delta, +delta));
    dx = deltax;
  }
  while ((dy = int(random(-delta, +delta))) == 0) {
    deltay = int(random(-delta, +delta));
    dy = deltay;
  }

  fill(fillColor);
  colorIndex++;
  switch (colorIndex) {
  case 0: 
    fillColor = RED;          
    break;
  case 1: 
    fillColor = GREEN;        
    break;
  case 2: 
    fillColor = BLUE;         
    break;
  case 3: 
    fillColor = YELLOW;       
    break;
  case 4: 
    fillColor = CYAN;         
    break;
  case 5: 
    fillColor = MAGENTA;      
    break;
  default:
    colorIndex = 0;
    fillColor = RED;
    break;
  }
}

void moveBall()
 {
ballx += dx;
  bally += dy;
 
  
   if (ballx + radius >= width - distwall)
    if (paddle2 - paddleH <= bally && bally <= paddle2 + paddleH)
   {
   dx = -dx;
 }
   
    if (ballx - radius <= distwall)
    if (paddle1 - paddleH <= bally && bally <= paddle1 + paddleH)
  {
    dx = -dx;
  }
  
  
  
  if (checkheight(bally, radius, SKETCH_HEIGHT)) dy = -dy;
  
  
  if (checkleft(ballx, radius -15))
  {
     newBall();
  rightscore++;
  
  }
if (ckeckright(ballx, radius, SKETCH_WIDTH + 15))

{ 
  newBall();
  leftscore++;
  
  
}

}

boolean checkleft(int value, int delta)
{
  return (value - delta <= 0 );
}

boolean checkheight(int value, int delta, int maxValue)
{
  return (value - delta <= 0 || maxValue <= value + delta );
}
boolean ckeckright(int value, int delta, int maxValue)
{
  return  (maxValue <= value + delta);
}



void mouseClicked()
{
  newBall();
  leftscore = 0;
  rightscore = 0;
}

void keyPressed()
{
  if (key == CODED) 
    if (keyCode == UP)  
      paddle2 -= 30;


  if (keyCode == DOWN)  
    paddle2 += 30;


  if (keyPressed)
    if (key == 'w')
      paddle1 -= 30;

    else if (key == 's')
      paddle1 += 30;}
                                                
