
;int[][] mazeSet = {{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                   {1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1},
                   {0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0},
                   {0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0},
                   {0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0},
                   {1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1},
                   {1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1},
                   {1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1},
                   {1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1},
                   {1, 0, 2, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1},
                   {1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1},
                   {1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 3, 1, 1, 1}};

class Cell
{
  int xPos_, yPos_;
  int xRight_, yBottom_;
  int colour_;
}

class Game
{
  Player player;
  ArrayList maze;
  
  //Question stuff
  int num1, num2;    //The 2 numbers
  int modifier;      //The modifier (+ or -)
  String input = "";      //The user input so far
  String message = "";      //Message printed on the users screen
  boolean question;  //True if a question is in progress
  
  Game()
  {
    maze = new ArrayList();
    createMaze();
    drawMaze();
    
    //Default question to off
    question = false;
  }
  void createMaze()
  {
    for(int i = 0; i < 12; i++)
    {
      for(int j = 0; j < 16; j++)
      {
        Cell temp = new Cell();
        temp.xPos_ = j * 50;
        temp.yPos_ = i * 50;
        temp.xRight_ = temp.xPos_ + 50;
        temp.yBottom_ = temp.yPos_ + 50;
        if(mazeSet[i][j] == 1)
        {
          temp.colour_ = 0;
        }
        else if(mazeSet[i][j] == 2)
        {
          temp.colour_ = 127;
        }
        else
        {
          temp.colour_ = 255;
        }
        maze.add(temp);
      }
    }
  }
  
  void drawMaze()
  {
    for(int i = 0; i < maze.size(); i++)
    {
      Cell temp = new Cell();
      temp = (Cell) maze.get(i);
      fill(temp.colour_);
      rect(temp.xPos_, temp.yPos_, 50, 50);
    }
  }
  
  void startGame()
  {
    player = new Player();
  }
  
  void gameLoop()
  {
    //Check that a question is not active
    if(question == false)
    {
      player.movePlayer();
      if(player.hit == true)
      {
        throwMath();
        player.hit = false;
      }
    } else
    {
      drawMath();
    }
    
  }
  
  //Initialises a question
  void throwMath()
  {
    //Throw the user a maths question
    
    //First make the question
    num1 = round(random(0, 40));
    num2 = round(random(0, 40));
    modifier = round(random(0, 1));
    
    //Set question state
    question = true;
  }
  
  //Draws the math question
  void drawMath()
  {
    //Main Box
    fill(240);
    rect(175, 125, 450, 350);
    
    //Input Box
    fill(255);
    rect(250, 300, 200, 30);
    
    //Black Text
    fill(0);
    
    //Header Text
    textSize(40);
    text("Math Question:", 200, 170);
    
    //Generate modifier
    String mod;
    if(modifier == 0)
    {
      mod = "+";
    } else
    {
      mod = "-";
    }
    
    //Print Question
    textSize(30);
    text(str(num1) + " " + mod + " " + str(num2), 225, 225);
    
    //Input
    textSize(20);
    text(input, 255, 324);
    
    //Message
    text(message, 255, 400);
  }
  
  void takeMath()
  {
    if(keyPressed)
    {
      if(key == '\n')
      {
        game.checkMath();
      } else
      {
        if(key == '-')
          input = input + key;
        
        if(key == '1')
          input = input + key;
          
        if(key == '2')
          input = input + key;
          
        if(key == '3')
          input = input + key;
         
        if(key == '4')
          input = input + key;
          
        if(key == '5')
          input = input + key;
          
        if(key == '6')
          input = input + key;
          
        if(key == '7')
          input = input + key;
          
        if(key == '8')
          input = input + key;
          
        if(key == '9')
          input = input + key;
          
        if(key == '0')
          input = input + key;
      }
    }
  }
  
  //Called when enter is hit, checks the answer
  void checkMath()
  {
    //Get input as int
    int temp = int(input);
    int ans;
    
    //Do the answer so we can compare
    if(modifier == 0)
    {
      ans = num1 + num2;
    } else
    {
      ans = num1 - num2;
    }
    
    //Compare input
    if(temp == ans)
    {
      question = false;
      input = "";
      message = "";
    } else
    {
      message = "wrong! apply to McDonalds";
      input = "";
    }
  }
}

