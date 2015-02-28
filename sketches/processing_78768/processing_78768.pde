
void setup (){
  size(700, 300);
}

float x = 700;  //variable to move object in x-direction
float y = 200;  //variable to move object in x-direction
float speedX = -4;  //speed in x direction
float speedY = 3;  //speed in y direction
int counter = 3;   //"game over" counter
boolean hit = false;  //gets true if position of the mouse is position of the ball
boolean clicked = false;    //gets true if mouse is pressed while its over the ball
int score = 0;    //variable to count how often the ball got hit

void draw(){
  smooth();
  background(0); 
  drawBall();  //draw the ball
  move();     //move the ball in x and y direction  
  fakeBall(100, 200, 70, 2);    //random balls to irritate the user
  fakeBall(600, 100, 90, 50);
  fakeBall(400, 150, 110, 150);
  fakeBall(200, 50, 130, 100);
  fakeBall(500, 300, 150, 200);
  fill(240, 120, 150);
  PFont font;    //shows current score
  font = loadFont("Asenine-100.vlw");    //load font
  textFont(font, 30);    //set font and font size
  text("lives: " + counter, 10, 55); //text and text position, shows remaining lives
  countdown();  //function for "game over" countdown
  textFont(font, 30);
  text("score: " + score, 10, 30); //shows current score
}

void drawBall(){
  noStroke();
  fill(240, 120, 150);
  ellipse(x, y , 60, 60);    //ball
  fill(255);
  ellipse(x-10, y-5, 23, 23);    //left eye
  ellipse(x+10, y-5, 23, 23);    //right eye
  fill(0);
  ellipse(x-7, y-5, 15, 15);    //left pupil
  ellipse(x+7, y-5, 15, 15);    //right pupil
  fill(128, 0, 0);
  ellipse(x, y+15, 15, 15);    //mouth
}

void move(){
  if (mouseX <= x+30 && mouseX >= x-30 && mouseY <= y+30 && mouseY >= y-30){
    hit = true;    //set hit true if the position of the mouse is the position of the ball
  }
  else{
    hit = false;
  }
  x = x+speedX;   //x position changes
  if( x <= -100){    //if the ball crosses the left border it will start at the right border again
    x = width+50;
    changeSpeedY();    //the speed in y direction changes
    counter = counter-1;    //counter is set minus 1
  }
  y = y + speedY;    //y position changes
  if( y < 25 || y > height -25){  //if the ball touches the top or bottom, direction changes
    speedY = speedY*-1;
  }
 
}

void changeSpeedY(){    //function for random speed in y direction
  speedY = random(3, 10);
}

void countdown(){    //if the ball reaches the left border 3 times the game is over
  if(counter <= 0){  
    background (0);  //background turns white and the text "game over" appears
    fill(240, 120, 150);
    PFont font;
    font = loadFont("Asenine-100.vlw");    
    textFont(font, 100);
    text("game over", 110, 160);
  }
}
void mousePressed() {  //if the mouse is pressed and has the same position as the ball
  if(hit == true){     //clicked is set true
    clicked = true; 
  } 
  else{
    clicked = false;  
  }
}

void mouseReleased(){    //if the mouse is released the ball goes back to the right border, 
   if(clicked == true){  //the speed changes and the score increases by 1 
     x = width+50;
     score = score+1;  
     changeSpeedY();    
   }
}
  

void fakeBall(int x2, int y2, int ballSize, int randomColor){   //fake ball function with parameters for position, size and color
  fill(250, randomColor, randomColor);   //ball
  ellipse(x2, y2, ballSize, ballSize);
  fill(255);
  ellipse(x2-ballSize/7, y2-ballSize/12, ballSize/3, ballSize/3);    //left eye
  ellipse(x2+ballSize/7, y2-ballSize/12, ballSize/3, ballSize/3);    //right eye
  fill(0);
  ellipse(x2-ballSize/10.5, y2-ballSize/12, ballSize/5, ballSize/5);    //left pupil
  ellipse(x2+ballSize/10.5, y2-ballSize/12, ballSize/5, ballSize/5);    //right pupil
  fill(128, 0, 0);
  ellipse(x2, y2+ballSize/4, ballSize/4, ballSize/4);    //mouth
}





