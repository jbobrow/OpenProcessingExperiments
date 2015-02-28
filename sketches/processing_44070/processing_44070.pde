
Rocket rocket1;
asteroids a1;

int numAsts = 2;
asteroids[] individualAst = new asteroids[numAsts];

int play,menu=1,gameOver,startTime;
PImage bg = new PImage();
PImage bg2 = new PImage();


float x = 0;
float y = 0;
float a = 0;
float c = 0;
float d = 0;

void setup(){
  size(600,600);
  noStroke();
  smooth();
  frameRate(60);

  bg = loadImage("menu_bg.png");
  bg2 = loadImage("bg.png");
  rocket1 = new Rocket(height/2, width/2);
  startTime = millis();
  
  background(bg);
  
  setupAsteroids(); 
}

void draw(){
  //if player dies, then show game over screen
  if(gameOver==1){
    text("GAME OVER",width/2,height/2);
    text("Click to play again",width/2,height/2+40);
    if(mousePressed==true){
      reset();
      gameOver=0;
      play=1;
    } 
  }
  //play game screen
  if(play==1){
    playGame();   
  }
  //show menu screen and if mouse is clicked, start game
  if(menu==1){
    background(bg);
    if(mousePressed==true){
      play=1;
      menu=0;
    }
  }
  
  if (isGameOver()){
    gameOver = 1;
    play = 0;
  }
}

/*
  check to see if seconds are over 1 and if they are add an s onto the end of seconds
  
  Parameters: a string and integer value
  returns: string value
*/
String checkPlural(int value, String word)
{
  if (value == 1)
    return value + " " + word;
    return value + " " + word + "s";
}

/*
  This Method is the main game loop called when the user is playing the game.
  
  parameters: None
  Returns: None
*/
void playGame(){
  background(bg2);
  rocket1.render();

  int seconds = (millis() - startTime) / 1000;
  int minutes = seconds / 60;
  int hours = minutes / 60;
  int days = hours / 24;
  
  seconds -= minutes * 60;
  minutes -= hours * 60;

  String message = checkPlural(seconds, "second");
  fill(255, 255, 255);
  textAlign(RIGHT);
  text(message, width-25, height-20);

  for (int i = 0; i < individualAst.length; i++){
    individualAst[i].shower();
  } 
}

/*
  This Method checks for collisions between the rocket and the asteroids 
  and returns a true value if the game is over.
  
  Parameters: None
  Returns: Boolean value to signify collision or not
*/
boolean isGameOver(){
 PVector rokLoc = rocket1.getLocation(); 
 for (int i=0; i < individualAst.length; i++){
   PVector astLoc = individualAst[i].getLocation();
   if (rokLoc.x > astLoc.x &&  rokLoc.x < (astLoc.x + individualAst[i].getWidth())){
      if (rokLoc.y > astLoc.y && rokLoc.y < (astLoc.y + individualAst[i].getHeight())){
        return true;
      }
   } 
 }
 return false;
}

/*
  this method sets up the asteroid array.
  
  Parameters: None
  Returns: None
*/
void setupAsteroids(){
   for (int i = 0; i < individualAst.length; i++) {
    individualAst[i] = new asteroids();
    a1 = new asteroids();
  }  
}

/*
  This Method allows the game to be reset for another game to take place.
  
  Parameters: None
  Returns: None
*/
void reset(){
  setupAsteroids();
  rocket1.reset(width/2, height/2);
  startTime = millis();
}

