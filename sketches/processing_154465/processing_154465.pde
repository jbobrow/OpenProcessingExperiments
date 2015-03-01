
// day three: working with blending in the aplphas

float lineStroke = 10;
float growthSpeed = 1.9;
float growthDirection = 1;
float lineAlpha;
float degrees = 10;

void setup(){
  size(500, 500);
  background(0);
  
}


void draw(){
  
  lineStroke = lineStroke + (growthSpeed * growthDirection);
  
  //stroke pulse
  if(lineStroke > 500 || lineStroke < 1){
    growthDirection *= -1;
  } 
  
  // pulse degrees
  if(degrees < 360 ){
    degrees = degrees + 1;
  } 
  if(degrees == 360){
    degrees = 0;
  }
  
  // reverse the degrees
  float degrees2 = map(degrees, 0, 360, 360 ,0);
  
  // white line / rectangle
  noStroke();
  rectMode(CENTER);
  fill(255,20);
  rect(width/2, height/2, width, lineStroke );
  
  // black lines
  fill(0);
  
  //line one
  pushMatrix();
  translate(400, height/2);
  rotate(radians(degrees));
  rect(0,0, lineStroke/2, height*2 );
  popMatrix();
  
  //line two
  pushMatrix();
  translate(100, height/2);
  rotate(radians(degrees2));
  rect(0,0, lineStroke/2, height*2 );
  popMatrix();
  
}
