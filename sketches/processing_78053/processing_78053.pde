
// Jordan Leung 4,5 Computer Programming
int x= 10;
int y = 250;
int direction= RIGHT; 
int compx= 490;
int compy = 250;
int compxx= 250;
int compyy= 480;
int compdirection= LEFT;
int compdirection1= UP;
boolean gameOver= false;

void setup()
{
  size (500,500);
  background(0);
   
}

void draw()
{

if(gameOver== true)
{  
gameOver= true; 
}
  
  else
  {
    human();
    if (gameOver== false)
    {
    computer();
    computero();
    }
  
}

}
  void keyPressed()
  {
    if(key=='a' && direction != RIGHT)
    {
      direction=LEFT;
    }
    else if (key=='d' && direction != LEFT)
    {
      direction=RIGHT;
    }
    else if (key=='s' && direction !=UP)
    {
      direction=DOWN;
    }
    else if (key=='w' && direction != DOWN)
    {
      direction=UP;
    }
    else if(key=='m')
    {
      fill(0);
      rect(0,0,500,500);
      x=0;
      y=250;
      compx= 490;
      compy= 250;
      gameOver= false;
    }
  }
  void human()
  {
    if(get(x,y) != color(0,0,0)) //crash
  {
    fill(255);
    text("Game Over!\n You Lose",250,250);
    gameOver= true;
  }
    stroke(255,255,255);
    point(x,y);
    if(direction ==RIGHT)
    {
    x++;
   
    }
    else if (direction ==LEFT)
    {
      x--;
     
    }
    else if( direction== UP)
    {
      y--;
    }
    else if(direction ==DOWN)
    { 
      y++;
    }
    
  }
  void computer()
  {
    if(get(compx,compy) != color(0,0,0)) //crash
  {
    fill(255);
    text("Game Over!\n Computer Loses",250,250);
    gameOver= true;
  }
    stroke(255,0,255);
    point(compx,compy);
    
 //right   
    if( compdirection ==RIGHT)
    {
   compx++;
    if(get(compx+1,compy) != color(0,0,0))
      {
        compdirection= DOWN;
      }
      
      }
   
    
//left way
    else if (compdirection ==LEFT)
    {
      compx--;
       if(get(compx-1,compy) != color(0,0,0))
      {
 compdirection= UP;
  
      }
     
    
    }
    
   //up 
    else if( compdirection== UP)
    {
      compy--;
       if(get(compx,compy-1) != color(0,0,0))
      {
    compdirection= RIGHT;
  
    }
    }
    
   
    else if(compdirection ==DOWN)
    { 
      compy++;
       if(get(compx,compy+1) != color(0,0,0))
      {
     compdirection= RIGHT;
    
  }
}
  }
  
  
   void computero()
  {
    if(get(compxx,compyy) != color(0,0,0)) //crash
  {
    fill(255);
    text("Game Over!\n Computer Loses",250,250);
    gameOver= true;
  }
    stroke(255,0,255);
    point(compxx,compyy);
    
 //right   
    if( compdirection1 ==RIGHT)
    {
   compx++;
    if(get(compxx+1,compyy) != color(0,0,0))
      {
        compdirection1= UP;
      }
      
      }
   
    
//left way
    else if (compdirection1 ==LEFT)
    {
      compxx--;
       if(get(compxx-1,compyy) != color(0,0,0))
      {
 compdirection1= DOWN;
  
      }
     
    
    }
      else if(compdirection1 ==DOWN)
    { 
      compyy++;
       if(get(compxx,compyy+1) != color(0,0,0))
      {
     compdirection1= RIGHT;   
}
    }
   //up 
    else if( compdirection1== UP)
    {
      compyy--;
       if(get(compxx,compyy-1) != color(0,0,0))
      {
    compdirection1= LEFT;
  
    }
    }
    
   
  
  }
