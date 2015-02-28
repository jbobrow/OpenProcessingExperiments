
float ballA1=100;
float ballA2=100;
float ballB1=300;
float ballB2=100;
float ballC1=100;
float ballC2=300;
float ballD1=300;
float ballD2=300;
float ballSize=75;
float change=0.5;
float strokeSize=255;
float ballFill=255;
float bgColor=255;
float ballAlpha=0;

void setup(){
  size(400,400);
  smooth();
}

void draw(){
  background(bgColor);
  stroke(strokeSize);
  fill(ballFill,ballAlpha);
  
  ellipse(ballA1,ballA2,ballSize,ballSize);
  ellipse(ballB1,ballB2,ballSize,ballSize);
  ellipse(ballC1,ballC2,ballSize,ballSize);
  ellipse(ballD1,ballD2,ballSize,ballSize);
  
  ballA1=ballA1+change;
  ballA2=ballA2+change;
  ballB1=ballB1-change;
  ballB2=ballB2+change;
  ballC1=ballC1+change;
  ballC2=ballC2-change;
  ballD1=ballD1-change;
  ballD2=ballD2-change;
  ballSize=ballSize-change;
  ballFill=ballFill-1;
  strokeSize=strokeSize+change;
  bgColor=bgColor-1;
}

