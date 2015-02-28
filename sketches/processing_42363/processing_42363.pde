
//Michael Kling
//Object Oriented Programming


//declaration object
color[] myColors={
  #ff00ff, #ff0000,#ff9900,#ffff00,#00ff00,#00ffff
};
Ball myBall;
Ball myBall2;
Ball myBall3;
Ball myBall4;

int NUM_BALLS = 500;
Ball[] myBalls = new Ball[NUM_BALLS];
void setup(){

   size(500,500);
   smooth();
   noStroke();
   
   //array population
  for(int i=0; i < NUM_BALLS; i++){
    myBalls[i] = new Ball();
    myBalls[i].posX = i;
    myBalls[i].posY = random(0,height);
    myBalls[i].acceleration = random(0.1,1);
  }
}

//Draw function
void draw()
{
      background(0,0,0,10);
   //create a new instance
  for(int i=0; i < NUM_BALLS; i++){
  myBalls[i].update();
  }

}
  
  
//classes
  class Ball
  {

    //properties
    int i=0;
   float myDiameter=2;
    float myDiameter2=2;
    float posX = 250;
    float posY = 250;
    float speedX=0;
    float shapeshift=15;
    float speedY=0;
    float acceleration=0.5;
    void update()
    {
      fill(192,191,255);
        ellipse(posX,posY,myDiameter, myDiameter2);
        posX+=speedX;
        posY+=speedY;
        if(posX<mouseX && mousePressed==true){
          speedX=5;
        }
        else if(posX>mouseX && mousePressed==true){
          speedX=-5;
        }
       
        else
        {speedX =speedY;
        }
        
            if(posY<mouseY && mousePressed==true){
          speedY=5;
        }
        else if(posY>mouseY && mousePressed==true){
          speedY=-5;
        }
      
        myDiameter=random(0,5);
        myDiameter2=myDiameter+1;
        shapeshift=random(0,1);
        if(myDiameter>200){
          myDiameter=1;
        }
        if(posX>width){
          posX=0;
          }
        else if (posX<0){
          posX=width;
        }
           if(posY>height){
          posY=0;
          speedY=0;
          speedX=0;
          }
        else if (posY<0){
          posY=height;
        }
        if(speedY<10){
          speedY += acceleration;
        }
    }
  
  }

