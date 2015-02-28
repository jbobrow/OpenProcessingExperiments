
//Pong 2014: Ballsier Edition
//By Andrew Butschli

/* @pjs font="consola.ttf"; */

Ball ball1, ball2, ball3;
//establish variable for background image
PImage bg;
//establish variable for font
PFont font;
 
void setup(){
  size(400,400);
  smooth();
  
  //load background image into sketch
  bg = loadImage("pingPongTable.png");
  
  //load font into sketch
  font = loadFont("Consolas-36.vlw");
  textFont(font);
   
  //establish each new instance of class and starting position
  ball1 = new Ball(50,50);
  ball2 = new Ball(100,100);
  ball3 = new Ball(75,75);
}
 
void draw(){
  //call background image to screen
  image(bg,0,0);
   
  //paddle
  fill(255);
  rect(mouseX-32,300,75,10);
   
  //call each instance of class to screen
  ball1.move();
  ball1.display();
  ball2.move();
  ball2.display();
  ball3.move();
  ball3.display();
  
  //call text to screen
  fill(0,237,17);
  textSize(36);
  text("Pong 2014",105,40);
  textSize(14);
  text("Your mouse controls the paddle. Don't miss them!",12,385);
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
  //variable for speed
  float speed;
   
  Ball(float tposX, float tposY){
    posX = tposX;
    posY = tposY;
  }
  void move(){
    posY += dirY;
    posX += dirX;
    speed = random(2,5);
     
    //set ball to not leave screen
    if(posY >= (height-15)){
      dirY = -speed;
    }else if(posY <= 15){
      dirY = speed;
    }else if(posX >= (width-15)){
      dirX = -speed;
    }else if(posX <= 15){
      dirX = speed;
    }
     
    //paddle hit effect
    if(dist(posX, posY, mouseX+33, 315) < 25){
      dirX = -(random(3,6));
      dirY = -(random(1,4));
    }else if(dist(posX, posY, mouseX+10, 315) < 25){
      dirX = -(random(3,6));
      dirY = -(random(1,4));
    }else if(dist(posX, posY, mouseX-10, 315) < 25){
      dirX = -(random(3,6));
      dirY = -(random(1,4));
    }else if(dist(posX, posY, mouseX-32, 315) < 25){
      dirX = -(random(3,6));
      dirY = -(random(1,4));
    }
  }
  void display(){
     
    //set ball to red if below paddle, white otherwise
    if(posY > 320){
      fill(255,0,0);
    }else if(posY <= 320){
      fill(250,214,165);
    }
    ellipse(posX,posY,25,25);
    noFill();
  }
}



