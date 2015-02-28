
float px, py, px2, py2;
float angle, angle2;
float radius = 50;
float frequency = 2;
float frequency2 = 2;
float x, x2;
float beginX = 20.0;  // Initial x-coordinate
float beginY = 10.0;  // Initial y-coordinate
float endX = 570.0;   // Final x-coordinate
float endY = 320.0;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 4;   // Determines the curve
float x = 0.0;        // Current x-coordinate
float y = 0.0;        // Current y-coordinate
float step = 0.01;    // Size of each step along the path
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)



void setup(){
  size(500, 300);
  noStroke();
  distX = endX - beginX;
  distY = endY - beginY;
}

void draw(){
  fill(0,2);
  rectMode(CENTER);
  rect(250, 150, width, height);

 // noStroke();
  
  px = width/8 + cos(radians(angle))*(radius);
  py = 75 + sin(radians(angle))*(radius);
  rectMode(CENTER);
  fill(0);
 
  angle2 = 0;

  
  for (int i = 0; i< width; i++){
    px2 = width/8 + cos(radians(angle2))*(radius);
    py2 = 75 + sin(radians(angle2))*(radius);
    point(width/8+radius+i, py2);
    angle2 -= frequency2;
  }

  
  if (pct > 5.0) {
    x = beginX + (pct * distX);
    y = beginY + (pow(pct, exponent) * distY);
  }
  fill(255);
  ellipse(0+radius+x, py, 50, 50);
  angle -= frequency;
  x+=1;

  
  if (x>= width-60) {
    x = 0;
    angle = 0;
   pct += step; 
   
  
  }

 
}
