


float beginX = 20.0;  
float beginY = 10.0;  
float endX = 480.0;  
float endY = 490.0;   
float distX;          
float distY;          
float exponent = 4;   
float x = 0.0;        
float y = 0.0;        
float step = 0.01;    
float pct = 0.0;     

void setup() 
{
  size(500, 500);
  noStroke();
  smooth();
  distX = endX - beginX;
  distY = endY - beginY;
}

void draw() 
{
  pct += step;
  if (pct < 1.0) {
    x = beginX + (pct * distX);
    y = beginY + (pow(pct, exponent) * distY);
  }
  fill(255);
  ellipse(x, y, 20, 20);
}

void mousePressed() {
  pct = 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
}

