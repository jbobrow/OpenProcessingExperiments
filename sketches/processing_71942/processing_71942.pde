
float posX = 25;
float posY = 10;
float paddleW = 10;
float paddleH = 50;
float comY = 150;
float c = 2;
float d = 3;
float player1 = 0;
float player2 = 0;
float ran = random(-5, 5);

void setup()
{
  size(600, 500);
  smooth();
  strokeWeight(1);
  posX = random(100,300);
  posY  =random(0,height-100);
}

void draw()
{

  background(0);
  fill(100);
  rect(0, 400, 600, 100);
  
  fill(255);
  text("My score " + player1, 50, 450);
  text("Comp score " + player2, 500, 450);
  
  //comp paddle
  fill(100, 150, 100);
  comY = constrain(comY, 0, height-150);
  rect(width-50, comY, paddleW, paddleH);
  
  //middle line
  fill(255, 0, 0);
  rect(295, 0, 10, 400);
  
  //player1 paddle
  fill(100, 150, 100);
  float playerY = constrain(mouseY-paddleH/2, 0, height-150);
  rect(50, playerY, paddleW, paddleH);
  
  //ball
  fill(150, 100, 150);
  ellipse(posX, posY, 20, 20);
  
  posY = posY+c;
  posX = posX+d;
  
  // check top and bottom walls
  if (posY > 400 || posY < 0 )
  {
    c = c*-1;
  }

  // check left and right walls
  if (posX > width-10)  
  {
    // player1 scores
    player1++;
    posX = width/2;
    posY = height/2;
    d = d * -1;
    println(player1 + " - " + player2);
  }
  else if (posX < 10) {
    // player2 scores
    player2++;
    posX = width/2;
    posY = height/2;
    d = d * -1;
    println(player1 + " - " + player2);
  }

  // check collision with paddle
  if ((posY >= mouseY-paddleH/2 && posY <= mouseY+paddleH/2)  && posX <= 60)
  {
    d = d * -1;
   // c = c * -1;
  }
  if ((posY >= comY && posY <= comY+50) && posX >= width-60) {
    d = d * -1;
    //c = c *- 1;
  }

  if ( d > 0 )
  { 
    if (comY < posY)
    { 
      comY = comY + ran/2.5;
    }

    if (comY > posY)
    { 
      comY = comY - ran/2;
    }
  }
  else {
    if (comY < 175)
    { 
      comY = comY + random(1,2);
    }

    if (comY > 175)
    { 
      comY = comY - random(1,2);
    }
  }

}


