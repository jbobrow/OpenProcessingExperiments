
void setup(){
  size(500,500);
  background(225);
  smooth();
  stroke(0);
  strokeWeight(5);
  fill(225,225,0);
  ellipse(250,250,300,300);
  fill(225);
  ellipse(175,250,100,100);
  ellipse(325,250,100,100);
  fill(0);
  ellipse(150,250,20,20);
  ellipse(350,250,15,15);
  fill(0);
  bezier(150,310,100,400,400,400,350,310);
  line(150,310,350,310);
  
  int xPos = 75;
  int yPos = 75;
  float eye1X = xPos/1.5;
  int eye1Y = yPos;
  float eye2X = eye1X*2;
  int eye2Y = 75;
  int faceSize = 100;
  int eyeSize = faceSize/10;
  strokeWeight(2);
  fill(225,225,0);
  ellipse(xPos,yPos,faceSize,faceSize);
  fill(0);
  ellipse(eye1X,eye1Y,eyeSize,eyeSize);
  ellipse(eye2X,eye2Y,eyeSize,eyeSize);
  curve(70,25,50,95,100,95,70,1);
}

void draw(){
}

