
//nostroke and smooth to look nice, rect mode to help rectangle placement
void setup(){
  size(750, 500);
  smooth();
  rectMode(CENTER);
  noStroke();
}
//global variable decleration for paddles, ball, movement, and bouncing
boolean up1, down1, up2, down2;
int score1 = 0, score2 = 0;
int y1 = 250, speed1 = 3;
int y2 = 250, speed2 = 3;
int ballx = 375, bally = 250, bspeedx = 4, bspeedy = 2; 
boolean reflect = true;
//draw only holds things for drawing, nothing else
void draw(){
  background(0);
  fill(255, 0, 0);
  textSize(15);
  text("Player 1: " + score1, 250, 50);
  text("Player 2: " + score2, 415, 50);
  strokeWeight(10);
  stroke(255, 255, 255);
  line(width/2, 0, width/2, height);
  playerOne();
  playerTwo();
  ball();
}

//creates the controls for player one
void playerOne(){
  noStroke();
  fill(0, 255, 0);
  rect(5, y1, 10, 76);
  if(up1 == true && y1 > 38)
    y1 = y1 - speed1;
  else if(down1 == true && y1 < 462)
    y1 = y1 + speed1;  
}

//creates the controls for player two
void playerTwo(){
  noStroke();
  fill(0, 255, 0);
  rect(745, y2, 10, 76);
  if(up2 == true && y2 > 38)
    y2 = y2 - speed2;
  else if(down2 == true && y2 < 462)
    y2 = y2 + speed2;  
}

//collision and bouncing for the ball
void ball(){
  noStroke();
  fill(0, 0, 255);
  ellipse(ballx, bally, 26, 26);
  ballx = ballx + bspeedx;
  bally = bally + bspeedy;
  //checks if ball hits wall
  if(ballx >= 737 || ballx <= 13)
  {
    bspeedx *= -1;
    if (ballx > 737){
      ballx = width/2;
      bally = height/2;
      score1++;
    }
    else if (ballx < 13){
      ballx = width/2;
      bally = height/2;
      score2++;
    }
  }
  if(bally > 487 || bally < 13)
    bspeedy *= -1;
  //here we check if the ball touches a paddle. The way I checked for this was
  //by using the get() function which checks pixel colors. If the ball touches 
  //a green pixel, it will bounce.
  if(get(ballx+13, bally) == color(0, 255, 0) ||get(ballx-13, bally) == color(0, 255, 0)){
    bspeedx *= -1;
    if(reflect == true){
      bspeedy *= -1;
      reflect = false;
    }
  }
    
}
  
//Checks for movement
void keyPressed(){
  switch(key){
    case 'w':
    up1 = true;
    break;
    case 's':
    down1 = true;
    break;
    case 'o':
    up2 = true;
    break;
    case 'k':
    down2 = true;
  }
}
//Using key released allows for multiple buttons to be pressed, keeping track
//of keys here.
void keyReleased(){
  switch(key){
    case 'w':
    up1 = false;
    break;
    case 's':
    down1 = false;
    break;
    case 'o':
    up2 = false;
    break;
    case 'k':
    down2 = false;
    break;
  }
}


