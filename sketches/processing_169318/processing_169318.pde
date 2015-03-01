
Player player; //Define a varible for the class Player called player
Points points; //Define a varible for the class Points caleed points
int [] pointPosition = new int[10]; // Declare an int array called pointPosition, that makes a new int array with 10 spaces
int gameState; // Declare an int named gameState.
final int newGame = 1; // Declare an int named newGame, assigned the value 1, and makes it final so it can't change
final int playingGame = 2; // Declare an int named playingGame, assigned the value 2, and makes it final so it can't change
final int newCircles = 3; // Declare an int named newCircles, assigned the value 3, and makes it final so it can't change
final int gameOver = 4; // Declare an int named gameOver, assigned the value 4, and makes it final so it can't change
PImage bg, gl; //Declare a PImage named bg for background and gl for garfield lasagna.

void setup() { //The setup
  size(600,600); //Sets the size to 600*600 pixels
  player = new Player();
  points = new Points();
  points.getCircles();
  gameState = newGame;
  player.resetCircles();
  imageMode(CENTER);
  bg = loadImage("kitchen floor.png");
  gl = loadImage("garfield lasagna.jpg");
}

void draw() {
  switch(gameState) {
    //A new game is starting
    case newGame:
    println(gameState);
    background(255);
    image(gl, width/2, height/2-100);
    fill(0);
    textLeading(20);
    text("Welcome to the game where you play as Garfield. As you know, Garfield is alway hungry, \nand he needs lasagna.You move Garfield by pressing and holdning down the mouse button and\ndrawing the route you want garfield to take.\nHow much lasagna can you eat before you run out of time?\nPress r to start",width/2-250,height/2+50);
    if (keyPressed==true && key == 'r') {
      gameState = playingGame;
    }
    break;
    
    //The game is starting
    case playingGame:
    println(gameState);
    background(bg);
    points.theTimer();
    player.movement(points.returnInformation());
    points.circles(player.returnInformaiton());
    points.pointKeeper(player.returnInformaiton());
    //If all of the circles are gone, spawn new circles.
    boolean [] circle = player.returnInformaiton();
    if (circle[0] == false && circle[1] == false && circle[2] == false && circle[3] == false && circle[4] == false) {
      gameState = newCircles; 
    //if the time is out, you die );
    } if (points.theTimer() == 0) {
      println("Game Over!");
      gameState = gameOver;
    }
    break;
    
    //Spawn new circles and go back to the playingGame state.
    case newCircles:
    delay(50);
    points.getCircles();
    player.resetCircles();
    gameState = playingGame;
    break;
    
    
    //If the time runs out, you are done playing ): Luckily you can also try and beat your old score (:
    case gameOver:
    println(gameState);
    background(255);
    int finalScore = points.pointKeeper(player.returnInformaiton());
    text("You ran out of time, press spacebar to try again (:\nHigh Score: "+finalScore,50,height/2);
    text("Thank you for playing - Philip Andreas",50,height/2+40);
    if (keyPressed == true && key == ' ') {
      gameState = newGame;
    }
    break;
    
  } 
}
 
 
 class Player {
Points points = new Points();
int num = 1000;
int indexPosition, i = 0;
int theDistance = 15;
int [] frames = new int [num];
boolean mousepressedlastframe = false;
boolean[] circle = new boolean[5];
PImage garfield = loadImage("garfield.png");

 boolean[] resetCircles() {
    for (int i = 0; i < 5; i++) {
      circle[i] = true;
  }
  return circle;
}

boolean[] movement(int[] pointPosition){
if (mousePressed == true) {
//Deletes the old drawing
if (mousepressedlastframe == false){ indexPosition = 0; mousepressedlastframe = true; frames = new int [num];} 
i =0;
//Recording 
    frames[indexPosition] = mouseX; 
    frames[indexPosition+1] = mouseY;
    indexPosition = (indexPosition + 2) % num;
    if (indexPosition == num) {
      indexPosition = 0;
    }
} else {
  fill(0);
//drawing  
  if (!(frames[i] == 0 && frames[i+1] == 0)) {
    int currentPositionX = frames[i];
    int currentPositionY = frames[i+1];
    image(garfield,frames[i],frames[i+1],50,50);
      if (theDistance >= dist(currentPositionX, currentPositionY, pointPosition[0],pointPosition[1]) && circle[0] == true) {
   circle[0] = false; 
      } if (theDistance >= dist(currentPositionX, currentPositionY, pointPosition[2],pointPosition[3]) && circle[1] == true) {
   circle[1] = false; 
      } if (theDistance >= dist(currentPositionX, currentPositionY, pointPosition[4],pointPosition[5]) && circle[2] == true) {
   circle[2] = false; 
      } if (theDistance >= dist(currentPositionX, currentPositionY, pointPosition[6],pointPosition[7]) && circle[3] == true) {
   circle[3] = false; 
      } if (theDistance >= dist(currentPositionX, currentPositionY, pointPosition[8],pointPosition[9]) && circle[4] == true) {
   circle[4] = false; 
      } 
   }
  i=i+2;
  mousepressedlastframe = false;
  }
  return circle;
 }
 boolean[] returnInformaiton() {
   return circle;
 }
 
 void resetArray() {
   indexPosition = 0; mousepressedlastframe = true; frames = new int [num];
 }
}

class Points {
int [] pointPosition = new int[10];
Points points;
int time = millis();
int gameTime = 45;
int timer = gameTime;
int startScore = 0;
int score;
PImage lasagna = loadImage("lasagna.png");
  
void resetGame() {
  startScore = 0;
  pointPosition = new int[10];
  
} 

int[] getCircles() {
    for (int i = 0; i < 10; i++) {
      pointPosition[i] = (int)random(30)*20;
  }
  return pointPosition;
}
  
 
 
void circles(boolean[] circle) {
  fill(0);
  if (circle[0] == true) {
   image(lasagna,pointPosition[0],pointPosition[1],40,40);
  } if (circle[1] == true) {
   image(lasagna,pointPosition[2],pointPosition[3],40,40);
  } if (circle[2] == true) {
   image(lasagna,pointPosition[4],pointPosition[5],40,40);
  } if (circle[3] == true) {
   image(lasagna,pointPosition[6],pointPosition[7],40,40);
  } if (circle[4] == true) {
   image(lasagna,pointPosition[8],pointPosition[9],40,40);
  } 
}

int pointKeeper(boolean[] circle) {
  fill(255);
  rect(0,0,100,25);
  int score = startScore;
  if (circle[0] == false) {
    score += 50;
  } if (circle[1] == false) {
    score += 50;
  } if (circle[2] == false) {
    score += 50;
  } if (circle[3] == false) {
    score += 50;
  } if (circle[4] == false) {
    score += 50;
  } 
   String s= "Score: "+score;
   textSize(10);
   fill(0);
   text(s,20,10,100,20);
   if (circle[0] == false && circle[1] == false && circle[2] == false && circle[3] == false && circle[4] == false) {
     startScore = score;
   }
   return score;
}
int[] returnInformation() {
  return pointPosition;
}
  int theTimer() { 
  fill(255);
  rect(0,25,100,25);
   if(millis() - time >= 1000){ 
   timer -=1;
   time = millis();
   if (timer == -1){
     timer = gameTime;
     player.resetCircles();
     startScore = 0;
     player.resetArray();
     }  
   }
   String s= "Time Left: "+timer;
   textSize(10);
   fill(0);
   text(s,20,30,100,20);
   return timer;
  }
}
