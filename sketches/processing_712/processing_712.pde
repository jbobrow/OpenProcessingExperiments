
class Ball{

  float ballX;
  float ballY; // Position
  float ballR;  
  float del;
  int ballCurrentPosX;  
  int ballCurrentPosY;
  color desiredCol;   
  color nextColor; 
  float ballMax=height;         // Maximum Y value
  float ballMin = 0 ;          // Minimum Y value
  boolean ballOver = false;  // If mouse 
  boolean ballMove = false;  // If mouse down and over
  boolean check;
  boolean checkColor;
  // Spring simulation constants
  float M;   // Mass
  float K = 0.03;   // Spring constant
  float D = 0.95;  // Damping
  // Rest position
  float R=height;
  // Spring simulation variables
  float Vs = 3.0;  // Velocity
  float As = 0;    // Acceleration
  float F = 0;     // Force
  float cc = millis(); 

  Ball(float ballX1,float ballY1,float ballR1,float M1){
    ballX=ballX1;
    ballY=ballY1;
    ballR=ballR1;
    M=M1;


  }

  void ballDraw()  {

    ellipse(ballX,ballY, ballR, ballR);
    if (ballX>width-ballRadius/2){
      ballX-=10;
    }
    if (ballX<ballRadius/2){
      ballX+=10;
    }
  }



  void ballUpdate(){
    float pos = ballX;
    int Pos1 = floor (pos);
    float pos2 = ballY+ballR*2;
    int Pos12 = floor (pos2);
    color g = get(Pos1,Pos12);
    if (g == blobCol){
      R=ballY+ballR*2;
    }

    // Update the ball position
    F = -K * (ballY - R); // f=-ky
    As = F / M;           // Set the acceleration, f=ma == a=f/m
    Vs = D * (Vs + As);   // Set the velocity
    ballY =  ballY  + Vs;  // Updated position y
    //ballX =  ballX  +vs; // Updated position x

    if(abs(Vs) < 0.1) {
      Vs = 0.0;
    }

    // Set and constrain the position of top bar
    if(ballMove) {
      ballY = mouseY;
      ballX = mouseX + random(-1,1);
      if (ballY < ballMin) { 
        ballY = ballMin; 
      } 
      if (ballY > ballMax) { 
        ballY = ballMax; 
      }


    }
  }

  void ballMoveWIthMe(){
    float pos3 = ballX ;
    int Pos3 = floor (pos3);
    for (int z=video.height-1; z>0; z--){

      color h = get (Pos3, z);
     
      if (h == blobCol){
        R=z;
        if (z>ballY){
          ballY += 0.1;
        }
        if (z<ballY){
          ballY-= 0.1;
        }
      }
    }
  }


  void ballMoveWIthMeDown(){

    float pos33 =ballX ;
    int Pos33 = floor (pos33);
    for (int v=0; v<video.height-1; v++){

      color j = get (Pos33, v);
      
      if (j == blobCol){
        R=v;
        if (v>ballY){
          ballY += 0.1;
        }
        if (v<ballY){
          ballY-= 0.1;
        }
    
      }
    }
  }
  void ballMouseOver() {

    ballMove = true;
  }


  void ballMouseOutOfScrean(){
    ballMove = false;
  }

  void ballFloat (float floatmin, float floatmax){
    ballY += random(floatmin,floatmax);
  }

  void ballLinesDraw (Ball b){

    line(ballX,ballY,b.ballX,b.ballY);
  }
}



















































