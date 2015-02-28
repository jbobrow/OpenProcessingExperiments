
class Keyboard {
  // used to track keyboard input
  Boolean holdingUp,holdingRight,holdingLeft,holdingSpace;
  Keyboard() {
    holdingUp=holdingRight=holdingLeft=holdingSpace=false;
  }

  void pressKey(int key) {

    //screen trasaction

    //menu to gameplay
    if (key == KeyEvent.VK_O) {
      if(screenNumber == 1)
      {
        screenNumber = 3;
      }
    }
    //menu to instruction
    if (key == KeyEvent.VK_I) {
      if(screenNumber == 1)
      {
        screenNumber = 2;
      }
    }
    //instruction to menu
    if (key == KeyEvent.VK_P) {
      if(screenNumber == 2)
      {
        screenNumber = 1;
      }
    }
    //win to menu
    if (key == KeyEvent.VK_P) {
      if(screenNumber == 6)
      {
        screenNumber = 1;
        resetGame();
      }
    }
    //die to menu
    if (key == KeyEvent.VK_R) {
      if(screenNumber == 5)
      {
        screenNumber = 1;
        resetGame();
      }
    }

    //question 1
    if(screenNumber == 4)
    {
      if (screens == 1)
      {
        if (key == KeyEvent. VK_A)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_S)
        {
          problemsolved();
            thing = 1;
        }
        if (key == KeyEvent. VK_D)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_F)
        {
          screenNumber = 5;
        }
      }
    }
    //question 2
    if(screenNumber == 4)
    {
      if (screens == 2)
      {
        if (key == KeyEvent. VK_A)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_S)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_D)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_F)
        {
          screenNumber = 3;
          thing = 2;
        }
      }
    }
    //question 3
    if(screenNumber == 4)
    {
      if (screens == 3)
      {
        if (key == KeyEvent. VK_A)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_S)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_D)
        {
          problemsolved();
          thing = 3;
        }
        if (key == KeyEvent. VK_F)
        {
          screenNumber = 5;
        }
      }
    }
    //question 4 
    if(screenNumber == 4)
    {
      if (screens == 4)
      {
        if (key == KeyEvent. VK_A)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_S)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_D)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_F)
        {
          screenNumber = 3;
          thing = 4;
        }
      }
    }
    //question 5
    if(screenNumber == 4)
    {
      if (screens == 5)
      {
        if (key == KeyEvent. VK_A)
        {
          screenNumber = 3;
          thing = 5;
        }
        if (key == KeyEvent. VK_S)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_D)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_F)
        {
          screenNumber = 5;
        }
      }
    }
    //question 6
    if(screenNumber == 4)
    {
      if (screens == 6)
      {
        if (key == KeyEvent. VK_A)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_S)
        {
          screenNumber = 3;
          thing = 6;
        }
        if (key == KeyEvent. VK_D)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_F)
        {
          screenNumber = 5;
        }
      }
    }
    //question 7
    if(screenNumber == 4)
    {
      if (screens == 7)
      {
        if (key == KeyEvent. VK_A)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_S)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_D)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_F)
        {
          screenNumber = 3;
          thing = 7;
        }
      }
    }
    //question 8
    if(screenNumber == 4)
    {
      if (screens == 8)
      {
        if (key == KeyEvent. VK_A)
        { 
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_S)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_D)
        {
          screenNumber = 3;
          thing = 8;
        }
        if (key == KeyEvent. VK_F)
        {
          screenNumber = 5;
        }
      }
    }
    //question 9
    if(screenNumber == 4)
    {
      if (screens == 9)
      {
        if (key == KeyEvent. VK_A)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_S)
        {
          screenNumber = 3;
          correct = 1;
          thing = 9;
        }
        if (key == KeyEvent. VK_D)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_F)
        {
          screenNumber = 5;
        }
      }
    }
    //question 10
    if(screenNumber == 4)
    {
      if (screens == 10)
      {
        if (key == KeyEvent. VK_A)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_S)
        {
          screenNumber = 5;
        }
        if (key == KeyEvent. VK_D)
        {
          screenNumber = 3;
          correct = 1;
          thing = 10;
        }
        if (key == KeyEvent. VK_F)
        {
          screenNumber = 5;
        }
      }
    }








    //character movement
    if (key == KeyEvent.VK_UP) {
      holdingUp = true;
    }
    if (key == KeyEvent.VK_LEFT) {
      holdingLeft = true;
    }
    if (key == KeyEvent.VK_RIGHT) {
      holdingRight = true;
    }
    if (key == KeyEvent.VK_SPACE) {
      holdingSpace = true;
    }
  }


  void problemsolved()
  {
    screenNumber = 3;
  }


  void releaseKey(int key) {
    if (key == KeyEvent.VK_UP) {
      holdingUp = false;
    }
    if (key == KeyEvent.VK_LEFT) {
      holdingLeft = false;
    }
    if (key == KeyEvent.VK_RIGHT) {
      holdingRight = false;
    }
    if (key == KeyEvent.VK_SPACE) {
      holdingSpace = false;
    }
  }
}


