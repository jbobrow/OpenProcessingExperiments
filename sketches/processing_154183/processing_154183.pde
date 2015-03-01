
// day two: follow this line with anouther

float lineStroke = 10;
float growthSpeed = 1.9;
float growthDirection = 1;

void setup(){
  size(500, 500);
}

void draw(){
  background(0);
  lineStroke = lineStroke + (growthSpeed * growthDirection);
  //stroke pulse
  if(lineStroke > 500 || lineStroke < 1){
    growthDirection *= -1;
  } 
 
  // draw the line
  strokeCap(SQUARE);
  stroke(255);
  strokeWeight(lineStroke);
  line(10, height/2, width-10, height/2);
  
  // draw the other line
  strokeCap(SQUARE);
  stroke(0);
  strokeWeight(lineStroke);
  line(0, 10, width -10, height -10);
 
}
