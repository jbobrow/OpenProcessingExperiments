
float colorB=0;
float circleX=0;
float circleY=0;
float circleSize=0;
float change=0.5;

//basic setup
void setup(){
  size(200,200);
  smooth();
  background(255);
}


//draw 4 circles
void draw(){
  background(255);
  ellipseMode(CENTER);
  //circle top left
  noStroke();
  fill(255,0,64+colorB);
  ellipse(50+circleX,50+circleY,50+circleSize,50+circleSize);
  //circle top right
  noStroke();
  fill(255,226,0+colorB);
  ellipse(150-circleX,50+circleY,50+circleSize,50+circleSize);
  //circle bottom left
  noStroke();
  fill(116,177,255+colorB);
  ellipse(50+circleX,150-circleY,50+circleSize,50+circleSize);
  //circle bottom right
  noStroke();
  fill(173,224,106+colorB);
  ellipse(150-circleX,150-circleY,50+circleSize,50+circleSize);
  
  //change the values of all varieties
  colorB=colorB+change;
  circleX=circleX+change;
  circleY=circleY+change;
  circleSize=circleSize+change;
  
}
