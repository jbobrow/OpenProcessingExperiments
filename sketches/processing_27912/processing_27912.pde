


float beginX = 20.0;  
float beginY = 10.0;  
float endX = 450.0;     
float endY = 450.0;     
float distX;           
float distY;           
float exponent = 4;    
float x = 0;         
float y = 0;          
float step = 0.01;      
float percentage = 0.0; 

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
  fill(0,2);
  rect(0,0,height,width);
  percentage += step;
  if (percentage < 1.0) {
    x = beginX + (percentage * distX);
    y = beginY + (pow(percentage, exponent) * distY);
  }
  fill(255);
  ellipse(x, y, 10, 10);
}

void mousePressed() {
  percentage = 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
}

