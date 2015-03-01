
int n = 0;
float angle = random(PI);
float xj, yj, x, y;
float maxWidth = 30;
float maxLength = 40;
float lineLength = maxLength;
float lineWidth = maxWidth;
float angleIncr = 0.1;
float widthIncr = 1;
float lengthIncr = 0.5;
 
void setup() 
{
  size(800, 800);
  background(255);
 stroke(131,239,250);

  xj = 0;
  yj = 0;
}
 
void draw() 
{
  x = constrain(xj+ lineLength*cos(angle), -lineWidth, width + lineWidth);
  y = constrain(yj+ lineLength *sin(angle), -lineWidth, height + lineWidth);
  float vx = constrain(xj + 2 *cos(angle), -lineWidth, width + lineWidth);
  float vy = constrain(yj + 2 *sin(angle), -lineWidth, height + lineWidth);
 
  strokeWeight(lineWidth*2);
  stroke(245,141,30);
  line(vx, vy, x, y);
  strokeWeight(lineWidth);
  stroke(131,239,250);
  line(xj, yj, x, y);
  xj = x;
  yj = y;
  lineWidth-= widthIncr;
  lineLength-= lengthIncr;
  angle+= angleIncr;
   
  if (lineWidth < 3 || lineWidth > maxWidth) 
  {
    widthIncr = -widthIncr;
  }
 
  if (lineLength < 20 || lineLength > maxLength) 
  {
    lengthIncr = -lengthIncr;
  }
}

