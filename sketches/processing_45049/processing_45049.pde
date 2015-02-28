
class Ball{
  //PVector position;
  float xPos, yPos;
  float ballSize;
  color ballColor;
  
  Ball(){
    ballSize = 50;
    //position = new PVector(random(ballSize, width - ballSize), random(ballSize, height - ballSize));
    xPos = random(ballSize, width - ballSize);
    yPos = random(ballSize, height - ballSize);
  }
  
  void draw(){
    stroke(20,15);
    strokeWeight(2);
    fill(ballColor);
    pushMatrix();
      //translate(position.x, position.y);
      translate(xPos, yPos);
      ellipse(0, 0, ballSize*2, ballSize*2);
    popMatrix();
  }
  
  void coloring(){
    ballColor = color (xPos-50, yPos-50, yPos-xPos, 10);
    //ballColor = color (position.x - 100, position.y -100, position.y - position.x, 10);
  }

}

