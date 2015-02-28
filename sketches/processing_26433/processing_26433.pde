
float backgroundColour = 255;
float lineStroke = 0;
float lineX = 0;
float lineY = 100;
float lineZ = 200;
float change = 0.15;


void setup() {
  size(200, 200); 
}

void draw() {
  background(backgroundColour);
  stroke(lineStroke);
  line(lineY, lineX, lineY, lineY);
  line(lineY, lineY, lineX, lineZ);
  line(lineY, lineY, lineZ, lineZ);
  
  lineX = lineX + change;
  lineY = lineY - change;
  lineZ = lineZ + change;
  
}

