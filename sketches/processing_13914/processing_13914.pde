

public class Ball{
  //center values for the ball. (the ball's origin)
  float x,y,r;
  float cenX, cenY;
  Ball(float x,float y,float r){
      this.x = x;
      this.y = y;
      this.r = random(r);
      this.cenX = x;
      this.cenY = y;
  }
  
  public void drawBall(){
    noStroke();
    fill(244,8);
    ellipse(x,y,r,r); 
    //rect(x,r,y,r);
  }
  

}

