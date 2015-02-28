
import ddf.minim.*; //processing does not have sound included

Minim minim; //declare minim object
AudioSample note; //one shot sound 1 (food eating sound)
AudioSample note2; //one shot sound 2 (game over)
AudioPlayer song; //longer song

PImage snake; //declare solid snake object

float speed; // declare speed as  a float object
 
int moveX = 0;
int moveY = 0;
int snakeX = 0;
int snakeY = 0;
int foodX = -1;
int foodY = -1;

boolean check = true;
int []snakesX; //declares snake x array
int []snakesY; // declares snake y array
int snakeSize = 1; // declares size of snake cube thing
boolean gameOver = false; // true or false whether game is currently over
PFont Font = createFont("Arial", 20, true); //load font for game over screen
// createFont(name, size, smooth)

void setup(){ //initial parameters
  size(300,300); //size of game screen
   snake = loadImage("snake.jpg"); //load in solid snake character
  background(0); //background black
  
  minim = new Minim(this); //create a new object
 note = minim.loadSample("eatfood.mp3"); //load eatfood sfx sample
  note2 = minim.loadSample("gameover.mp3"); //load gameover sfx sample
  song = minim.loadFile("burningheat.mp3"); //load song
  song.play();
  
  
  speed=100; //inserts expression
  snakesX = new int[300]; //variable provides X dimension expressions at 300
  snakesY = new int[300]; //variable provides Y dimension expressions at 300
   
  snakeX = (width/2) -5; //start snake in middle width-wise
  snakeY = (height/2) -5; //start snake in middle height-wise
}
  
void draw(){
  if(speed%8 == 0){ // % is the modulus operator. Modulus is used to find the remainder from a division.
    //changing the # after the % sign changes the speed of the Snake character.
    background(0); //creates a black background every new frame
    runGame(); //runs the game
  }
  speed=speed+1;
}
void reset(){
  snakeX = (width/2 -5) ; //spawns the snake character in the middle of the screen, width-wise
  //also -5 resets snake on same plane as food
  snakeY = (height/2 -5); //spans the snake character in the middle of the screen, height-wise
  gameOver = false; //no game over function if the game is reset (creates new game)
  check = true; //without this, the snake character would not perform on the same plane as the food
  snakeSize =1; // sets the size of snake's cube
  //also if you don't have this the game will go straight to the game over screen if you reset
  moveY = 0; //sets move variable y back to 0
  moveX = 0; //sets move variable x back to 0
}

void runGame(){
  if(gameOver== false){ //in other words, if the game is currently being played
   
    drawfood();
    drawSnake();
    moveSnake();
    eatFood();
    SnakeHitSelf();
  }else{ //in other words, if the game is indeed over
      String modelString = "GAME OVER";
      textAlign (CENTER); //centers game over text
      text(modelString,150,150);
      note2.trigger(); //sets off game over sound when game over
      song.close(); //closes background music when game over
      
  }
}
void SnakeHitSelf(){
   for(int i = 1; i < snakeSize; i = i + 1){ // for loop denotes that when the head of the snake hits 
       if(snakeX == snakesX[i] && snakeY== snakesY[i]){    //any part of the rest of the snake, then the
          gameOver = true;                                            //game will be over.
      }
   } 
}
void eatFood(){
  if(foodX == snakeX && foodY == snakeY){ //if the food coordinates are the same as the 
     check = true;                        //snake head coordinates, then add one piece to 
     snakeSize=snakeSize+1;               //the snake
     note.trigger();                      //and set off the eating sound
  }
}
void drawfood(){                          //draws the food
  fill(255,0,0);                          //makes it red
  while(check){                           //while loop executes statements only while the expressions are true
  //have to be careful with the while loop because it won't finish until what's inside it becomes false..
  //thats why it works perfectly for the food, because the food will get eaten and need to be respawned 
    int x = (int)random(1,300/10); //this will set the food somewhere within the x parameters of the playing field
    int y =  (int)random(1,300/10); //this will set the food somewhere within the y parameters of the playing field
    foodX = 5+x*10; //the 5+ pute the food on the same plane as the snake character
    foodY = 5+y*10;
     
    for(int i = 0; i < snakeSize; i=i+1){ //for loop to make sure the snake the food are on the same plane
       if(x == snakesX[i] && y == snakesY[i]){
         check = true;
         i = snakeSize;
       }else{
         check = false;
       }
    }
     
  }
   
  rect(foodX-5, foodY-5, 10, 10); //creates the actual food square
     
}

void drawSnake(){
 fill(60,60,40);                        //makes snake's green squares
 image(snake,snakeX-15,snakeY-40);      //loads in the snake character image file
  for(int i = 0; i < snakeSize; i=i+1) { //first for loop to set up snake's boxes array
  int X = snakesX[i];
  int Y = snakesY[i];
   rect(X-5,Y-5,10,10);
  }
   
  for(int i = snakeSize; i > 0; i = i-1){ //second for loop creates snakes's subsequent boxes when eats food
   snakesX[i] = snakesX[i-1];
   snakesY[i] = snakesY[i-1];
  }
 }
 
void moveSnake(){
  snakeX += moveX; //altering the moveX function will move snake on the X plane
  snakeY += moveY; //altering the moveY function will move snake on the y plane
  //sets the boundaries of the playing field, that is, when snake goes over these boundaries the game is over
  if(snakeX > 300-5 || snakeX < 5||snakeY > 300-5||snakeY < 5){
     gameOver = true;
  }
  snakesX[0] = snakeX;
  snakesY[0] = snakeY;
   
}
  
void keyPressed() {
  //! converts from int to boolean
  // moves snake up when up key is pressed
  if(keyCode == UP) {  if(snakesY[1] != snakesY[0]-10){moveY = -10; moveX = 0;}}
  //moves snake down when down key is pressed
  if(keyCode == DOWN) {  if(snakesY[1] != snakesY[0]+10){moveY = 10; moveX = 0;}}
  //moves snake left
  if(keyCode == LEFT) { if(snakesX[1] != snakesX[0]-10){moveX = -10; moveY = 0;}}
  //moves snake right
  if(keyCode == RIGHT) { if(snakesX[1] != snakesX[0]+10){moveX = 10; moveY = 0;}}
  //to reset game (only while in-game)
  if(keyCode == 'R') {reset();}
}

void stop() {
  note.close();
  note2.close();
  minim.stop();
  super.stop();
}



