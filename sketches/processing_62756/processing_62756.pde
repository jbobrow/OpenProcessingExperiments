
float ballx, bally;
float xspeed = -4;
float yspeed = 4;
float ballDiameter = 16;
float paddleX1, paddleY1, paddleXAI, paddleYAI, paddleW=60;
float line1X=200;
float line2X=600;
boolean startMenu = true;
float player = 0;
float difficulty = 1 ;
float textR, textG, textB;
float score = 0;
float titleY = 600;
float textAlpha = 0;
float AImistake;
float A = -30;

void setup() {
  size(800, 600); 
 
  //start point
  ballx = width/2;
  bally = random(height);
  smooth();
  
}
 
void draw() {
  background(50,100,0);
   
  fill(45,80,5);
  rect(0,0,200,600);
  rect(600,0,200,600);
   
  stroke(0,50,150);
  line(line1X, 0, line1X, width);
  line(line2X, 0, line2X, width);
   
  noStroke();
  fill(30,15,5);
  rect(0,590,810,10);
  rect(0,0,10,610);
  rect(790,0,10,610);
   
  fill(100,90,50,90);
  rect(0,595,810,10);
  rect(-5,0,10,610);
  rect(795,0,10,610);
 
  fill(0,0,0,90);
  rect(0,10,800,30);
  fill(45,30,10);
  rect(0,0,800,30);
  fill(100,90,50,70);
  rect(0,0,800,15);
   
textR = random(255);
textG = random(255);
textB = random(255);
   
  if(startMenu) {
    textSize(40);
    //red ellipse
    noStroke();
    fill(95,10,10,textAlpha);
    textAlpha = textAlpha + 1;
    ellipse(400,290,300,100);
    //brown ellipse
    fill(80,70,40,textAlpha);
    textAlpha = textAlpha + 1;
    ellipse(400,290,295,80);
    fill(30,15,5,textAlpha);
    textAlpha = textAlpha + 1;
    ellipse(400,290,295,60);
    //green cover
    fill(50,100,0);
    rect(205,190,390,100);
    //brown cube
    fill(45,30,10);
    rect(200,titleY-60,400,100);
    fill(100,90,50,90);
    rect(200,titleY-60,400,50);
    //red cube
    fill(30,0,0);
    rect(202,titleY-33,375,50);
    fill(95,10,10);
    rect(200,titleY-35,375,50);
    fill(180,40,75,150);
    rect(200,titleY-35,375,30);
    //TEXT
    textSize(40);
    fill(50,10,10);
    text("CityU Open 2012", 240, titleY+2);
    fill(textR,textG,textB);
    text("CityU Open 2012", 238, titleY);
    textSize(20);
    fill(textR,textG,textB,textAlpha);
    textAlpha = textAlpha + 1;
    text("Press 1 to START", 318, 310);
    titleY = titleY - 5;
     
    if(titleY < 250) {
      titleY = 250;
    }
  }
 
  else {
 
    difficulty = min (difficulty, difficulty+ 0.1,5);
        
    ballx = ballx - (xspeed * difficulty);
    bally = bally + (yspeed * difficulty);
 
    if (bally > height - ballDiameter/2-10  || bally < ballDiameter/2+30 ) {
      yspeed *=  -1;
    }
    //if (ballx > width - ballDiameter/2) { //|| ballx < ballDiameter/2 ) {
     // xspeed *=  -1;
    //}
//red cube in the mid
    fill(25,0,0);
    rect(275,2.5,250,25);
    fill(95,10,10);
    rect(277.5,5,247.5,22.5);
     
textSize(18);
fill(255,150,150);
text("CityU Open 2012",330,22);
fill(255,0,0);
text("0",210,20);
text("0",580,20);
 
 //LOST
    if(ballx < ballDiameter/2 - ballDiameter) {
    //browm cube
    fill(45,30,10);
    rect(200,145,400,120);
    fill(100,90,50,90);
    rect(200,145,400,75);
    //red cube
    fill(95,10,10);
    rect(251,145,300,75);
    fill(180,40,75,150);
    rect(251,145,300,45);
     
    textSize(35);
    fill(55,10,10);
    text("You lost :(", 310, 198);
    fill(255,150,150);
    text("You lost :(", 312, 200);
    textSize(20);
    text("Please press any key to RESTART", 245, 250);
    textSize(18);
    fill(textR,textG,textB);
    text("CityU Open 2012",330,22);
  }
//WIN
    if(ballx > width) {
    //browm cube
    fill(45,30,10);
    rect(200,145,400,120);
    fill(100,90,50,90);
    rect(200,145,400,75);
    //red cube
    fill(95,10,10);
    rect(251,145,300,75);
    fill(180,40,75,150);
    rect(251,145,300,45);
     
    textSize(30);
    fill(55,10,10);
    text("Congratulation :)", 275, 198);
    fill(255,150,150);
    text("Congratulation :)", 277, 200);
    textSize(20);
    text("Please press any key to RESTART", 245, 250);
    textSize(18);
    fill(textR,textG,textB);
    text("CityU Open 2012",330,22);
  }
   
    // handle collisions with paddle here ************
if (player == 1){
  player1();  
}
 
    // ball
    noStroke();
    fill(50,0,0,90);
    ellipse(ballx+5, bally+5, ballDiameter, ballDiameter);
    fill(140,40,40);
    ellipse(ballx, bally, ballDiameter, ballDiameter);
    fill(160,30,45);
    ellipse(ballx, bally-3, ballDiameter-6, ballDiameter-6);
    fill(255);
    ellipse(ballx-3, bally-3, ballDiameter-12, ballDiameter-12);
     
    //player 1
    paddleX1 = min(mouseX, line1X - 4);
    paddleY1 = constrain(mouseY, paddleW/2+30, height - paddleW/2 -10);
    fill(0,0,0,90);
    rect(paddleX1+5, (paddleY1-paddleW/2)+5, 8, paddleW);
    fill(30,15,5);
    rect(paddleX1, paddleY1-paddleW/2, 8, paddleW);
    fill(100,90,50,90);
    rect(paddleX1+2, paddleY1-paddleW/2, 6, paddleW);
    fill(200,190,175,90);
    rect(paddleX1+6, paddleY1-paddleW/2, 2, paddleW);
    
    //AI
 
    if(A < 41){
      A = A + 0.1;
    }else if(A >= 40){
      A = A *-1;
    }
    
    AImistake = constrain(A ,-40,40);
    paddleXAI = max(0 , line2X + 4);
    paddleYAI = constrain(bally + AImistake, paddleW/2+30, height - paddleW/2-10);
    fill(0,0,0,90);
    rect(paddleXAI+5, (paddleYAI-paddleW/2)+5, 8, paddleW);
    fill(30,15,5);
    rect(paddleXAI, paddleYAI-paddleW/2, 8, paddleW);
    fill(100,90,50,90);
    rect(paddleXAI+2, paddleYAI-paddleW/2, 6, paddleW);
    fill(200,190,175,90);
    rect(paddleXAI+6, paddleYAI-paddleW/2, 2, paddleW);     
  }
}

void keyPressed() {
    if (keyCode == '1') {
      player = 1;
      startMenu = false;
  }
 
  ballx = random(200,600);
  bally = random(30,590);
}
 
void player1(){
  if ((ballx >= paddleX1 - abs(xspeed) + ballDiameter/2 && ballx <= paddleX1 + ballDiameter/2) && (bally >= paddleY1 - paddleW/2 && bally <= paddleY1 + paddleW/2) || (ballx >= paddleXAI - abs(xspeed) + ballDiameter/2 && ballx  <= paddleXAI + ballDiameter/2) && (bally >= paddleYAI  - paddleW/2 && bally <= paddleYAI + paddleW/2))
    {
      println("hit @ "+frameCount);
      xspeed *=  -1; // collision with paddle
    }
 
}


