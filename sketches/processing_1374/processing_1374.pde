
/**
 * Recursion. 
 * 
 * A demonstration of recursion, which means functions call themselves. 
 * Notice how the drawCircle() function calls itself at the end of its block. 
 * It continues to do this until the variable "level" is equal to 1. 
 */
 
void setup() 
{
  size(300, 300);
  noStroke();
  noLoop();
}

void draw() 
{
  drawCircle(100, 100, 8);
}

void drawCircle(int x, int radius, int level) 
{                    
  float tt = 126 * level/4.0;
  fill(tt);
  ellipse(x, 100, radius*2, radius*2);      
  if(level > 3) {
    level = level - 3;
    drawCircle(x - radius/2, radius/2, level);
    drawCircle(x + radius/2, radius/2, level);
  }
}

