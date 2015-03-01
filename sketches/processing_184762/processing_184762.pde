
// Daniel John Kirby
// CS 597
// Spring 2015
// dkirby@stevens.edu

/* Globals */
int start = 21; //Starting number of coins
CoinStack game;
int screenHt = 800;
int screenWid = 400;
boolean gameOver, playerOne, preGame, vsComputer;// tracks:
// is the game over?
// is it player one's move?
// should I display the pregame options?

class Coin
{
  int x;
  int y;
  float ht;
  float wid;
  color col;
  
  /* Display this coin*/
  void drawSelf()
  {
    fill(col);
    stroke(0);
    strokeWeight(1);
    ellipse((float)x, (float)y, wid, ht);
  }
  
  Coin(int xin, int yin)
  {
    x = xin;
    y = yin;
    wid = 50;
    ht = 50;
    col = color(255,215,0);
  }
}

/* This class stores most of the game data 
*/
class CoinStack
{
  int start;
  int n; /* tracks current number of coins */
  Coin[] coins;
   
  CoinStack(int st)
  {
     /* Create the coin array */
     start = st;
     n = start;
     coins = new Coin[start];
     int y = 800 - 25;
     for( int i = 0; i < start; i ++ )
     {
       (coins[i]) = new Coin(200, y);
       y = y - 25; 
     }
  }
  
  int getN()
  {
    return n; 
  }
  
  int getStart()
  {
    return start; 
  }
  
  /* Does exactly what it says on the tin */
  void drawAllCoins()
  {
    for( int i = 0; i < n; i ++ )
    {
      (coins[i]).drawSelf();
    } 
  }
  
  /* Makes the input move, whatever that move is */
  /* toRemove must be an integer 1, 2, or 3 */
  void makeMove(int toRemove)
  {
    /*Really all you have to do here*/
    if(toRemove <= n)
      n = n - toRemove;
      
    if(n==0)
      gameOver = true;
      
    playerOne = !playerOne;
  }
  
  /* Chooses a computer move 
     returns 1, 2, or 3*/
  int chooseComputerMove()
  {
   /* Right now I don't have time to implement a real AI for this, so it's just going to
      throw a random move*/
      int returnMe;
      int remaining = n;
      
      /*At least table-lookup the easy cases*/
      if(remaining == 1)
        return 1;
        
      /* Force the other player to take the last one (the object of this game) */
      if(remaining <= 4)
        return remaining - 1;
      
      if(remaining > 3)
        returnMe = (int)random(3);
      else
        returnMe = (int)random(remaining);
        
      return returnMe + 1;
  }
  
  /*Returns true if the coordinates given are within the top coin's radius*/
  boolean overTopCoin(int x, int y)
  {
    if(n == 0)
      return false; //never over a coin if there aren't any.
      
    int topX, topY;
    topX = (coins[n-1]).x;
    topY = (coins[n-1]).y;
    return dist(x,y,topX,topY) < (coins[n-1]).wid/2;
  }
  
  /*Returns true if the coordinate sgiven are within the second coin's radius but
    NOT within the first coins radius*/
    boolean overSecondCoin(int x, int y)
    {
     if(n <= 1)
      return false; //never over the second coin if there isn't one.
     
     int secondX, secondY;
     secondX = (coins[n-2]).x;
     secondY = (coins[n-2]).y;
     return dist(x,y,secondX,secondY) < (coins[n-2]).wid/2 && !overTopCoin(x,y);
    }
  
  /* Returns true if the coordinates given are within the third coin's radius but
     NOT within the first or second coin's radius*/
     boolean overThirdCoin(int x, int y)
     {
      if(n<=2)
       return false; //You know the drill at this point
      
      int thirdX, thirdY;
      thirdX = (coins[n-3]).x;
      thirdY = (coins[n-3]).y;
      return dist(x,y,thirdX,thirdY) < (coins[n-3]).wid/2 && !overSecondCoin(x,y); 
     }
     
     void highlightTop()
     {
       int x, y; //Top coin's coordinates
       float textY; //Don't mash the text
       x = (coins[n-1]).x;
       y = (coins[n-1]).y;
       
       fill(255);
       textSize(30);
       strokeWeight(1);
       
       if(n > 3)
         textY = y;
       else
         textY = (coins[2]).y;
       
       if(vsComputer && !playerOne)
         text("computer \ntakes one",3*width/4+15,textY-20);
       else
         text("take one",3*width/4, textY);
       

       
       fill(0,0);
       if(playerOne)
         stroke(127, 0, 127);
       else
         stroke(0,127,127);
       strokeWeight(5);
       rect(x,y,(coins[n-1]).wid,(coins[n-1]).wid);
     }
     
     void highlightTopTwo()
     {
       int x, y; //Second coin's coordinates
       float textY;
       x = (coins[n-2]).x;
       y = (coins[n-2]).y;
       
       if(n > 3)
         textY = y-(coins[n-1]).wid/4;
       else
         textY = (coins[2]).y;
       
       fill(255);
       textSize(30);
       strokeWeight(1);
       if(vsComputer && !playerOne)
         text("computer\ntakes two", 3*width/4+15, textY-20);
       else
         text("take two",3*width/4, textY);

       
       fill(0,0);
       if(playerOne)
         stroke(127, 0, 127);
       else
         stroke(0,127,127);
       strokeWeight(5);
       rect(x,y-(coins[n-1]).wid/4,(coins[n-1]).wid,(coins[n-1]).wid*3/2);
     }
     
     void highlightTopThree()
     {
       int x, y; //Middle coin's position
       float textY;
       x = (coins[n-2]).x;
       y = (coins[n-2]).y;
       
       fill(255);
       textSize(30);
       strokeWeight(1);
       
        if(n > 3)
         textY = y-(coins[n-1]).wid/4;
       else
         textY = (coins[2]).y;
       
       if(vsComputer && !playerOne)
         text("computer\ntakes three",3*width/4+15, textY-20);
       else
         text("take three",3*width/4, textY);

       
       fill(0,0);
       if(playerOne)
         stroke(127, 0, 127);
       else
         stroke(0,127,127);
       strokeWeight(5);
       rect(x,y,(coins[n-1]).wid,2*(coins[n-1]).wid);

     }
}


void mousePressed()
{
  /* Handle pre-game interactions */
  if(preGame)
  {
    /*detect mouse region*/
    if(mouseX > width/2 - 80 && mouseX < width/2 + 80)
    {
      /* If the mouse was not in between these pixels, it wasn't on any button*/
      
      /*Check if exit button*/
      if(mouseY > height/2 - 25 && mouseY < height/2 + 25)
      {
       /* 1 player game*/
         preGame = false;
         vsComputer = true; 
      }
      
      if(mouseY > height/2 - 25 + 80 && mouseY < height/2 + 25 + 80)
      {
        /*2 player game*/
        preGame = false;
        vsComputer = false; 
      }
      
      if(mouseY > height/2 - 25 + 160 && mouseY < height/2 + 25 + 160)
      {
       exit(); 
      }
      
    }
  }
  else if(gameOver)
  {
   /* Handle post-game interactions */
    if(mouseX > width/2 - 80 && mouseX < width/2 + 80)
    {
     
      /* Check if yes, reset to game start*/
      if(mouseY > height/2 - 25 && mouseY < height/2 + 25)
       setUpGame();

      
      /*No*/
      if(mouseY > height/2 - 25 + 80 && mouseY < height/2 + 25 + 80)
        exit();
      
    }
  }
  else
  {
   /* Handle in-game interactions */ 
   
   /* If this is a two player game, you can always click */
   if(!vsComputer || playerOne)
   {
     if(game.overTopCoin(mouseX, mouseY))
     {
      game.makeMove(1);
     // playerOne = !playerOne;
     }
     else if(game.overSecondCoin(mouseX, mouseY))
     {
       game.makeMove(2);
     //  playerOne = !playerOne;
     }
     else if(game.overThirdCoin(mouseX, mouseY))
     {
      game.makeMove(3);
     // playerOne = !playerOne;
     }
   }
   
   /* Handle exit conditions*/
   if(dist(0,height,mouseX,mouseY) < 50)
     exit();
   if(dist(width,height,mouseX,mouseY) < 50)
     setUpGame();
  }
}

void unitTests()
{

}

void setUpGame()
{
  game = new CoinStack(start);
  gameOver = false;
  playerOne = true;
  preGame = true;
  vsComputer = true;
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
}

/* This routine runs when the program starts, it runs some unit tests to ensure everything is
   working properly*/
void setup()
{
    size(400, 800);

  /* game setup */
  setUpGame();
  /* Unit tests */
  unitTests();
}

void drawPreGame()
{
  textSize(40);
    int buttonYStart = height/2;
    /* Shape elements */
    fill(0,137,0);
    rect(width/2, buttonYStart, 160, 50);
    fill(137,137,0);
    rect(width/2, buttonYStart + 80, 160, 50);
    fill(137,0,0);
    rect(width/2, buttonYStart + 160, 160, 50);
    
    /* Text elements */
    fill(255);
    text("nim", width/2, height/4);
    text("by daniel john kirby",width/2,height/3);
    text("1 player", width/2, buttonYStart);
    text("2 player", width/2, buttonYStart + 80);
    text("exit", width/2, buttonYStart + 160); 
}

/* Main game loop*/
void draw()
{
  background(0); // black background
  
  if(preGame)
  {
   /* Handle pre-Game options */
   drawPreGame();
  }
  else if(gameOver)
  {
    /* Handle post-game interactions */
    textSize(25);
    fill(255);
    stroke(0);
    strokeWeight(1);
    if(vsComputer)
    {
     if(playerOne)
     {
      fill(127,0,127); 
      text("you win!", width/2, height/4);
     } 
     else
     {
      fill(0,127,127);
      text("cpu wins, better luck next time", width/2, height/4);
     }
    }
    else
    {
      if(playerOne)
      {
        fill(127,0,127);
        text("player one wins!", width/2, height/4);
        
      }
      else
      {
        fill(0,127,127);
        text("player two wins!", width/2, height/4);
      }
    }

    int buttonYStart = height/2-80;
    
    fill(0,137,0);
    rect(width/2, buttonYStart + 80, 160, 50);
    fill(137,0,0);
    rect(width/2, buttonYStart + 160, 160, 50);
    
    
    fill(255);
    text("another game?", width/2, buttonYStart);
    text("yes", width/2, buttonYStart+80);
    text("no", width/2, buttonYStart + 160);
  }
  else
  {
    /* Handle in-game interactions */
    textSize(25);
    fill(255);
    stroke(0);
    strokeWeight(1);
    text(game.getN()+"/"+game.getStart()+" coins remain", width/2, 25);
    game.drawAllCoins();
    
    /*Draw exit and restart winking menus */
    fill(127,0,0);
    if(dist(mouseX, mouseY, 0, height) < 50)
    {
       ellipse(0,height,175,175);
       fill(255);
       textSize(25);
       text("exit", 87, height-87);
    }
    else
    {
      ellipse(0,height,50,50);
      fill(255);
      textSize(20);
      text("exit",25,height-25);
    }
      
    fill(0,0,127);
    if(dist(mouseX, mouseY,width,height) < 50)
    {
       ellipse(width,height,175,175);
       fill(255);
       textSize(25);
       text("main\nmenu",width-87,height-87); 
    }
    else
    {
      ellipse(width,height,50,50);
      fill(255);
      textSize(20);
      text("main\nmenu",width-25,height-25);
    }
  
    if(playerOne || !vsComputer)
    {
     /*Detect whether the mouse is inside the top, top two, or top three coins*/
      if(game.overTopCoin(mouseX,mouseY))
         game.highlightTop();
      else if(game.overSecondCoin(mouseX,mouseY))
        game.highlightTopTwo();
      else if(game.overThirdCoin(mouseX,mouseY))
        game.highlightTopThree(); 
    }


    if(playerOne)
    {
        
        
     if(vsComputer)
     {
       frameRate(60);
       stroke(127,0,127);
       stroke(0);
       strokeWeight(1);
       textSize(30);
       fill(127,0,127);
       text("your move",width/2, 100);
       fill(255);
       text("take coin(s) from the top",width/2, 160);
       text("loser takes the last coin",width/2, 220);
     }
     else
     {
       fill(127,0,127);
       stroke(0);
       strokeWeight(1);
       textSize(30);
       text("player one",width/2, 100);
       fill(255);
       text("take coin(s) from the top",width/2, 160);
       text("loser takes the last coin",width/2, 220);
     }
     
    }
    else
    {
     if(vsComputer)
     {
       fill(0,127,127);
       stroke(0);
       strokeWeight(1);
       textSize(30);
       text("computer's move",width/2,100);
       frameRate(0.5);
       int computerMove = game.chooseComputerMove();
       if(computerMove == 1)
         game.highlightTop();
       else if(computerMove == 2)
         game.highlightTopTwo();
       else
         game.highlightTopThree();
         
       game.makeMove(computerMove);
     }
     else
     {
       fill(0,127,127);
       stroke(0);
       strokeWeight(1);
       textSize(30);
       text("player two",width/2,100);
       fill(255);
       text("take coin(s) from the top",width/2, 160);
     }
    }
    
    
    /*Check gameOver*/
    if(game.getN() == 0)
    {
      gameOver = true;
    }
    
  }
  
}


