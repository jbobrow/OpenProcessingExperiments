
int playerX = 200;
 int playerL = 50;
 int score = 0;
 int lives = 5;
 boolean gameOver;
 PImage grass;
 PImage carrot;
 PImage pizza;
 
//This creates the food class
 Food food = new Food(random(50, 550), 0, 0, 5);
 
//This defines the font of the words used in the game
 PFont font;
 
void setup()
 {
 size(600, 600);
 grass = loadImage("grass.jpg");
 carrot = loadImage("carrot.jpg");
 pizza = loadImage("pizza.jpg");
 grass.resize (600, 600);
 carrot.resize (30, 40);
 pizza.resize (30, 40);
 }
 
void draw()
 {
 image(grass, 0, 0);
 checkIfCaught();
 food.drawFood();
 food.moveFood();
 food.checkIfCaught();
 showScore();
 showLives();
 checkNumberOfLives();
 }
 
//This shows the player's score and updates while they play
 public void showScore()
 {
 {
 font = loadFont("Baveuse-20.vlw");
 textFont(font);
 fill(255);
 text("Score: " + score, 25, 40);
 }
 }
 
//This shows the player's number of lives and updates while they play
 public void showLives()
 {
 
font = loadFont("Baveuse-20.vlw");
 textFont(font);
 fill(255);
 text("Lives: " + lives, 25, 75);
 }
 
//This checks if the user has used up all of their lives
 public void checkNumberOfLives()
 {
 if (lives == 0)
 {
 
gameOver = true;
 background(400,50,40);
 fill(255);
 text("You are not Healthy!", 100, 200);
 text("You ate too much fatty food!", 100, 225);
 text("You scored: " + score, 100, 250);
 text("Press 'G' to Go again!", 100, 275);
 font = loadFont("Baveuse-20.vlw");
 textFont(font);
 noLoop();
 }
 }
 
//This creates the food class
 class Food
 {
 
float xPos;
 float yPos;
 float xPosx;
 float yPosy;
 int pWidth;
 int pHeight;
 float speed;
 
public Food(float x, int w, int h, float s)
 {
 xPos = x;
 yPos = 0;
 xPosx = x;
 yPos = 0;
 pWidth = w;
 pHeight = h;
 speed = s;
 }
 
public void drawFood()
 {
 
noStroke();
 image(carrot, xPos, yPos);
 image(pizza, xPosx, yPosy);
 }
 
// moving the food from the top of the screen to the bottom
 public void moveFood()
 {
 yPos+=speed;
 yPosy+=speed;
 }
 
// checking if the food has touched either the player or the bottom of the screen and adjusting score and lives accordingly
 public void checkIfCaught()
 {
 
if (dist(xPos, yPos, playerX, 550) < 20)
 {
 xPos = random(50, 550);
 yPos = 0;
 speed+=0.04;
 score++;
 }
 else if (dist(xPos, yPos, xPos, 630) < 20)
 {
 xPos = random(50, 550);
 yPos = 0;
 speed+=0.04;
 }
 
if (xPos > playerX && xPos < playerX + playerL +10 && yPos >= 550 && yPos < 600)
 {
 xPos = random(50, 550);
 yPos = 0;
 speed+=0.04;
 score++;
 }
 
if (dist(xPosx, yPosy, playerX, 550) < 20)
 {
 xPosx = random(50, 550);
 yPosy = 0;
 speed+=0.04;
 lives --;
 }
 else if (dist(xPosx, yPosy, xPosx, 630) < 20)
 {
 xPosx = random(50, 550);
 yPosy = 0;
 speed+=0.04;
 }
 
if (xPosx > playerX && xPosx < playerX + playerL +10 && yPosy >= 550 && yPosy < 600)
 {
 xPosx = random(50, 550);
 yPosy = 0;
 speed+=0.04;
 
lives --;
 }
 }
 }
 
//drawing the player platform
 public void checkIfCaught()
 {
 
fill(153, 0, 255);
 ellipse(playerX, 550, playerL, 50);
 
if (playerX>width)
 {
 playerX=0;
 }
 
if (playerX<0)
 {
 playerX = width;
 }
 }
 
//getting user input to move the player and restart game when game over
 void keyPressed()
 {
 if (keyCode == LEFT)
 {
 playerX-=15;
 }
 if (keyCode == RIGHT)
 {
 playerX+=15;
 }
 if (key == 'g' || key == 'G')
 {
 if (gameOver == true)
 {
 score = 0;
 lives = 5;
 food.speed = 1.5;
 gameOver = false;
 loop();
 }
 }
 }


