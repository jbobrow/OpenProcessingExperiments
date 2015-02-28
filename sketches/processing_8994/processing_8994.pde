

// ===================== SPRINGBOX class =====================
class SpringBox
{
  float xPos;
  float yPos;
  float springPosX;
  float springPosY;
  float springVelX;
  float springVelY;
  float springAccX;
  float springAccY;
  float boxSize;
  float damping;
  float mass;
  float stiffness;
  int thickness;
  color springColor;
  
  SpringBox(float x, float y, float initBoxSize) {
    xPos = x;
    yPos = y;
    boxSize = initBoxSize;
    springPosX = boxSize/2;
    springPosY = boxSize/2;
    springVelX = 0;
    springVelY = 0;
    springAccX = 0;
    springAccY = 0;
    // set some defaults
    stiffness = 0.5;
    damping = 0.2;
    mass = 5;
    thickness = 30;
    springColor = color(200,100,20);
  }
  
  void draw() {
    noStroke();
    fill(blendColor(springColor, color(255 - (springPosY/boxSize*128 + springPosX/boxSize*128)), SCREEN));
    ellipse(xPos+springPosX, yPos+springPosY, thickness, thickness);
  }
  
  /* Liang Barsky line clipping algorithm from http://en.wikipedia.org/wiki/Liang-Barsky */
  boolean lineRectIntersect(float rectLeft, float rectTop,
        float rectRight, float rectBottom,
        float lineStartX, float lineStartY, float lineEndX, float lineEndY)
  {
    float dx, dy;
    float p, q;
    float u1 = 0.0, u2 = 1.0;
    float r;
    
    dx = lineEndX - lineStartX;
    dy = lineEndY - lineStartY;
    
    float pPart[] = {-dx, dx, -dy, dy};
    float qPart[] = {lineStartX - rectLeft, rectRight - lineStartX,
      lineStartY - rectBottom, rectTop - lineStartY};
    
    for( int i=0; i < 4; i++)
    {
      p = pPart[i];
      q = qPart[i];
      
      if(p == 0 && q < 0 ) return false;
      
      r = q / p;
      if(p < 0) u1 = max(u1, r);
      if(p > 0) u2 = min(u2, r);
      
      if(u1 > u2) return false;
    }
    
    return true;
  }
  
  void update() { 
    if(mousePressed &&
          lineRectIntersect(xPos, yPos + boxSize, xPos + boxSize, yPos, pmouseX, pmouseY, mouseX, mouseY))
    {
      springVelX = 0.1*(mouseX - pmouseX);
      springVelY = 0.1*(mouseY - pmouseY);
    } else {
      springAccX = (-(stiffness*(springPosX - boxSize/2))-(damping*springVelX))/mass;
      springAccY = (-(stiffness*(springPosY - boxSize/2))-(damping*springVelY))/mass;
      
      springVelX += springAccX;
      springVelY += springAccY;
      
      springPosX += springVelX;
      springPosY += springVelY;
    }

  }
}


// ===================== GLOBALS/CONSTANTS =====================
int rows = 20;
int columns = 20;
int fps = 60;
int numBoxes;
SpringBox[] boxes;


// ===================== MAIN =====================
//
// ===================== setup =====================
void setup()
{
  smooth();
  noStroke();
  frameRate(fps);
  size(400, 400);
  
  float mass = 0.333 * fps;
  float stiffness = 2.0 * 30.0/fps;
  float damping = 0.0033 * fps;

  numBoxes = rows * columns;
  boxes = new SpringBox[numBoxes];

  int index = 0;
  for(int y = 0; y < rows; y++) {
    for(int x = 0; x < columns; x++) {
      boxes[index] = new SpringBox(x*width/columns, y*height/rows, height/rows);
      boxes[index].thickness = height/rows;
      boxes[index].springColor = color(random(16),random(16),random(16));
      boxes[index].mass = mass;
      boxes[index].stiffness = stiffness;
      boxes[index].damping = damping;
      //boxes[index].thickness = int(random(height/rows)+10);
      index++;
    }
  }
  
  cursor(HAND);
}


// ===================== draw =====================
void draw()
{
  background(0);
  
  for(int i=0; i<numBoxes; i++) {
    boxes[i].draw();
    boxes[i].update();
  }
}



