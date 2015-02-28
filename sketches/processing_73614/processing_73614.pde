
//===========================BEGIN CLASS=========================//
class Decoy {
  //ALL COMMENTS JUSTIFIED RIGHT------------------>
  float x; //= 300;                     //starting xpos for ball
  float y; //= 300;                     //starting ypos for ball
  float xspeed; //= 5;                  //balls' run movement increment
  float yspeed; //= 5;                  //balls' rise movement increment
  float suddenDeathTime;                //randomized variable for sudden death
  int k;                                //variable to stop ball once off-screen

  float paddle1X, paddle1Y;
  float paddle2X, paddle2Y;



  //===========================BEGIN CONSTRUCTOR=====================//

  Decoy(float Xspeed, float Yspeed, float inXpos, float inYpos, float DeathTime) { //passed arguments for xspeed, yspeed, starting x, starting y, and sudden death
    xspeed = Xspeed;
    yspeed = Yspeed;
    x = inXpos;
    y = inYpos;
    suddenDeathTime = DeathTime;
    k = 0;
    paddle1X = 0;
    paddle1Y = 0;
    paddle2X=0;
    paddle2Y=0;
  }
  //===========================END CONSTRUCTOR======================//

  //==========================BEGIN FUNCTIONS======================//

  void display () {                     //ball object display
    fill(246, 172, 45);
    ellipseMode(CENTER);
    ellipse (x, y, 20, 20);
    //println("Value of X = "+x);
    //println("Value of Y = "+y);
  }

  void move () {                        //ball move function

    x=x+xspeed;                         //x value increment
    y=y+yspeed;                         //y value increment

    if (xspeed<2 && xspeed>-2) {        //xspeed bounds, ensuring xspeed never dips below 2, -2
      if (xspeed >= 0) {
        xspeed=xspeed+1.5;              //if positive, increment by 1.5
      }
      if (xspeed <= 0) {
        xspeed=xspeed-1.5;              //if negative, increment by -1.5
      }
      //println("xspeed = " +xspeed);   //print line to see what value is picked if -2<xspeed<2
    }
    if (yspeed<2 && yspeed>-2) {        //yspeed bounds, ensuring yspeed never dips below 2, -2
      if (yspeed >= 0) {
        yspeed=yspeed+1.5;              //if positive, increment by 1.5
      }
      if (yspeed <= 0) {                
        yspeed=yspeed-1.5;              //if negative, increment by 1.5
      }
      //println("yspeed = " +yspeed);   //print line to see what value is picked if -2<yspeed<2
    }
    if (x>width+10 || x<-30) {          //bounds for x axis
      x= int (random(250, 750));        //respawn at random x value
      y= int (random(500, 600));        //respawn at random y value
    }



    if (y>(height/1.1)-15 || y<(height/5.1)+25) { //bounds for y axis
      yspeed = yspeed * -1;             //reverse direction
      //println ("A collision with the top or bottom of the screen has been detected!");
    }
  }
  void xSetP1(float tempP1X) {          //method that receives an incoming int

    //println("The incoming value is = "+tempP1X);//print ln for checking incoming x values
    paddle1X = tempP1X;                //assign the incoming int to x
  }
  void ySetP1(float tempP1Y) {         //method that receives an incoming int

    //println("The incoming value of Y is = "+tempP1Y);//print ln for checking incoming y values
    paddle1Y = tempP1Y;               //assign the incoming int to x
  }

  void P1collisionDetection () {      //player 1 collision detection function
    //println("What is paddle1Y's value?" +paddle1Y);
    //println("What is paddle1X's value?" +paddle1X);

    //println( "Collision detection function is running"); //debug print ln for detecting when the function is running
    if (paddle1X+15>x-10 && paddle1X<x-10 && y>=paddle1Y && y<=paddle1Y+80) {//checks to see if ball is within paddle values
      xspeed = xspeed * -1;           //reverses x speed
      yspeed = yspeed * -1;           //reverses y speed

      //println( "A collision has been detected!"); //debug print ln to detect when there's been a collision
    }
  }
  void xSetP2(float tempP2X) {        //method that receives an incoming int

    //println("The incoming value is = "+tempP2X);//debug to check what the value 
    paddle2X = tempP2X;               //assign the incoming int to paddle2X
  }
  void ySetP2(float tempP2Y) {        //method that receives an incoming int

    //println("The incoming value of Y is = "+tempP2Y);
    paddle2Y = tempP2Y;               //assign the incoming int to paddle2Y
  }
  void P2collisionDetection () {      //player 2 collision detection function
    //println("What is paddle2Y's value?" +paddle2Y);
    //println("What is paddle1X's value?" +paddle1X);

    //println( "Collision detection function is running");
    if (paddle2X<=x+10 && paddle2X+15>x+10 && y>=mouseY && y<=mouseY+80) {//checks to see if ball is within paddle values
      xspeed = xspeed * -1;           //reverses x speed
      yspeed = yspeed * -1;           //reverses y speed
    }
  }
  void suddenDeath () {//SUDDEN DEATH ACTIVATION
    if (millis() >=suddenDeathTime) {    //if the game goes longer than the value put in the DeathTime variable
      //println("sudden death activated");
      if (xspeed>0 && xspeed<5) {         //xspeed increases gradually until 5
        xspeed=xspeed+1;
      }
      if (xspeed<0 && xspeed>-5) {         //xspeed decreases gradually until -5
        xspeed=xspeed-1;
      }
      if (yspeed>0 && yspeed<5) {        //yspeed increases gradually until 5
        yspeed=yspeed+1;
      }
      if (yspeed<0 && yspeed>-5) {       //yspeed decreases gradually until -5
        yspeed=yspeed-1;
      }
    }
  }  

  //===========================END FUNCTIONS=======================//
}
//=============================END CLASS=========================//


