
//Pong 2014: Ballsier Edition
//By Andrew Butschli | Copyright Ginger Thor, LLC 2014

/* @pjs font="data/consola.ttf"; */

//establish classBall as array
Ball[] balls = new Ball[3]; 
//establish variable for background image
PImage bg;
//establish variable for font
PFont font = createFont("consolas",36);
//establish variable for counter
int counter = 0;
 
void setup(){
  size(400,400);
  smooth();
  
  //load background image into sketch
  bg = loadImage("pingPongTable.png");
  
  //call array in setup using "for" loop
  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball(random(10,200),random(10,200));
  }
  
  //load font into sketch
  textFont(font);
}
 
void draw(){
  //call background image to screen
  image(bg,0,0);
   
  //paddle
  fill(0);
  noStroke();
  rect(mouseX-32,300,75,10);
  
  //call class move and display using "for" loop
  for(int i = 0; i < balls.length; i++){
    balls[i].move();
    balls[i].display();
  }
  
  //call text to screen
  fill(0,237,17);
  textSize(36);
  text("Pong 2014",102,40);
  textSize(14);
  text("Use your mouse to control the paddle!",53,385);
  textSize(24);
  text(counter,335,50);
  textSize(14);
  text("Balls Missed:",290,30);
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
      counter++; //adds one to "balls missed" tally per bounce on bottom of screen
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
     
    //set ball to red if below paddle, tan otherwise
    if(posY > 320){
      fill(255,0,0);
    }else if(posY <= 320){
      fill(250,214,165);
    }
    ellipse(posX,posY,25,25);
    noFill();
  }
}



