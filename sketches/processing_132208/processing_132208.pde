
/*
      ####  #   #  ####   ####  ####  #  ####  #     ####
      #     #   #  #  #      #  #     #     #  #     #   #
      #     #   #  #####   ###  ###   #   ###  #     #   #
      #     #   #  #   #     #  #     #     #  #     #   #
      ####  #####  #####  ####  #     #  ####  ####  #####
      
      A simple processing game by Bas Blomen,
      CMD Student at Hogeschool Zuyd Maastricht
      @2014
*/

//Variabelen
boolean gameStarted = false;
int direction = 0;
int difficulty = 3;
int spaceship = width/2;
int lives;
int scoreTeller = 0;
int playerScore = 0;
boolean initialized;
int highScore = 0;
int level = 1;
int levelCounter = 0;

//Kubussen aanmaken
cube cube1;
cube cube2;
cube cube3;
cube cube4;
cube cube5;
cube cube6;
cube cube7;
cube cube8;
cube cube9;
cube cube10;
cube cube11;
cube cube12;
cube cube13;
cube cube14;
cube cube15;

void setup()
{
   size(500,500); 
   
   cube1 = new cube(random(0, width), random(-400, -80));
   cube2 = new cube(random(0, width), random(-400, -80));
   cube3 = new cube(random(0, width), random(-400, -80));
   cube4 = new cube(random(0, width), random(-400, -80));
   cube5 = new cube(random(0, width), random(-400, -80));
   cube6 = new cube(random(0, width), random(-400, -80));
   cube7 = new cube(random(0, width), random(-400, -80));
   cube8 = new cube(random(0, width), random(-400, -80));
   cube9 = new cube(random(0, width), random(-400, -80));
   cube10 = new cube(random(0, width), random(-400, -80));
   cube11 = new cube(random(0, width), random(-400, -80));
   cube12 = new cube(random(0, width), random(-400, -80));
   cube13 = new cube(random(0, width), random(-400, -80));
   cube14 = new cube(random(0, width), random(-400, -80));
   cube15 = new cube(random(0, width), random(-400, -80));
   
   if(gameStarted == false)
   {
     
   }
   if(gameStarted == true)
   {
     
   }
  
}

void draw()
{
   if(gameStarted == false) // Handelingen voor als er geen game gestart is
   {
     background(0);
     textAlign(CENTER);
     textSize(32);
     fill(220);
     text("CUB3FI3LD, press a key to start", width/2,height/2);
   }
   if(gameStarted == true) // Handelingen voor als er de game gestart is
   {
     background(0);
     
     //Het 'ruimteschip' aanmaken
     stroke(255);
     fill(29,173,0);
     triangle(spaceship,460,spaceship-10,490,spaceship+10,490);
     spaceship += direction;
     
     //Functies die het spelverloop beïnvloeden
     checkBorders();
     setScore();
     setLevel();
     
     //Alle kubusfuncties
     cube1.drawCube();
     cube1.moveCube();
     cube1.resetCube();
     cube1.detectCollision();
     
     cube2.drawCube();
     cube2.moveCube();
     cube2.resetCube();
     cube2.detectCollision();
     
     cube3.drawCube();
     cube3.moveCube();
     cube3.resetCube();
     cube3.detectCollision();
     
     cube4.drawCube();
     cube4.moveCube();
     cube4.resetCube();
     cube4.detectCollision();
     
     cube5.drawCube();
     cube5.moveCube();
     cube5.resetCube();
     cube5.detectCollision();
     
     cube6.drawCube();
     cube6.moveCube();
     cube6.resetCube();
     cube6.detectCollision();
     
     cube7.drawCube();
     cube7.moveCube();
     cube7.resetCube();
     cube7.detectCollision();
     
     cube8.drawCube();
     cube8.moveCube();
     cube8.resetCube();
     cube8.detectCollision();
     
     cube9.drawCube();
     cube9.moveCube();
     cube9.resetCube();
     cube9.detectCollision();
     
     cube10.drawCube();
     cube10.moveCube();
     cube10.resetCube();
     cube10.detectCollision(); 
     
     cube11.drawCube();
     cube11.moveCube();
     cube11.resetCube();
     cube11.detectCollision();
     
     cube12.drawCube();
     cube12.moveCube();
     cube12.resetCube();
     cube12.detectCollision();
     
     cube13.drawCube();
     cube13.moveCube();
     cube13.resetCube();
     cube13.detectCollision();
     
     cube14.drawCube();
     cube14.moveCube();
     cube14.resetCube();
     cube14.detectCollision();
     
     cube15.drawCube();
     cube15.moveCube();
     cube15.resetCube();
     cube15.detectCollision();
     
     //Checken of de speler een kubus heeft geraakt, en levens aftrekken
     if (cube1.collided == true || cube2.collided == true || cube3.collided == true || cube4.collided == true || cube5.collided == true || cube6.collided == true || cube7.collided == true || cube8.collided == true
         || cube9.collided == true || cube10.collided == true || cube11.collided == true || cube12.collided == true || cube13.collided == true || cube14.collided == true || cube15.collided == true)
     {
       lives--;
       println(lives);
     }
     checkLives();
   }
   //Als het spel eenmaal opgestart is, score en andere gegevens weergeven
   if(initialized == true)
   {
     fill(220);
     textAlign(LEFT);
     textSize(15);
     text("Lives: " + lives, 20, 20);
     text("Level: " + level, 20, 50);
     text("Score: " + playerScore, 20, 80);
     text("Highscore: " + highScore, 20, 110);
   }
}

void keyPressed() 
{
  if(gameStarted == false) { startGame(); initialized = true;}
  if (keyCode == LEFT) 
  {
    direction = -3;
  }
  if (keyCode == RIGHT) 
  {
    direction = 3;
  }
}

void keyReleased() 
{
  if (keyCode == LEFT || keyCode == RIGHT) 
  {
    direction = 0;
  }
}
class cube
{
  float x;
  float y;
  boolean collided;
  
  cube(float tempX, float tempY)
  {
    x = tempX;
    y = tempY;
  }
  
  void drawCube()
  {
    fill(150);
    stroke(255);
    rect(x,y,40,40);
  }
  
  void moveCube()
  {
    y += difficulty;
  }
  
  void resetCube() 
  {
    if (y > height) 
    {
      y = random(-400, -80);
      x = random(0, width);
    }
  }
  
  void detectCollision() 
  {
    if(spaceship >= x && spaceship <= x+40 && y >= 420 && y <= 530)
    {      
      collided = true;
      y = -100;
    }
    else 
    {
      collided = false;
    }

  }
}
    
void checkBorders()
{
  if(spaceship < 10)
  {
    spaceship = 11;
  }
  if(spaceship > 490)
  {
    spaceship = 489;
  }
}

void checkLives()
{
  if(lives <= 0)
  {
    gameStarted = false;
  }
}

void startGame()
{
  gameStarted = true;
  lives = 3;
  spaceship = width/2;
  difficulty = 3;
  scoreTeller = 0;
  playerScore = 0;
  level = 1;
  levelCounter = 0;
}

void setScore()
{
  scoreTeller++;
  if(scoreTeller == 50)
  {
    scoreTeller = 0;
    playerScore++;
    levelCounter++;
    if(playerScore > highScore) { highScore = playerScore; }
  }
}

void setLevel()
{
  if(levelCounter >= 75)
  {
    levelCounter = 0;
    difficulty++;
    level++;
  }
}


