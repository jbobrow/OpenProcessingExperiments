
//Pong Game
//Chris Hill
//Sept 2008

/*
TO DO/WISH LIST:
  paddle corner bug
  paddle movement bug (2 keys being pressed)
  player input name
  player input score count
  1 player mode (ai for player 2)
*/
import ddf.minim.*;
Minim minim;

AudioSnippet paddleSound;
AudioSnippet missSound;
AudioSnippet wallSound;


float x, y, xSpeed, ySpeed;
float lastry, lastrb;
int rx = 15;
int ry = 195;
int rb = 195;
int cntr = 0;
int i = 3;
int miss = 0;
int p1Score = 0;
int p2Score = 0;
int winScore = 5;

PFont font;

void setup() 
{ 
  size(600,400);  
  smooth();
  fill(0); 
  
  font = loadFont("Arial-Black-48.vlw");
  
  x = width/2; 
  y = height/2; 
  xSpeed = 1.2; 
  ySpeed = .9;
  
  minim = new Minim(this);
  paddleSound = minim.loadSnippet("paddlehit.wav");
  wallSound = minim.loadSnippet("wallhit.wav");
  missSound = minim.loadSnippet("miss.wav");
} 

void draw()
{  
  background(200);
  strokeWeight(2);
  line(0,30, width,30);
  x += xSpeed; //move ball in x direction
  y += ySpeed; //move ballin y direction
  
  texts();  //displays player names and scores
  objects(); //draws screen objects on screen
  collision();//calls the collision functions
  speedUP();//calls function to increase speed
  rightPaddle();//calls functions that control paddles
  leftPaddle();
  gameOver();  //game over conditions
}

void objects()
{
  strokeWeight(0);
  rect(rx,ry, 5,50);//right paddle
  rect(width-(rx+5),rb, 5,50); //left paddle
  ellipse(x, y, 10, 10); //ball  
}

void texts()
{
  //Title
  textFont(font, 24);
  textAlign(CENTER);
  text("PONG!", width/2, 25);
  //Player 1
  textFont(font, 16);
  textAlign(LEFT);
  text("Player 1 = ", 10, 20);
  text(p1Score, 102, 20);

  //player2
  textAlign(RIGHT);
  text("Player 2 = ", width-30, 20);
  text(p2Score, width-20, 20);
}

void collision()
{
  //paddle collisions based on location of collision - seperated into 10 pixel segments
  if(rx+7 >=x && (ry <= y && ry+10 >=y)) //if collision with right side
  {
    paddleSound.rewind();
    paddleSound.play();
    xSpeed = -xSpeed - .3; //reverse speed
    cntr++;  //increase speedup counter
    if(ySpeed > 0 && lastry > ry)//fix so uses ball direction, paddle direction and xlocation
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && lastry < ry)
    {
      ySpeed = -ySpeed;
    }
  }
  
  if((width-rx)-6 <= x && (rb <= y && rb+10 >=y)) //if collision with left side
  {
    paddleSound.rewind();
    paddleSound.play();
    xSpeed = -xSpeed - .3; //reverse speed
    cntr++;  //increase speedup counter
    if(ySpeed > 0 && lastrb > rb)
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && lastrb < rb)
    {
      ySpeed = -ySpeed;
    }
  }
  //segment 2
  if(rx+7 >=x && (ry+10 < y && ry+20 >=y)) 
  {
    paddleSound.rewind();
    paddleSound.play();
    xSpeed = -xSpeed - .15; //reverse speed
    cntr++;  //increase speedup counter
    if(ySpeed > 0 && (lastry > ry))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastry < ry))
    {
      ySpeed = -ySpeed;
    }
  }
  if((width-rx)-6 <= x && (rb+10 < y && rb+20 >=y))
  {
    paddleSound.rewind();
    paddleSound.play();
    xSpeed = -xSpeed - .15; //reverse speed
    cntr++;  //increase speedup counter
    if(ySpeed > 0 && (lastrb > rb))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastrb < rb))
    {
      ySpeed = -ySpeed;
    }
  }
  //segment 3
  if((rx+7 >=x && (ry+20 < y && ry+30 >=y)))
  {
    paddleSound.rewind();
    paddleSound.play();
    xSpeed = -xSpeed; //reverse speed
    cntr++;  //increase speedup counter
    if(ySpeed > 0 && (lastry > ry))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastry < ry))
    {
      ySpeed = -ySpeed;
    }
  }
  if((width-rx)-6 <= x && (rb+20 < y && rb+30 >=y))
  {
    paddleSound.rewind();
    paddleSound.play();
    xSpeed = -xSpeed; //reverse speed
    cntr++;  //increase speedup counter
    if(ySpeed > 0 && (lastrb > rb))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastrb < rb))
    {
      ySpeed = -ySpeed;
    }
  }
  
  //segment 4
  if((rx+7 >=x && (ry+30 < y && ry+40 >=y)))
  {
    paddleSound.rewind();
    paddleSound.play();
    xSpeed = -xSpeed + .15; //reverse speed
    cntr++;  //increase speedup counter
    if(ySpeed > 0 && (lastry > ry))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastry < ry))
    {
      ySpeed = -ySpeed;
    }
  }
  if((width-rx)-6 <= x && (rb+30 < y && rb+40 >=y))
  {
    paddleSound.rewind();
    paddleSound.play();
    xSpeed = -xSpeed + .15; //reverse speed
    cntr++;  //increase speedup counter
    if(ySpeed > 0 && (lastrb > rb))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastrb < rb))
    {
      ySpeed = -ySpeed;
    }
  }
  
  
  //segment 5
  if((rx+7 >=x && (ry+40 < y && ry+50 >=y)))
  {
    paddleSound.rewind();
    paddleSound.play();
    xSpeed = -xSpeed + .3; //reverse speed
    cntr++;  //increase speedup counter
    if(ySpeed > 0 && (lastry > ry))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastry < ry))
    {
      ySpeed = -ySpeed;
    }
  }
  if((width-rx)-6 <= x && (rb+40 < y && rb+50 >=y)) 
  {
    paddleSound.rewind();
    paddleSound.play();
    xSpeed = -xSpeed + .3; //reverse speed
    cntr++;  //increase speedup counter
    if(ySpeed > 0 && (lastrb > rb))
    {
      ySpeed = -ySpeed;
    }
    else if(ySpeed < 0 && (lastrb < rb))
    {
      ySpeed = -ySpeed;
    }
  }
  
  //top and bottom screen collision
  if(y >= height-5 || y <= 35) 
  {
    ySpeed = -ySpeed; //reverse y directions
    wallSound.rewind();
    wallSound.play();
  }
  
  //left and right screen collision (missing ball with paddle)
  if (x <= -5) //miss on left side
  {
    xSpeed=0;
    ySpeed=0;
    
    while(miss < 1)
    {
      p2Score++; //increase score for player 2
      miss++;
      missSound.rewind();
      missSound.play();
    }
    launchLeft();  //re-launches ball from paddle location
  }
  if ( x >=width+5) //miss on right side
  {
    xSpeed=0;
    ySpeed=0;    
    
    while(miss < 1)
    {
      p1Score++; //increase score for player 1
      miss++;
      missSound.rewind();
      missSound.play();
    }
    launchRight();  //launches ball from paddle location
  }
}

void speedUP()
{
  if(cntr == i)  //increase speed of ball depending on direction of travel
  {
    if (xSpeed < 0)
    {
      xSpeed = xSpeed-.5;
    }
    if (ySpeed < 0)
    {
      ySpeed = ySpeed-.5;
    }
    if (xSpeed > 0)
    {
      xSpeed = xSpeed+.5;
    }
    if (ySpeed > 0)
    {
      ySpeed = ySpeed+.5;
    }
    cntr = 0; //reset speedup counter
    i++;  //add extra rebound for next speed change
  }
}

void gameOver()
{
  if (p1Score == winScore)
  {
    textAlign(CENTER);
    textSize(24);
    text("Player 1 Wins!", width/2, height/2);
    textSize(16);
    text("Press 'Y' to play again", width/2, (height/2) + 25);
    text("or Press 'Q' to quit", width/2, (height/2) + 45);
    restartGame();  //reset game to initial values
    quit();//end program
  }
  if (p2Score == winScore)
  {
    textAlign(CENTER);
    textSize(24);
    text("Player 2 Wins!", width/2, height/2);
    textSize(16);
    text("Press 'Y' to play again", width/2, (height/2) + 25);
    text("or Press 'Q' to quit", width/2, (height/2) + 45);
    restartGame();  //reset game to initial values
    quit();//end program
  }
}

void restartGame()  //reset variables and shape locations, redraw background
{
  if(keyPressed)
  {
    if (key == 'y' || key == 'Y')
    {
      background(200);
      rx = 15;
      ry = 195;
      rb = 195;
      x = width/2;
      y = height/2;
      xSpeed = 1.2; 
      ySpeed = .9;
      cntr = 0;
      i = 3;
      miss = 0;
      p1Score = 0;
      p2Score = 0;      
    }
  }
}

void quit()
{
  if(keyPressed)
  {
    if (key == 'q' || key == 'Q')
    {
      stop();
      exit();
    }
  }
}

void rightPaddle()
{
  if(keyPressed) //moving paddle up
  {
    if (key == 'w' || key == 'W') 
    {
      lastry = ry;
      ry=ry-2;//paddle velocity
      if (ry <= 30) //stop paddle from leaving top of screen
      {
        ry = ry+2;
      }
    }
  }
  if(keyPressed) //move paddle down
  {
    if (key == 's' || key == 'S') 
    {
      lastry = ry;
      ry=ry+2;//paddle velocity
      if (ry >= height-50) //stop paddle from leaving bottom of screen
      {
        ry=height-52;
      }
    }
  }  
}

void leftPaddle()
{
  if(keyPressed) //moving paddle up
  {
    if (key == CODED) 
    {
      if(keyCode == UP)
      {
        lastrb = rb;
        rb=rb-2;//paddle velocity
        if (rb <= 30) //stop paddle from leaving top of screen
        {
          rb = rb+2;
        }
      }
    }
  }
  if(keyPressed) //move paddle down
  {
    if (key == CODED)
    {
      if(keyCode == DOWN)
      {
        lastrb=rb;
        rb=rb+2;//paddle velocity
        if (rb >= height-50) //stop paddle from leaving bottom of screen
        {
          rb=height-52;
        }
      }
    }
  }  
}

void launchRight() //restart ball after a miss
{
  if(keyPressed)
  {
    if (key == ' ')//press space - resets speed and speed increase vars, launches ball from center of paddle
    {
      x = width-25; 
      y = rb+25; 
      i = 3;
      cntr = 0;
      xSpeed = -1.2; 
      ySpeed = .9;
      miss = 0;
    }
  }
}

void launchLeft() //restart ball after a miss
{
  if(keyPressed)
  {
    if (key == ' ')  //press space - resets speed and speed increase vars, launches ball from center of paddle
    {
      x = 25; 
      y = ry+25; 
      i = 3;
      cntr = 0;
      xSpeed = 1.2; 
      ySpeed = .9;
      miss = 0;
    }
  }
}

void stop()
{
  paddleSound.close();
  missSound.close();
  wallSound.close();
  super.stop();
}

