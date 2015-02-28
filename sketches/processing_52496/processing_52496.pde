
float xPos;
float yPos;
float angle;
float radius = 210;

void setup() {
  size(500,500);
  background(0);
}

void draw() {
  
  if(mousePressed) {
    
  xPos = width/2 + cos(radians(angle))*(radius);
  yPos = height/2 + sin(radians(angle))*(radius);
  angle = angle - 0.3;
  
  smooth();
  noFill();
  strokeWeight(0.25);
  
  stroke(0);
  ellipse(xPos-25,yPos-25,xPos,yPos); 
}
  
  else{
    
  xPos = width/2 + cos(radians(angle))*(radius);
  yPos = height/2 + sin(radians(angle))*(radius);
  angle = angle + 0.3;
  
  smooth();
  noFill();
  strokeWeight(0.5);
  
  stroke(xPos/2,yPos/2,50,100);
  ellipse(xPos-25,yPos-25,xPos,yPos);
  }
}

void keyPressed() {
  background(0);
}

