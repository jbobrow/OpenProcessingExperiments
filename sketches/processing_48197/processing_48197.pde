
class Keyboard {
  // used to track keyboard input
  Boolean holdingUp,holdingRight,holdingLeft,holdingSpace;
  Keyboard() {
    holdingUp=holdingRight=holdingLeft=holdingSpace=false;
  }

  void pressKey(int key) {

    //screen transition

    //menu to gameplay
    if (key == KeyEvent.VK_S) {
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
    if (key == KeyEvent.VK_M) {
      if(screenNumber == 2)
      {
        screenNumber = 1;
      }
    }
    
    
    //solved to gamplay
    
    
    // 1 solved to answer
    if (key == KeyEvent.VK_Z) {
      if(screenNumber == 711)
      {
        screenNumber = 712;
      }
    }
   
    
    
    if (key == KeyEvent.VK_X) {
      if(screenNumber == 712)
      {
        screenNumber = 3;
      }
    }
    
    // 2 solved to answer
    if (key == KeyEvent.VK_Z) {
      if(screenNumber == 721)
      {
        screenNumber = 722;
      }
    }
   
    
    
    if (key == KeyEvent.VK_X) {
      if(screenNumber == 722)
      {
        screenNumber = 3;
      }
    }
    
    
    // 3 solved to answer
    if (key == KeyEvent.VK_Z) {
      if(screenNumber == 731)
      {
        screenNumber = 732;
      }
    }
   
    
    
    if (key == KeyEvent.VK_X) {
      if(screenNumber == 732)
      {
        screenNumber = 3;
      }
    }
    
    
    // 4 solved to answer
    if (key == KeyEvent.VK_Z) {
      if(screenNumber == 741)
      {
        screenNumber = 742;
      }
    }
   
    
    
    if (key == KeyEvent.VK_X) {
      if(screenNumber == 742)
      {
        screenNumber = 3;
      }
    }
    
    
    // 5 solved to answer
    if (key == KeyEvent.VK_Z) {
      if(screenNumber == 751)
      {
        screenNumber = 752;
      }
    }
   
    
    
    if (key == KeyEvent.VK_X) {
      if(screenNumber == 752)
      {
        screenNumber = 3;
      }
    }
    
    
    
    // 6 solved to answer
    if (key == KeyEvent.VK_Z) {
      if(screenNumber == 761)
      {
        screenNumber = 762;
      }
    }
   
    
    
    if (key == KeyEvent.VK_X) {
      if(screenNumber == 762)
      {
        screenNumber = 3;
      }
    }
    
    
    
    // 7 solved to answer
    if (key == KeyEvent.VK_Z) {
      if(screenNumber == 771)
      {
        screenNumber = 772;
      }
    }
   
    
    
    if (key == KeyEvent.VK_X) {
      if(screenNumber == 772)
      {
        screenNumber = 3;
      }
    }
    
    
    // 8 solved to answer
    if (key == KeyEvent.VK_Z) {
      if(screenNumber == 781)
      {
        screenNumber = 782;
      }
    }
   
    
    
    if (key == KeyEvent.VK_X) {
      if(screenNumber == 782)
      {
        screenNumber = 3;
      }
    }
    
    
    
    // 10 solved to answer
    if (key == KeyEvent.VK_Z) {
      if(screenNumber == 791)
      {
        screenNumber = 792;
      }
    }
   
    
    
    if (key == KeyEvent.VK_X) {
      if(screenNumber == 792)
      {
        screenNumber = 3;
      }
    }
    
    
    
    
    
    
    
    
    
    
     //incorrect to gamplay
    if (key == KeyEvent.VK_Z) {
      if(screenNumber == 5)
      {
        screenNumber = 3;
      }
    }
    
    
    
    //win to menu
    if (key == KeyEvent.VK_M) {
      if(screenNumber == 6)
      {
        screenNumber = 1;
        resetGame();
      }
    }
    //die to menu
    if (key == KeyEvent.VK_M) {
      if(screenNumber == 8)
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
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_B)
        {
          screenNumber = 711;
          correctIR.play();
            thing = 1;
        }
        if (key == KeyEvent. VK_C)
        {        
          screenNumber = 5;
          incorrectIR.play();
          
        }
        if (key == KeyEvent. VK_D)
        {
          
          screenNumber = 5;
          incorrectIR.play();
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
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_B)
        {
          screenNumber = 721;
          correctIR.play();
          thing = 2;
        }
        if (key == KeyEvent. VK_C)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_D)
        {
          screenNumber = 5;
          incorrectIR.play();
          
        }
      }
    }
    //question 3
    if(screenNumber == 4)
    {
      if (screens == 3)
      {
        if (key == KeyEvent. VK_B)
        {
          screenNumber = 731;
          correctIR.play();
          thing = 3;
        }
        if (key == KeyEvent. VK_A)
        {
          screenNumber = 5;
          incorrectIR.play();
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
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_B)
        {
          screenNumber = 741;
          correctIR.play();
          thing = 4;
        }
        if (key == KeyEvent. VK_C)
        {
          screenNumber = 5;
          incorrectIR.play();
        
      
        }
      }
    }
    //question 5
    if(screenNumber == 4)
    {
      if (screens == 5)
      {
        if (key == KeyEvent. VK_0)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_1)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_2)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_3)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_4)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_5)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_6)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_7)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
         if (key == KeyEvent. VK_8)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_9)
        {
          screenNumber = 751;
          correctIR.play();
          thing = 5;
        }
      }
    }
    //question 6
    if(screenNumber == 4)
    {
      if (screens == 6)
      {
        
        if (key == KeyEvent. VK_M)
        {
          screenNumber = 761;
          correctIR.play();
          thing = 6;
        }else{
          screenNumber = 5;
          incorrectIR.play();
        
        
        }
      }
    }
    //question 7
    if(screenNumber == 4)
    {
      if (screens == 7)
      {
        if (key == KeyEvent. VK_0)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_1)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_2)
        {
          screenNumber = 771;
          correctIR.play();
          thing = 7;
        }
        if (key == KeyEvent. VK_3)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_4)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_5)
        {
          screenNumber = 5;
          incorrectIR.play();
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
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_B)
        {
          screenNumber = 5;
          incorrectIR.play();
        }
        if (key == KeyEvent. VK_C)
        {
          screenNumber = 781;
          correctIR.play();
          thing = 8;
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
          screenNumber = 3;
          correct = 1;
          thing = 9;
        }
        if (key == KeyEvent. VK_B)
        {
          screenNumber = 8;
        
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
          screenNumber = 791;
          correctIR.play();
          correct = 1;
          thing = 10;
        }
        if (key == KeyEvent. VK_B)
        {
          screenNumber = 5;
          incorrectIR.play();
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


