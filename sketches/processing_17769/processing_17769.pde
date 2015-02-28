
class ball{

  color c = color (241,246,249);
  float ball_W;
  float ball_H;
  float xpos;
  float ypos;
  float yspeed;
  float xdrift;
  


  //constructor
  ball(float tempYpos, float temp_ball_H, float temp_ball_W){
    ball_W = temp_ball_W;
    ball_H = temp_ball_H;
    ypos = tempYpos;
    xpos = random (50,width-50);
    xdrift = random (-10,10);
    yspeed = 12;

  }
  
  //draw a ball
  void display(){

    fill(c);
    noStroke();
    ellipse(xpos, ypos, ball_W, ball_H);
    
  }
  
  //move a ball down the screen, with a random amount of horizontal drift 
  void move(){      
    ypos = ypos + yspeed;
    xpos = xpos + xdrift;
    
  }
  
  //changes the ball's horizontal direction of travel
  void changeXDirection(){
    xdrift = xdrift*(-1);
  }
  
  //changes the ball's vertical direction of travel
  void changeYDirection(){
    yspeed = yspeed*(-1);
  }  
  
 
 //get Ypos of the ball
 float getY(){
   return ypos;
 }
 
  //get Xpos of the ball
 float getX(){
   return xpos;
 }
 
 //set Yposition of ball
 void setY(float newY){
   ypos = newY;
 }
 
 
   


}

