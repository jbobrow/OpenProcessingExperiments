
// day two: and another again

float lineStroke = 10;
float growthSpeed = 2;
float growthDirection = 1;
float degrees = 10;

void setup(){
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
}


void draw(){
  background(0);
  // line stroke size
  lineStroke = lineStroke + (growthSpeed * growthDirection);
  
  //stroke pulse
  if(lineStroke > 400 || lineStroke < 1){
    growthDirection *= -1;
  } 
  
  // pulse degrees
  if(degrees < 360 ){
    degrees = degrees + 1;
  } 
  if(degrees == 360){
    degrees = 0;
  }
  
  // flipping degree's for the opposite rotation on the line
  float degrees2 = map(degrees, 0, 360, 360 ,0);
  
  // draw the line
  strokeCap(SQUARE);
  // color in HSB shifting with the rotation
  stroke(degrees, 50, 90);
  strokeWeight(lineStroke);
  line(10, height/2, width-10, height/2);
  
  
  // black lines
  fill(0);
  noStroke();
  rectMode(CENTER);
  
  
  // line one
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(degrees));
  rect(0,0, lineStroke/2, height*2 );
  popMatrix();
  
  //line two
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(degrees2));
  rect(0,0, lineStroke/2, height*2 );
  popMatrix();
 
}

