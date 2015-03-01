
//Super Paddle 14: Balls to the Wall Edition
//By Andrew Butschli | ©2014 Ginger Thor Industries, LLC
 
/* @pjs font="data/consola.ttf"; */
 
//establish classBall as array list
ArrayList<Ball> balls;
//establish variable for background image
PImage bg;
//establish variable for alt background image
PImage alt;
//establish variable for game over image
PImage over;
//establish variable for font
PFont font = createFont("consolas",36);
//establish variable for counter
float counter = 0;
//establish variable for second counter
float counter2 = 0;
//establish variable for iamge fading
float fadeSpeed = 0;
  
void setup(){
  size(400,400);
  smooth();
   
  //load background image into sketch
  bg = loadImage("pingPongTable.png");
  
  //load alt background image into sketch
  alt = loadImage("altBackground.png");
  
  //load game over image into sketch
  over = loadImage("gameOver.png");
   
  //initialize array list
  balls = new ArrayList<Ball>();
  
  //add first ball
  balls.add(new Ball(random(100),random(100)));
  balls.add(new Ball(random(100),random(100)));
  balls.add(new Ball(random(100),random(100)));
   
  //load font into sketch
  textFont(font);
}
  
void draw(){
  //call background image to screen
  image(bg,0,0);
  
  //call alt background image to screen on click
  if(keyPressed && key == ' '){
    image(alt,0,0);
  }
    
  //paddle
  fill(0);
  noStroke();
  if(mousePressed && mouseButton == RIGHT){
    rect(mouseX-12,300,25,10);
  }else rect(mouseX-32,300,75,10);
   
  //call array list using "for" loop
  for(int i = 0; i < balls.size(); i++){
    Ball newBall = balls.get(i);
    newBall.move();
    newBall.display();
  }
  
  //new ball at 100
  if(counter2 >= 150){
    balls.add(new Ball(0,0));
    counter2 = 0;
  }
  
  //reset score on button press
  if(keyPressed && key == 'r'){
    counter = 0;
    counter2 = 0;
  }
   
  //call text to screen
  fill(0,237,17);
  textSize(30);
  text("Super  Paddle",90,30);
  text("1 4",168,60);
  textSize(14);
  text("Use your mouse to control the paddle!",53,385);
  textSize(24);
  text(counter,200,205);
  textSize(18);
  text("S c o r e",85,203);
  
  //set game over screen and fade-in
  if(counter < 0){
    gameover();
  }
}

void gameover(){

    fadeSpeed = fadeSpeed +2;
    tint(255,fadeSpeed);
    image(bg,0,0);
    tint(255,fadeSpeed);
    image(over,0,0);
  
}

class Ball{
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
      //establish score loss for missed balls
      if(counter > 25){
        counter = counter * .85;
      }else if(counter < 25){
        counter = counter - 4;
      }
    }else if(posY <= 15){
      dirY = speed;
    }else if(posX >= (width-15)){
      dirX = -speed;
    }else if(posX <= 15){
      dirX = speed;
    }
    
    //paddle hit effect with score gains for both paddle sizes
    if(mousePressed && mouseButton == RIGHT){
      if(dist(posX, posY, mouseX+13, 315) < 25){
        dirX = -(random(3,6));
        dirY = -(random(1,4));
        counter = counter + 2;
        counter2 = counter2 + 2;
      }else if(dist(posX, posY, mouseX+10, 315) < 25){
        dirX = -(random(3,6));
        dirY = -(random(1,4));
        counter = counter + 2;
        counter2 = counter2 + 2;
      }else if(dist(posX, posY, mouseX-10, 315) < 25){
        dirX = -(random(3,6));
        dirY = -(random(1,4));
        counter = counter + 2;
        counter2 = counter2 + 2;
      }else if(dist(posX, posY, mouseX-12, 315) < 25){
        dirX = -(random(3,6));
        dirY = -(random(1,4));
        counter = counter + 2;
        counter2 = counter2 + 2;
      }
    }else if(dist(posX, posY, mouseX+33, 315) < 25){
      dirX = -(random(3,6));
      dirY = -(random(1,4));
      counter = counter + 2;
      counter2 = counter2 + 2;
    }else if(dist(posX, posY, mouseX+10, 315) < 25){
      dirX = -(random(3,6));
      dirY = -(random(1,4));
      counter = counter + 2;
      counter2 = counter2 + 2;
    }else if(dist(posX, posY, mouseX-10, 315) < 25){
      dirX = -(random(3,6));
      dirY = -(random(1,4));
      counter = counter + 2;
      counter2 = counter2 + 2;
    }else if(dist(posX, posY, mouseX-32, 315) < 25){
      dirX = -(random(3,6));
      dirY = -(random(1,4));
      counter = counter + 2;
      counter2 = counter2 + 2;
    }
    
    //set balls to upper left with no movement upon game over
    if(counter < 0){
      posX = 0;
      posY = 0;
      dirX = 0;
      dirY = 0;
      speed = 0;
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



