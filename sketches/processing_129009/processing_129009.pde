

   
void setup() {               /// this is the code that sets up the window size that the game will run in 
  size(1000,700);
  
}
 
void draw() {                      
  background(ball_x,200,ball_y);   // this is the code that sets the background colour according to the position of the bal on screen 
  ball();                          // this sets the ball so that it can be called upon when ever its needed 
  Bat1();                          // this sets the variable  of  Bat1 
  Bat2();                          // this sets the variable  of  Bat2 
  stroke(0);                       // this code sets the stroke colour of the shapes that are used for the ball and both bats 
  line(500,0,500,700);             // this is the line that goes down the middle of the window 
    
}
 
 
/////////////
//BALL
////////////
 
float ball_x=30;                   // this is the code that sets the variables for the balls preferences.
float ball_y=30;                   // these preferences being the height, width , x and y coordinates. 
float ball_w=20;
float Speedx=3;
float Speedy=3;
 
void ball() {
  rect(ball_x,ball_y,ball_w,ball_w);  /// this code sets the shape of the ball to a square and applies the speeds set of x and y
  ball_x+=Speedx;
  ball_y+=Speedy;
   
   
   
  if(ball_x>width) {         // this code stops that ball from going out the both sides of the window and keeps the ball in play
    Speedx*=-1;

  }
   
  if(ball_x<0) {
    Speedx*=-1;
    
  }
 
  if(ball_y>height) {  // this code stops that ball from going out the top and bottom of the window and keeps the ball in play
    Speedy*=-1;
  }
   
  if(ball_y<0) {
    Speedy*=-1;
  }
   
  if(ball_x>Bat2_x-Bat2_w && ball_x<Bat2_x && ball_y<mouseY+Bat2_h && ball_y>mouseY) {   // this code set the bat 2 as the bat that the player controls during the game
    Speedx*=-1;
  }
   
  if(ball_x<Bat1_x+2*Bat1_w && ball_x>Bat1_x && ball_y<Bat1_y+Bat1_h && ball_y>Bat1_y) { // this code sets the first bat to try and  
    Speedx*=-1;                                                                          //intercept the balls movements by trying to go to the location the ball is currently traveling towards
  }
   
}

//////////////
//Bat 1
//////////////
 
float Bat1_x=100;                     // sets the x coordinate for bat1 
float Bat1_y=300;                     // sets the y coordinate for bat1
float Bat1_w=10;                      //sets the width of bat1
float Bat1_h=80;                      //sets the height of bat1
float AutoBat=2;                      // this code sets the speed at which the bat will travel to try and intercept the ball 
 
void Bat1() {
  fill(255);                          // this code sets the fill colour of the bat 
  rect(Bat1_x,Bat1_y,Bat1_w,Bat1_h);  // this code take the values from the float bat1 to get the size and height of the bat1
   
  if(Bat1_y+Bat1_h/2<ball_y) {       // this is the code that allows at1 to try and intercept the ball 
    Bat1_y+=AutoBat;
 
  }
   
  if(Bat1_y+Bat1_h/2>ball_y) {       // this is the code that allows at1 to try and intercept the ball 
    Bat1_y-=AutoBat;
 
  }
   
}
//////////////
//Bat 2
//////////////
 
 
float Bat2_x=900;                   // sets the x coordinate for bat1 
float Bat2_y=80;                    // sets the y coordinate for bat1 
float Bat2_w=10;                    //sets the width of bat2
float Bat2_h=80;                    //sets the height of bat2
 
void Bat2() {
  Bat2_y = mouseY;  // this is the code that sets the second bat to the mouses y coordinate giving you control of the bat with the mouse 
  fill(255);        // this code sets the fill colour of the bat 
  rect(Bat2_x,Bat2_y,Bat2_w,Bat2_h);  // this code take the values from the float bat1 to get the size and height of the bat1
   
}


