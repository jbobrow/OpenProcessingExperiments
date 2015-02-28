
float ballWidth = 45;
float ballHeight = 70;

float currX;
float currY;


void setup(){
  size(200,500);
  smooth();
  ellipseMode(CENTER);
  frameRate(30);
  noStroke();
  currX = 100;
  currY = 400;
}


void draw(){
  background(235,240,255);
  currY -= 2; 
  // move left / right seldom
  if(random(10) > 9){
  currX += (random(4)-2);
  }
  
  // main balloon
  strokeWeight(0.5);
  stroke(185,58,169, 90);
  fill(185,58,169,80);
  ellipse(currX,currY ,ballWidth ,ballHeight );

  // highlight
  noStroke();
  strokeWeight(1);
  stroke(255, 50);
  fill(247,240,246);
  ellipse(currX - 5,currY - 15 ,15,18);
  //triangle at bottom
  fill(185,58,169,80);
  triangle(currX ,currY + ballHeight/2, currX + 5, currY + ballHeight/2 + 5, currX - 5, currY + ballHeight/2 + 5);
  
  // string....
  stroke(150);
  strokeWeight(1.5);
  line(currX ,currY + ballHeight/2 + 2,currX ,currY + ballHeight/2 + 20);
  // move bottom part more frequently
  line(currX ,currY + ballHeight/2 + 20,currX + random(4)-2 ,currY + ballHeight/2 + 90);
  
  // move to bottom and recycle balloon
  if(currY < -120){
    currY = 600;
  }
}
