
float ballY;
float yspeed=-10;
float ballX;
float xspeed;
float dotX;
float dotY;
int score = 0;
boolean title = true;

void setup()
{
  size(1225, 650);
  smooth();
  background(255);

  textSize(24);
  ballY=height-13;
  ballX=ballY;
  dotX = width/2;
  dotY = height/2;
}

void draw()
{
  if (title == true)
  {
    background(255);
    textSize(20);
    fill(0);
    text("Use Right and Left Arrows for Major Adjustments", 410, 275);
    text("Use 'a' and 'd' Keys for Minor Adjustments", 440, 325);
    text("Press ENTER to Begin", 520, 375);
  }

  if (title == false)
  {
    fill(255, 255, 255, 100);
    rect(0, 0, width, height);

    fill(0);
    rect(50, 625, 75, 10);
    rect(225, 625, 75, 10);
    rect(400, 625, 75, 10);
    rect(575, 625, 75, 10);
    rect(750, 625, 75, 10);
    rect(925, 625, 75, 10);
    rect(1100, 625, 75, 10);
    rect(75, 540, 75, 10);
    rect(230, 225, 75, 10);
    rect(1000, 470, 75, 10);
    rect(800, 150, 75, 10);
    rect(900, 100, 75, 10);
    rect(630, 500, 75, 10);
    rect(400, 475, 75, 10);
    rect(425, 230, 75, 10);
    rect(830, 345, 75, 10);
    rect(1100, 250, 75, 10);
    rect(300, 325, 75, 10);
    rect(width/2, 275, 75, 10);
    rect(350, 125, 75, 10);
    rect(100, 350, 75, 10);
    rect(100, 150, 75, 10);

    fill(255, 0, 0);
    ellipse(ballX, ballY, 25, 25);
    ballY = ballY + yspeed;
    yspeed = yspeed+.25;
    ballX = ballX + xspeed;


    if (ballX >= 50 && ballX <= 125
      && ballY >= 605
      && ballY <= 630)
    {
      ballY = 605;
      yspeed = -10;
    }
    if (ballX >= 225 && ballX <= 300
      && ballY >= 605
      && ballY <= 630)
    {
      ballY = 605;
      yspeed = -10;
    }
    if (ballX >= 400 && ballX <= 475
      && ballY >= 605
      && ballY <= 630)
    {
      ballY = 605;
      yspeed = -10;
    } 
    if (ballX >= 575 && ballX <= 650
      && ballY >= 605
      && ballY <= 630)
    {
      ballY = 605;
      yspeed = -10;
    } 
    if (ballX >= 750 && ballX <= 825
      && ballY >= 605
      && ballY <= 630)
    {
      ballY = 605;
      yspeed = -10;
    } 
    if (ballX >= 925 && ballX <= 1000
      && ballY >= 605
      && ballY <= 630)
    {
      ballY = 605;
      yspeed = -10;
    } 
    if (ballX >= 1100 && ballX <= 1175
      && ballY >= 605
      && ballY <= 630)
    {
      ballY = 605;
      yspeed = -10;
    } 
    if (ballX >= 75 && ballX <= 150
      && ballY >= 520
      && ballY <= 545)
    {
      ballY = 520;
      yspeed = -10;
    }   
    if (ballX >= 230 && ballX <= 305
      && ballY >= 205
      && ballY <= 230)
    {
      ballY = 205;
      yspeed = -10;
    } 
    if (ballX >= 1000 && ballX <= 1075
      && ballY >= 450
      && ballY <= 475)
    {
      ballY = 450;
      yspeed = -10;
    } 
    if (ballX >= 800 && ballX <= 875
      && ballY >= 130
      && ballY <= 155)
    {
      ballY = 130;
      yspeed = -10;
    } 
    if (ballX >= 900 && ballX <= 975
      && ballY >= 80
      && ballY <= 105)
    {
      ballY = 80;
      yspeed = -10;
    } 
    if (ballX >= 630 && ballX <= 705
      && ballY >= 480
      && ballY <= 505)
    {
      ballY = 480;
      yspeed = -10;
    }
    if (ballX >= 400 && ballX <= 475
      && ballY >= 455
      && ballY <= 480)
    {
      ballY = 455;
      yspeed = -10;
    }  
    if (ballX >= 425 && ballX <= 500
      && ballY >= 210
      && ballY <= 235)
    {
      ballY = 210;
      yspeed = -10;
    }   
    if (ballX >= 830 && ballX <= 905
      && ballY >= 325
      && ballY <= 350)
    {
      ballY = 325;
      yspeed = -10;
    } 
    if (ballX >= 1100 && ballX <= 1175
      && ballY >= 230
      && ballY <= 255)
    {
      ballY = 230;
      yspeed = -10;
    } 
    if (ballX >= 300 && ballX <= 375
      && ballY >= 305
      && ballY <= 330)
    {
      ballY = 305;
      yspeed = -10;
    } 
    if (ballX >= 612.5 && ballX <= 687.5
      && ballY >= 255
      && ballY <= 280)
    {
      ballY = 255;
      yspeed = -10;
    } 
    if (ballX >= 350 && ballX <= 425
      && ballY >= 105
      && ballY <= 130)
    {
      ballY = 105;
      yspeed = -10;
    } 
    if (ballX >= 100 && ballX <= 175
      && ballY >= 330
      && ballY <= 355)
    {
      ballY = 330;
      yspeed = -10;
    } 
    if (ballX >= 100 && ballX <= 175
      && ballY >= 130
      && ballY <= 155)
    {
      ballY = 130;
      yspeed = -10;
    }   
    if (ballX >= width - 13)
    {
      ballX = width-13;
      xspeed = -3;
    }
    if (ballX <= 13)
    {
      ballX = 13;
      xspeed = 3;
    }
    if (ballY <= 13)
    {
      yspeed = 3;
    }
    if (dist(ballX, ballY, dotX, dotY)<=13)
    {
      dotX = random(width - 15);
      dotY = random(height - 75);
      score++;
    }

    fill (0, 255, 0);
    ellipse ( dotX, dotY, 10, 10);

    fill(0);
    text("Score: " + score, 10, 25); 

    if (ballY >= 675)
    {
      textSize(50);
      background(0);
      fill(255);
      text("Game Over", 500, height/2);
      textSize(25);
      text("Score:" + score, 600, 380);
      textSize(15);
      text("Press Spacebar to RESTART", 550, 420);
      noLoop();
    }
  }
}




void keyPressed()
{
  if (key == 'a')
  {
    xspeed = -1;
  }
  if (key == 'd')
  {
    xspeed = 1;
  }
  if (keyCode == LEFT)
  {
    xspeed = -3;
  }
  if (keyCode == RIGHT)
  {
    xspeed = 3;
  } 
  if ((key == ' ') && (ballY >= 675))
  {
    loop();
    score=0;
    ballY=height-13;
    ballX=ballY;
    dotX = width/2;
    dotY = height/2;
    yspeed = -10;
    xspeed = 0;
  }
  
  if(keyCode == ENTER)
  {
    title = false;
  }
}



