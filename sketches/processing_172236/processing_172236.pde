
float circleX = 0;
float circleY = 0;

//moving factors
//Random. Each time you load the sketch, the ellipse moves differently.
float moveX = random(3, 8);
float moveY = random(3, 8);

void setup() {
  size(400, 400);
  smooth();
  stroke(100);
}

void draw() {
  //draws a rect() that fills the entire screen each frame
  //Motion blur effect
  fill(50, 80);
  rect(0, 0, width, height);
    
  //ellipse color
  fill(255);
  
  //Draws ellipse with parameters and random for wobbly effect
  ellipse(circleX + random(2, 9), circleY + random(2, 9), 40, 40);
  
  //moving factors
  circleX = circleX + moveX;
  circleY = circleY + moveY;
  
  //right
  if(circleX > width) {
    moveX = -moveX;
  }
  
  //left  
  if(circleX < 0) {
    moveX = -moveX;
  }
  
  //top
  if(circleY < 0) {
    moveY = -moveY;
  }
  
  //bottom
  if(circleY > height) {
    moveY = -moveY;
  }  
}
