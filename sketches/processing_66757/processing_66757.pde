
float xPos = 250;
float yPos = 250;
int yVel = 5;

void setup(){
  size(500, 500);
  background(250);
}

void draw(){
  background(250);
  
  text("Click!", 240, 250);
  
  drawBall(xPos, yPos, 50);
  
  yPos += yVel;
  
  if(yPos >= height-40){
    yVel=0;
  }
  
  
  fill(0);
  rect(0, height-15, width, 15);
  
  println("yPos = " + yPos); //debug
  println("yVel = " + yVel); //debug
  
}

void mouseClicked(){
     yPos = mouseY;
     xPos = mouseX;
     yVel = 5;
    }

void drawBall(float centerX, float centerY, float diameter){
  fill(0, 0, 250);
  noStroke();  
  ellipseMode(CENTER);
  ellipse(centerX, centerY, diameter, diameter);
}

