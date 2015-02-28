
//Copyright siv, Sophie Vennix
//Homework 7
//March 4, 2014

// BE A WIZARD IN YOUR OWN 2-D QUIDDITCH MATCH
//Using the arrow keys, move the Quidditch ball around to get it into one of the hoops.
//Be careful, members of the other team will be flying around you, trying to block your shots.
//If you score 5 points, you win. If they block you 5 times, you lose.


//DECLARE QUIDDITCH HOOP MEASUREMENTS
color hoopColor1 = color(255,192,64);
color hoopColor2 = color(255,192,64);
color hoopColor3 = color(255,192,64);
float QRdiam, QRheight, QRwidth;
PImage photo1, photo2, photo3;
float x, y, w, h;
float drawUserX, drawUserY;

//DECLARE USER VARIABLES
float ballSpeedX, ballSpeedY;

//DECLARE OPPONENT VARIABLES
float speedXImage1, speedYImage1;
float image1X, image1Y;

float speedXImage2, speedYImage2;
float image2X, image2Y;

float speedXImage3, speedYImage3;
float image3X, image3Y;
float image3Counter, image3Radius;

//DECLARE COLLISION VARIABLES
float dHoop1; //BALL TO HOOP
float dHoop2;
float dHoop3;

float dOpponent1;//BALL TO OPPONENT
float dOpponent2;
float dOpponent3;

//DECLARE PRINT-STATS VARIABLES
//int startTime, endTime;
int goals, fouls;
int gamePhase;
  // 1 = Instructions screen
  // 2 = Play game
  // 3 = Final Score screen
int elapsedTime;

void setup()
{
  size(800,600);
  QRdiam=70;
  QRheight=height/3;
  QRwidth=width/100;
  photo1 = loadImage("figure1.png");
  
  //OPPONENT1
  x=0;
  y=height/2;
  
  //OPPONENT2
  image2X = 0;
  image2Y = height/2;
  speedXImage2 = 5;
  speedYImage2 = 0;
 
  //OPPONENT3
  image3X = width/2;
  image3Y = height/2;
  image3Radius = 200;
  
  //TEXT + DISPLAY
   gamePhase = 1; 

  //w=125;
  //h=40;
}

void draw()
{  
  background(93,200,205);
///PRE-SCREENS+STARTING THE GAME  
  switch(gamePhase)
  {
     case 1: 
     showInstructions();
     break;
     
     case 2:
     playGame();
     break;
     
     case 3:
     finalScore();
     break;
  }  
}

void playGame()
{
///GAME BACKGROUND
  elapsedTime();
  currentScore();
  drawQuidditchHoops();  
  
///USER
  drawUser();
  moveQuidditchBall();
  
///OPPONENTS
   moveImage1();
   moveImage2();
   moveImage3();
   image(photo1,x,y,250,70);
   image(photo1,image2X,image2Y,125,35);
   image(photo1,image3X,image3Y,83,23);
}

void elapsedTime()
{
  textSize(14);
  fill(255);
  text( "Time Elapsed: " + (frameCount/60 - 1), .875*width, .075*height );
}

void currentScore()
{
  textSize(14);
  fill( 255 );
  text( "Goals: " + goals, .9075*width, .1083333*height);
  text( "Fouls: " + fouls, .90875*width, .141666*height);
}

void showInstructions()
{ textSize(14);
  fill(255);
  textAlign( CENTER );
  text("Use the arrow keys to move the quidditch ball into one of the hoops.", width/2, 100 ); 
  text("If you make 5 goals, you win. If the other players block you 5 times, you lose.", width/2, 125);
  text("May the best wizard win.", width/2, 150);
    text("Press ENTER to begin.", width/2, 180);
  textSize(20);
  text("WELCOME TO THE FIRST EVER 2-D QUIDDITCH CHAMPIONSHIPS", width/2, 60);
  drawQuidditchHoops(); 
    if (keyPressed){
      if (key == ENTER){
      gamePhase = 2;
      //elapsedTime == frameCount;
    }   
  }   
}

void finalScore()
{ 
  fill(255);
  text("You made " + goals + " goals. ", width/2, 100 );
  
     if (fouls > goals)
   {
      
      text("WELL, THAT'S A BUMMER.", width/2, 50 );
      textSize(14);
      text("Better luck next year.", width/2, 150 );
   }
   else if (goals > fouls)
   {
     textSize(24);
     text("YOU WON!!", width/2, 50 );
     textSize(14);
     text("Congratulations, your quidditch talents are truly magical.", width/2, 150 );  
   } 
}

void drawQuidditchHoops()
{     
///QUIDDITCH HOOP 1
  noStroke();
  fill(255,192,64);
  rect(width/4,3*height/4,QRwidth, QRheight);
  
  noFill();
  stroke(hoopColor1);
  strokeWeight(6);
  ellipse(width/4+QRwidth/2, 3*height/4-QRdiam/2, QRdiam, QRdiam);
  
///QUIDDITCH HOOP 2
  noStroke();
  fill(255,192,64);
  rect(width/2,height/2,QRwidth, 2*QRheight);
  
  noFill();
  stroke(hoopColor2);
  strokeWeight(6);
  ellipse(width/2+QRwidth/2, height/2-QRdiam/2, QRdiam, QRdiam);
  
///QUIDDITCH HOOP 3
  noStroke();
  fill(255,192,64);
  rect(3*width/4,2*height/3,QRwidth, 2*QRheight);
  
  noFill();
  stroke(hoopColor3);
  strokeWeight(6);
  ellipse(3*width/4+QRwidth/2, 2*height/3-QRdiam/2, QRdiam, QRdiam);
}

///QUIDDITCH BALL (USER)
void drawUser()
{
  noStroke();
  fill(149,0,43);
  ellipse(drawUserX, drawUserY, QRdiam-30, QRdiam-30);
}

void moveQuidditchBall()
{
   drawUserX = drawUserX + ballSpeedX;
   drawUserY = drawUserY + ballSpeedY;

///BALL BOUNCES OFF WALL   
   if (drawUserX > width) {
     ballSpeedX = -ballSpeedX/2; 
     drawUserX = width;
   }
   else if (drawUserX < 0) {
     ballSpeedX = -ballSpeedX/2;
     drawUserX = 0;
   }
   if (drawUserY > height) {
     ballSpeedY = -ballSpeedY/2;
     drawUserY = height;
   }
   else if (drawUserY < 0) {
     ballSpeedY = -ballSpeedY/2;
     drawUserY = 0;
   }
   
///SCORING A POINT
  dHoop1 = dist(drawUserX, drawUserY, width/4+QRwidth/2, 3*height/4-QRdiam/2);
  dHoop2 = dist(drawUserX, drawUserY, width/2+QRwidth/2, height/2-QRdiam/2);
  dHoop3 = dist(drawUserX, drawUserY, 3*width/4+QRwidth/2, 2*height/3-QRdiam/2);
  
  if (dHoop1 <= 18){
    hoopColor1 = color(255);
    goals += 1;
    drawUserX = 0;
    drawUserY = 0;
  } else {
    hoopColor1 = color(255,192,64);
  }   
   if (dHoop2 <= 18){
    goals += 1;
    drawUserX = 0;
    drawUserY = 0;
    hoopColor2 = color(255);
  } else {
    hoopColor2 = color(255,192,64);
  } 
  if (dHoop3 <= 18){
    goals += 1;
    hoopColor3 = color(255);
    drawUserX = 0;
    drawUserY = 0;
  } else {
    hoopColor3 = color(255,192,64);
  } 
 
///RESTART IF YOU HIT AN OPPONENT
  dOpponent1 = dist(drawUserX, drawUserY, x, y);
  dOpponent2 = dist(drawUserX, drawUserY, image2X, image2Y);
  dOpponent3 = dist(drawUserX, drawUserY, image3X, image3Y);
  
   if (dOpponent1 <= 40){
    fouls ++;
    drawUserX = 0;
    drawUserY = 0;
  }   
  if (dOpponent2 <= 40){
    fouls ++;
    drawUserX = 0;
    drawUserY = 0;
  }   
  if (dOpponent3 <= 40){
    fouls ++;
    drawUserX = 0;
    drawUserY = 0;
  }  
  
///SHOW WIN/LOSE SCREEN
  textSize(14);
  if (fouls == 5){
    gamePhase = 3;
  }else if (goals == 5) {
    gamePhase = 3;
  }else{
    gamePhase = 2;
  }

}

///MOVE QUIDDITCH BALL (USER)
void keyPressed()
{
  if (key == CODED) {
    if (keyCode == RIGHT) {
      //drawUserX += 10;
      ballSpeedX ++;
    }
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      //drawUserX -= 10;
      ballSpeedX --;
    }
  }
  if (key == CODED) {
    if (keyCode == UP){
      //drawUserY -= 10;
      ballSpeedY --;
    }
  }
  if (key == CODED) {
    if (keyCode == DOWN){
      //drawUserY += 10;
      ballSpeedY ++;
    }
  }
}

///QUIDDITCH OPPONENT 1 (BOUNCING)
void moveImage1()
{
  x = x + speedXImage1;
  y = y + speedYImage1;
  
   if (x <= 0){
     speedXImage1 = 4;
     speedYImage1 = 0;
   }
   if (x >= width - w){
     speedXImage1 = -4;
     speedYImage1 = random(-3,3);//0;
   }
///DON'T LET OPPONENT1 FLY TOO FAR AWAY FROM QUIDDITCH HOOPS
   if (y <= height/3){
     speedXImage1 = random(3);
     speedYImage1 = -speedYImage1;
   }
   if (y >= 2*height/3){
     speedXImage1 = random(3);
     speedYImage1 = -speedYImage1;
   }
}

///QUIDDITCH OPPONENT 2 (WRAPPING)
void moveImage2()
{
  image2X = image2X + speedXImage2;
  image2Y = image2Y + speedYImage2;
  
  if (image2X > width) {//OPPONENT TOO FAR RIGHT
    image2X=-83;//MOVE OPPONENT BACK TO LEFT SIDE
  }  
}

///QUIDDITCH OPPONENT 3 (CIRCLING)
void moveImage3()
{
  image3X = width/2 + cos(image3Counter) * image3Radius;
  image3Y = height/2 + sin(image3Counter) * image3Radius;
  image3Counter += PI/180;
}



