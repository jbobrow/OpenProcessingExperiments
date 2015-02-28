
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/141654*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
Ball ball1, ball2;

PImage img;

void setup(){
  size(400,400);
  background(255);
  smooth();
  ball1 = new Ball(0,0);
  ball2 = new Ball(100,100);
}

void draw(){
  background(255);
  ball1.move();
  ball1.display();
  ball2.move();
  ball2.display();
}
class Ball {
  //variable for y position
  float posY = 0;
  //variable for y direction
  float dirY = 1;
  //variable for x position
  float posX = 0;
  //variable for x direction
  float dirX = 1;
  
  Ball(float tposX, float tposY){
    posX = tposX;
    posY = tposY;
    img = loadImage("nickcage.png");
  }
  void move(){
    posY += dirY;
    posX += dirX;
    //set ball to not leave screen
    if(posY > height){
      dirY = -dirY;
    }else if(posY < 0){
      dirY = -dirY;
    }else if(posX > width){
      dirX = -dirX;
    }else if(posX < 0){
      dirX = -dirX;
    }
    //paddle hit effect
    if(posY == mouseY){
      dirY = -(random(1,4));
    }else if(posY == mouseY){
      dirY = random(1,4);
    }else if(posX == mouseX){
      dirX = -(random(3,6));
    }else if(posX == mouseX){
      dirX = random(3,6);
    }
  }
  void display(){
    image(img,posX,posY,40,60);
    noFill();
    rect(mouseX,mouseY,75,10);
  }
}



