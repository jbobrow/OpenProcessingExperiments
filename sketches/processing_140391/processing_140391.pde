
//copyright Laura Contero 2014
//Homework #8

//declare global variables

final int maxNumber = 15;
int i = 0;

int [] xPos = new int[maxNumber];
int [] yPos = new int[maxNumber];

float d = 50;
float xSpeed = 5;
float ySpeed = 5;

void setup(){
  size( 600, 400);
  stroke(5);
  
  for (int i = 0; i < maxNumber; i++) {
    xPos[i] = int(random(0,600));
    yPos[i] = int(random(0,400));
  }
}

void draw(){
  drawFigure();
}

void drawFigure(){ 
  background(0);

  for(int i = 0; i < maxNumber; i++) {
    fill(random(255), random(255), random(255));
    beginShape();
    curveVertex(xPos[i],yPos[i]);
    curveVertex(xPos[i]*2,yPos[i]*2);
    curveVertex(d,d);
    curveVertex(xPos[i]*2,yPos[i]*2);
    curveVertex(d*4,d*4);
    endShape(CLOSE);
    
    xPos[i] += xSpeed;
    yPos[i] += ySpeed;
    if((xPos[i] > width) || (xPos[i] < 0)) {
      xSpeed = -xSpeed;
   }
   if((yPos[i] > height) || (yPos[i] < 0)) {
     ySpeed = -ySpeed;
   }
  }
}

void keyPressed(){
  if( key == ' ' )
  {
    setup();
  }
  else {
    exit();
  }
}



