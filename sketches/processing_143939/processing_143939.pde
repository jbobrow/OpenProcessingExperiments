
GameOver gameover;
Menu menu;
Scoring scoring;
moveMech mech;
mechMouse mechMouse;
objects objects;
int xMove = -2;
int yMove = 0;
int x2Move = -2;
int y2Move = 0;
int xLocation;
int yLocation;
int x2Location;
int y2Location;
int direction = (int)random(1, 4);
int direction2 = (int)random(1, 4);
boolean gameOver=false;
boolean menuOpen=true;
int N=3;
int players=0;
int player1Score=1;
int player2Score=1;
racer[] cadet=new racer[N];


void setup()
{
  size(600, 600);
  background(0, 0, 0);
  objects = new objects();
  objects.loadObjects();

}

void draw()
{ 
  stroke(255);
  line(0,60,600,60);
  if (gameOver==false && menuOpen==false && (player1Score < 10 || player2Score<10))
  {
    cadet[0].human1();
    cadet[0].move1(xMove, yMove);
    if (players==2)
    {
      cadet[1].human2();
      cadet[1].move2(x2Move, y2Move);
    }
    scoring.showScore();
  }


  if (gameOver==true && menuOpen==false)
  {
    if (player1Score == 10 || player2Score==10)
    {
      background(0);
      scoring.showScore();
      gameover.drawGameOver();
    }

    else if ((player1Score < 10 || player2Score < 10))
    {
      scoring.addScore();
    }
  }
  if (gameOver==false && menuOpen==true)
  {
    menu.loadMenu();
  }
}

void keyPressed()
{ 
  mech.makeEmGo();
}
void mousePressed()
{
  mechMouse.mechButtons();
}

class GameOver {

  void drawGameOver()
  {
    xMove=0;
    yMove=0;
    x2Move=0;
    y2Move=0;
    noStroke();
    fill(150);
    rectMode(CENTER);
    rect(300, 300, 500, 200);
    fill(0, 0, 255);
    rect(175, 355, 200, 50);
    rect(425, 355, 200, 50);
    fill(0, 0, 0);
    textSize(30);
    text("Play Again", 90, 365);
    text("Main Menu", 345, 365);
    textSize(75);
    text("Game Over!", 75, 290);
    textSize(20);
    if (player1Score == 10)
    {
      fill(255);
      text("White player wins!", 200, 315);
    }
    if (player2Score==10)
    {
      fill(255,0,0);
      text("Red player wins!", 200,315);
    }
  }
}

class Menu
{
  
    void loadMenu()
  {
    rectMode(CORNER);
    background(150);
    noStroke();
    fill(0, 0, 0);
    PFont playerSelect = loadFont("SWIsot3-30.vlw");
    textFont(playerSelect);
    textSize(30);
    text("One Player", 188, 365, 230,50);
    text("Two Player", 188, 465, 230,50);
    PFont tron = loadFont("TRN-150.vlw");
    textFont(tron);
    text("TRON", 57, 200);
    PFont tronSmaller = loadFont("TRN-65.vlw");
    textFont(tronSmaller);
    text("Doolie", 190, 250);
    
  }
}
class moveMech
{
  void makeEmGo()
  {
     if (players==1 || players==2)
  {
    if (key == 'd' && direction != 2)
    {
      direction=1;
    }
    else if (key == 'a' && direction != 1)
    {
      direction=2;
    }
    else if (key == 'w' && direction != 4 )
    {
      direction=3;
    }
    else if (key == 's' && direction != 3)
    {
      direction=4;
    }
  }
  if (players == 2)
  {
    if (keyCode == RIGHT && direction2 != 2)
    {
      direction2=1;
    }
    else if (keyCode == LEFT && direction2 != 1)
    {
      direction2=2;
    }
    else if (keyCode == UP && direction2 != 4)
    {
      direction2=3;
    }
    else if (keyCode == DOWN && direction2 != 3)
    {
      direction2=4;
    }
  }
  }
}
class racer {

  int xNext;
  int yNext;
  int x2Next;
  int y2Next;
  int xAINext;
  int yAINext;


  void move1(int xSpeed, int ySpeed)
  {
    xLocation += xSpeed;
    yLocation += ySpeed;
    x2Next = xLocation;
    y2Next = yLocation;
  }

  void move2(int xSpeed, int ySpeed)
  {
    x2Location += xSpeed;
    y2Location += ySpeed;
    x2Next = x2Location;
    y2Next = y2Location;
  }

  void human1()
  {
    xNext = xLocation+xMove;
    yNext = yLocation+yMove;
    if (get(xNext, yNext) !=color(0, 0, 0) || yLocation <= 63)
    {
      if (player1Score == 10 || player2Score==10)
      {
        xMove=0;
        yMove=0;
        x2Move=0;
        y2Move=0;
        gameOver=true;
      }
      else if ((player1Score < 10 || player2Score < 10) && (player1Score != 10 || player2Score!=10))
      {
        player2Score += 1;
        gameOver=true;
      }
    }
    else
    {
      noStroke();
      fill(255);
      ellipse(xLocation, yLocation, 5, 5);   
      if (direction==1)
      {
        xMove = 2;
        yMove = 0;
      }
      else if (direction==2)
      {
        xMove =-2;
        yMove = 0;
      }
      else if (direction==3)
      {
        xMove=0;
        yMove=-2;
      }
      else if (direction==4)
      {
        xMove=0;
        yMove=2;
      }
    }
  }

  void human2()
  {

    x2Next = x2Location+x2Move;
    y2Next = y2Location+y2Move;
    if (get(x2Next, y2Next) !=color(0, 0, 0) || y2Location <= 63 )
    {
      if (player1Score == 10 || player2Score==10)
      {
        xMove=0;
        yMove=0;
        x2Move=0;
        y2Move=0;
        gameOver=true;
      }
      else if ((player1Score < 10 || player2Score < 10) && (player1Score != 10 || player2Score!=10))
      {
        gameOver=true;
        player1Score += 1;
      }
    }

    else 
    {    
      noStroke();
      fill(255, 0, 0);
      ellipse(x2Location, y2Location, 5, 5); 
      if (direction2==1)
      {
        x2Move = 2;
        y2Move = 0;
      }
      else if (direction2==2)
      {
        x2Move =-2;
        y2Move = 0;
      }
      else if (direction2==3)
      {
        x2Move=0;
        y2Move=-2;
      }
      else if (direction2==4)
      {
        x2Move=0;
        y2Move=2;
      }
    }
  }
}

class mechMouse
{
  void mechButtons()
  {
    if (gameOver==true && menuOpen==false)
    {
      int x=mouseX;
      int y=mouseY;

      if ((x>75 && x<275) && (y>330 && y<380))
      {
        if (players==1)
        {
          background(0, 0, 0);
          xLocation = (int)random(100, 500);
          yLocation = (int)random(100, 500);
          players=1;
          direction=1;
          player1Score=0;
          player2Score=0;
        }
        if (players==2)
        {
          background(0, 0, 0);
          xLocation =  (int)random(100, 500);
          yLocation =  (int)random(100, 500);
          x2Location = (int)random(100, 500);
          y2Location = (int)random(100, 500);
          direction=(int)random(1, 4);
          direction2=(int)random(1, 4);
          player1Score=0;
          player2Score=0;
        }
        gameOver=false;
      }
      if ((x>325 && x<525) && (y>330 && y<380))
      {
        gameOver=false;
        menuOpen=true;
        players=0;
      }
    }

    if (menuOpen==true && gameOver==false)
    {
      int x=mouseX;
      int y=mouseY;

      if ((x>188 && x<365) && (y>365 && y<415))
      {
        menuOpen=false;
        gameOver=false;
        background(0, 0, 0);
        xLocation = (int)random(100, 500);
        yLocation = (int)random(100, 500);
        players=1;
        player1Score=0;
        player2Score=0;
      }
      if ((x>188 && x<465) && (y>465 && y<515))
      {
        menuOpen=false;
        gameOver=false;
        background(0, 0, 0);
        xLocation =  (int)random(100, 500);
        yLocation =  (int)random(100, 500);
        x2Location = (int)random(100, 500);
        y2Location = (int)random(100, 500);
        players=2;
        player1Score=0;
        player2Score=0;
      }
    }
  }
}

class objects
{
  void loadObjects()
  {
    cadet[0]= new racer();
    cadet[1]= new racer();
    cadet[2]= new racer();
    gameover = new GameOver();
    menu = new Menu();
    scoring = new Scoring();
    mech = new moveMech();
    mechMouse = new mechMouse();
  }
}

class Scoring
{
  int x2Next = x2Location+x2Move;
  int y2Next = y2Location+y2Move;

  int xNext = xLocation+xMove;
  int yNext = yLocation+yMove;
  void addScore()
  {
    if (get(xNext, yNext) != color(0, 0, 0))
    {
      menuOpen=false;
      gameOver=false;
      background(0, 0, 0);
      xLocation =  (int)random(100, 500);
      yLocation =  (int)random(100, 500);
      x2Location = (int)random(100, 500);
      y2Location = (int)random(100, 500);
      direction=(int)random(1, 4);
      direction2=(int)random(1, 4);
    }

    if (get(x2Next, y2Next) != color(0, 0, 0))
    {
      menuOpen=false;
      gameOver=false;
      background(0, 0, 0);
      xLocation =  (int)random(100, 500);
      yLocation =  (int)random(100, 500);
      x2Location = (int)random(100, 500);
      y2Location = (int)random(100, 500);
      direction=(int)random(1, 4);
      direction2=(int)random(1, 4);
    }
  }

  void showScore()
  {
    rectMode(CENTER);
    fill(255);
    textSize(45);
    text(player1Score, 235, 45);
    fill(255, 0, 0);
    text(player2Score, 335, 45);
  }
}



