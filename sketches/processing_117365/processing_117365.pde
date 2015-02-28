
//Catch the ball - Jasper Kueppers (C) 2013



//set up some global variables
int xSpeed;                    //Speed along the X-Axis
int x;                         //Center X
int ySpeed;                    //Speed along the Y-Axis
int y;                         //Center Y
int size;                      //Size of ball
int sizeSpeed;                 //Speed of growth
int count;                     //Score
int scoreField;                //Size of field to get a point
int gameMode;                  //Starts and ends the game
int winCount;                  //Amount of balls needed to win
float time;                    //Current Time
float endTime;                 //Millis() at the end
float startTime;               //Millis() at the start of game
String[] highScore;            //Best Time
String newHighscore;           //New Highscore data


//our setup function
void setup() {
  
  //Setup
  setupMode();
}

//The game
void draw() {

  //Refreshes the frame
  background(50);
  
  //Instructions
  if(gameMode == 0){
    gameMode0();
  }
  
  //Starts the game & Skips to End
  testForKeys();
  
  //Game
  if(gameMode == 1){
    gameMode1();   
  }
    
  //Game over
  if (gameMode == 2){
    gameMode2();
  }
}



void gameMode0(){
  smooth();
  fill(255,200,0);
  textSize(30);
  text("Mouse moves Pacman",330,200);
  text("Click to eat",400,300);
  text("Eat " + winCount + " Balls",400,250);
  text("Press [S] to start",360,350);
  arc(mouseX,mouseY,30,30,radians(45),radians(330)); 
  fill(0);
  ellipse(mouseX+3,mouseY-8,9,9);
  fill(255,200,0);
}
//The game itself

void gameMode1(){

    //Secondry Setup                 
    ellipseMode(CENTER);            
    noStroke();
    fill(255,200,0);
    textSize(12);
    time = millis(); 
    
    //Ball
    ellipse(x,y,size,size);  
    
    //Pacman
    arc(mouseX,mouseY,30,30,radians(45),radians(330)); 
    fill(0);
    ellipse(mouseX+3,mouseY-8,9,9);
    fill(255,200,0);  
    
    //Text in the corner
    text("X-Pos: " + x,5,13);
    text("Y-Pos: " + y,5,26);
    text("Mouse-X: " + mouseX,5,39);
    text("Mouse-Y: " + mouseY,5,52);
    text("Score: " + count,5,80);
    text("Time: " + ((time-startTime)/1000),5,100);
  
  
    //adjust x, y, and size based on speed
    x = x + xSpeed;
    y = y + ySpeed;
    size = size + sizeSpeed;
  
    //Mouth animation
    if (mousePressed){
      ellipse(mouseX,mouseY,30,30);
    }  
    
    //X & Y Bounces
    if ((x > width) || (x<0) || (random(50) > 49))  {    
      xSpeed = (xSpeed * -1);
    }
    if ((y > height) || (y<0) || (random(50) > 49)) {    
      ySpeed = (ySpeed * -1);
    }
    
    //Growth of ball
    if ((size > 40) || (size < 3)) {                     
      sizeSpeed = (sizeSpeed * -1);
    }
    
    //Scoring Mechanism
    if ((mouseX > x - scoreField) && (mouseX < x + scoreField) && (mouseY > y - scoreField) && (mouseY < y + scoreField) && mousePressed) {           
      background(255);
      delay(100);
      count = count + 1;
      x = height/2;
      y = width/2;
    
    }
    
    
    //Stopping the game
    if (count == winCount){
      endTime = millis();
      gameMode = 2;
      
    }
}
//Game over Screen

void gameMode2(){    
    
    //Saving the Highscore
    if((endTime - startTime)/1000 < float(highScore[0])){
      newHighscore = str((endTime - startTime)/1000);
      highScore[0] = newHighscore;
      saveStrings("data/highscore.txt",highScore);
      println("fuck");
    }
    
    
    //Final Text  
    background(255);
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text("YOU WIN! ;)",500,300);
    text("Press [S] to play again",500,350);
    text("Your Time: " + ((endTime - startTime)/1000) + " seconds",500,400);
    text("Your Best Time so far: " + highScore[0] + " seconds",500,450);
    
    textAlign(LEFT);
    count = 0;
  
  }

void setupMode(){
  //General Setup
  noCursor();
  size(1000,800);
  frameRate(50);
   
  //Variable Values  
  xSpeed = 2;                      
  x = width/2;
  ySpeed = 2;                      
  y = height/2;                        
  size = 3;
  sizeSpeed = 1;
  count = 0;
  scoreField = 4; 
  gameMode = 0; 
  winCount = 3;
  endTime = 0;
  highScore = loadStrings("highscore.txt");
  println(highScore[0]);
  time = 0;
}
void testForKeys(){
  //Starts the game
  if(keyPressed){
    if((key == 's') || (key == 'S')){
      endTime = 0;
      startTime = millis();
      gameMode = 1;
    }
  }
  
  //Skips to Game over
  if(keyPressed){
      if((key == 'E') || (key == 'e')){
        gameMode = 2;
        endTime = millis();
      }
  }
}


