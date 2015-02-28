
//Ball ball1;
//Ball ball2;
Ball [] balls = new Ball [50];

void setup(){
  size(960, 540);
  imageMode(CENTER);
  myImage = loadImage("snow1.jpg");
  image(myImage, width/2, height/2);
  
  for(int i=0; i < balls.length; i++){
    int x = int(random(30,300));
    int y = int(random(20,400));
    int speed = int(random(1,10));
    // color randCol = color(random(255),random(255),random(255));
    color randCol = color(random(255),random(220),random(255));
    balls[i] = new Ball(x,y,speed,20,randCol);
  }
  
  //ball1 = new Ball(50,100,2,40); //(posX,posY,ballSpeed,ballDiam)
  //ball2 = new Ball(0,300,5,100);
}

void draw(){
//  background(255);
  
  for(int i=0; i < balls.length; i++){
    balls[i].animate();
    balls[i].display();
  }
  
 
  
  //ball1.animate();
  //ball1.display();
  
  //ball2.animate();
  //ball2.display();

}
class Ball{

  int posX;
  int posY;
  int ballSpeed;
  int ballDiam;
  color randCol;
  
  Ball(int tempPosX, int tempPosY, int tempBallSpeed, int tempBallDiam, color tempRandCol){
    posX = tempPosX;
    posY = tempPosY;
    ballSpeed = tempBallSpeed;
    ballDiam = tempBallDiam;
    randCol = tempRandCol;
  }
  
  void display(){
    fill(randCol);
    ellipse(posX,posY,ballDiam,ballDiam);
  }
  
  void animate(){
    posX += ballSpeed;
    if(posX > width || posX < 0){
      ballSpeed *= -1;
      //ballSpeed = -ballSpeed;
      //ballSpeed = ballSpeed * -1;
    }
  }

}


