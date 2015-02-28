
float xPosition = 0;
float yPosition;

void setup(){
  size(600,600);
  smooth();
  noStroke();
  yPosition = height/2;
}

void draw (){
  background(0);
  fill(255,110,180);
  ellipse(xPosition,yPosition,50,50);
  
  xPosition += 3;
}
