
int rectX = 285;
int rectL = 50;
int score = 0;
int lives = 5;
boolean gameOver;

//creating an instance of the Projectile class
Projectile projectile = new Projectile(random(50, 550), 30, 30, 1.5, 255);

PFont font;

void setup()
{
  size(600, 600);
}


void draw()
{
  background(0, 153, 153);  
  catcher();
  projectile.drawProjectile();  
  projectile.moveProjectile();
  projectile.checkCollision();
  showScore();
  showLives();
  checkLives();
}

//showing the users score on screen
public void showScore()
{
  font = loadFont("scorefont.vlw");
  textFont(font);
  fill(255);
  text("Score: " + score, 20, 40);
}

//showing the users lives on screen
public void showLives()
{
  font = loadFont("scorefont.vlw");
  textFont(font);
  fill(255);
  text("Lives: " + lives, 20, 70);
}

// checks if the user has ran out of lives and displays game over screen if they have
public void checkLives()
{
  if (lives == 0)
  {

    gameOver = true;
    background(0);
    fill(255);
    text("GAME OVER!", 200, 300);
    text("Your final score is: " + score, 145, 350);
    text("Press R to reload the game", 110, 400);
    noLoop();
  }
}

// class for the projectile
class Projectile
{
  
  //instance variables
  float xPos;
  float yPos;
  int pWidth;
  int pHeight;
  float speed;
  color colour;

  // Constructor for the class
  public Projectile(float x, int w, int h, float s, color c)
  {
    xPos = x;
    yPos = 0;
    pWidth = w;
    pHeight = h;
    speed = s;
    colour = c;
  }

  //drawing the projectile on screen
  public void drawProjectile()
  {
    fill(colour);
    noStroke();
    ellipse(xPos, yPos, 20, 20);
  }

  // moving the projectile from the top of the screen to the bottom
  public void moveProjectile()
  {
    yPos+=speed;
  }

  // checking if the projectile has touched either the catcher platform or the bottom of the screen and adjusting score and lives accordingly
  public void checkCollision()
  {

    
    if (dist(xPos, yPos, rectX, 550) < 15)
    {
      xPos = random(50, 550);
      yPos = 0;
      speed+=0.2;
      colour = color(random(255), random(255), random(255));
      score++;
    }
    else if (dist(xPos, yPos, xPos, 630) < 15)
    {
      xPos = random(50, 550);
      yPos = 0;
      speed+=0.2;
      colour = color(random(255), random(255), random(255));
      lives--;
    }
    

    
    if (xPos > rectX && xPos < rectX + rectL +10 && yPos >= 550 && yPos < 600)
    {
      xPos = random(50, 550);
      yPos = 0;
      speed+=0.2;
      colour = color(random(255), random(255), random(255));
      score++;
    }
  }
}

//drawing the catcher platform
public void catcher()
{

  fill(204, 204, 0);  
  rect(rectX, 550, rectL, 10);

  if (rectX>width - 50)
  {
    rectX=0;
  }

  if (rectX<0)
  {
    rectX = width - 50;
  }
}

//getting user input to move the catcher and restart game when game over
void keyPressed() 
{
  if (keyCode == LEFT)
  {
    rectX-=5;
  }
  if (keyCode == RIGHT)
  {
    rectX+=5;
  }
  if (key == 'r' || key == 'R')
  {
    if (gameOver == true)
    {    
      score = 0;
      lives = 5;
      projectile.speed = 1.5;
      gameOver = false;
      loop();
    }
  }
}



