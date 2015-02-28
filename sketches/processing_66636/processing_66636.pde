
int xPos = 250;
int yPos = 250;
int yVel = 3;
int xVel = 2;

void setup(){
 size(500, 500);
 background(250);
 frameRate(60);
}

void draw(){
  
  for(int i = 0; i < 10; i++){
    drawCircle(50, 50, i * 50);
    drawCircle(450, 50, i * 5);
    drawCircle(50, 450, i * 10);
    drawCircle(450, 450, i * 25);
  }
  yPos = yPos + yVel;
  xPos = xPos + xVel;
  
  if((yPos >= height-25) || (yPos <= 25)){
    yVel *= -1;
  }
  if((xPos >= width-25) || (xPos <= 25)){
    xVel *= -1;
  }
  drawBox(xPos + xVel, yPos + yVel, 50);
}

void drawBox(int cornerX, int cornerY, int side){
// background(250);
 fill(0);
 rectMode(CENTER);
 rect(cornerX, cornerY, side, side); 
}

void drawCircle(int centerX, int centerY, int diameter){
 noFill();
 stroke(random(255));
 ellipse(centerX, centerY, diameter, diameter);
}


