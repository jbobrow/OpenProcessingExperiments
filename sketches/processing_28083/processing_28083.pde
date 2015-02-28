
class BallExplode {
  float x;
  float y;
  float squareWidth;
  //color squareColor = color(random(1,255),0,0);
  float xSmallSquare=x;
  boolean ySpeedFirst = true;
  float yspeed =0;
  float xChange;

  void move() {   
    x+=xChange;
    yspeed = yspeed += 0.2;
    y+=yspeed;  
    randomColor = random(2);
    changeShardColor();
    fill (myShardColor);
    rect(x,y,squareWidth,squareWidth);
  }  
  BallExplode(float x, float y) {
    xChange = (random(0,20))-10;
    yspeed= (random(0,20))-10;
    this.x = x;
    this.y = y;
    squareWidth=bottleSize/6;
    float colorShatter;   
    rect(x,y,squareWidth,squareWidth);
    
  }
}


