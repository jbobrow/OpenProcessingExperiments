
// day one: draw a line to follow

float lineStroke = 10;
float growthSpeed = 1.0;
float growthDirection = 1;

void setup(){
  size(500, 500);
}

void draw(){
  background(0);
  lineStroke = lineStroke + (growthSpeed * growthDirection);
  //stroke pulse
  if(lineStroke > 100 || lineStroke < 1){
    growthDirection *= -1;
  } 
 
  // draw the line
  strokeCap(SQUARE);
  stroke(255);
  strokeWeight(lineStroke);
  line(10, height/2, width-10, height/2);
  
}


