

//Credit goes to Chris Hill because I have taken ideas from his pong program and modified his collision method to make my own.
//http://www.openprocessing.org/visuals/?visualID=5530
float x, y, xSpeed, ySpeed;
float lastry, lastrb;
int p1Score = 0;
int p2Score = 0;
int targetScore = 10;
int TheX = 15;
int TheY = 195;
int TheB = 195;


void setup() {
  size(600, 400);
  smooth();
  x = width/2;
  y = height/2;
  xSpeed = 2.9;
  ySpeed = 1.7;
}

void draw() {
  background(0);
  x += xSpeed; 
  y += ySpeed;
  texts();
  rightPaddle();
  leftPaddle();
  borders();
  objects();
  collision();
  Victory();
}

void texts()
{
  textAlign(CENTER);
  text("PONG!", width/2, 25);

  textAlign(LEFT);
  text("Player 1 = ", 10, 20);
  text(p1Score, 80, 20);

  textAlign(RIGHT);
  text("Player 2 = ", width - 30, 20);
  text(p2Score, width - 20, 20);
}

void borders() {
  line(0, 30, width, 30);
  stroke(255);
  fill(255);
  line(0, height-2, width, height-2);
  stroke(255);
  fill(255);
}

void objects()
{
  strokeWeight(0);
  rect(width-(TheX + 5), TheB, 5, 50);
  rect(TheX, TheY, 5, 50);
  ellipse(x, y, 15, 15);
}

void leftPaddle()
{
  if (keyPressed) 
  {
    if (key == 'w' || key == 'W')
    {
      lastry = TheY;
      TheY = TheY - 2;
      if (TheY <= 30) 
      {
        TheY = TheY + 2;
      }
    }
  }
  if (keyPressed) 
  {
    if (key == 's' || key == 'S')
    {
      lastry = TheY;
      TheY= TheY + 2;
      if (TheY >= height - 50) 
      {
        TheY= height - 52;
      }
    }
  }
}

void rightPaddle()
{
  if (keyPressed) 
  {
    if (key == CODED)
    {
      if (keyCode == UP)
      {
        lastrb = TheB;
        TheB = TheB - 2;
        if (TheB <= 30) 
        {
          TheB = TheB + 2;
        }
      }
    }
  }
  if (keyPressed) 
  {
    if (key == CODED)
    {
      if (keyCode == DOWN)
      {
        lastrb = TheB;
        TheB= TheB + 2;
        if (TheB >= height - 50)
        {
          TheB = height - 52;
        }
      }
    }
  }
}

void collision() {
  if (TheX + 7 >= x && (TheY <= y && TheY + 10 >=y)) {
    xSpeed = -xSpeed - 1;

    if (ySpeed > 0 && lastry > TheY) {
      ySpeed = -ySpeed;
    }
    else if (ySpeed < 0 && lastry < TheY) {
      ySpeed = -ySpeed;
    }
  }
  if ((width - TheX)-6 <= x && (TheB <= y && TheB+10 >= y)) {
    xSpeed = (-xSpeed - 1);

    if (ySpeed > 0 && lastrb < TheB) {
      ySpeed = -ySpeed;
    }
    else if ( ySpeed < 0 && lastrb < TheB) {
      ySpeed =- ySpeed;
    }
  }
  if (TheX + 7 >= x && (TheY + 10 < y && TheY + 20 >= y)) {
    xSpeed = -xSpeed - 1;

    if (ySpeed > 0 && lastry > TheY) {
      ySpeed = -ySpeed;
    }
    else if (ySpeed < 0 && (lastry < TheY)) {
      ySpeed = -ySpeed;
    }
  }
  if ((width - TheX) - 6 <= x && (TheB + 10 < y && TheB + 20 >= y)) {
    xSpeed = -xSpeed - 1;

    if ( ySpeed > 0 && (lastrb < TheB )) {
      ySpeed = -ySpeed;
    }
    else if ( ySpeed < 0 && (lastrb < TheB)) {
      ySpeed = -ySpeed;
    }
  }

  if ((TheX + 7 >= x && (TheY+20 < y && TheY + 30 >= y)))
  {

    xSpeed = -xSpeed; 

    if (ySpeed > 0 && (lastry > TheY))
    {
      ySpeed = -ySpeed;
    }
    else if (ySpeed < 0 && (lastry < TheY))
    {
      ySpeed = -ySpeed;
    }
  }
  if ((width-TheX)-6 <= x && (TheB + 20 < y && TheB + 30 >=y))
  {
    ;
    xSpeed = -xSpeed; 
    if (ySpeed > 0 && (lastrb > TheB))
    {
      ySpeed = -ySpeed;
    }
    else if (ySpeed < 0 && (lastrb < TheB))
    {
      ySpeed = -ySpeed;
    }
  }


  if ((TheX + 7 >= x && (TheY + 30 < y && TheY + 40 >= y)))
  {

    xSpeed = -xSpeed + .20; 
    if (ySpeed > 0 && (lastry > TheY))
    {
      ySpeed = -ySpeed;
    }
    else if (ySpeed < 0 && (lastry < TheY))
    {
      ySpeed = -ySpeed;
    }
  }
  if ((width-TheX)-6 <= x && (TheB  +30 < y && TheB + 40 >= y))
  {

    xSpeed = -xSpeed + 1; 
    if (ySpeed > 0 && (lastrb > TheB))
    {
      ySpeed = -ySpeed;
    }
    else if (ySpeed < 0 && (lastrb < TheB))
    {
      ySpeed = -ySpeed;
    }
  }

  if ((TheX + 7 >=x && (TheY + 40 < y && TheY + 50 >= y)))
  {

    xSpeed = -xSpeed + 1; 
    if (ySpeed > 0 && (lastry > TheY))
    {
      ySpeed = -ySpeed;
    }
    else if (ySpeed < 0 && (lastry < TheY))
    {
      ySpeed = -ySpeed;
    }
  }
  if ((width-TheX)-6 <= x && (TheB + 40 < y && TheB + 50 >= y))
  {

    xSpeed = -xSpeed - 1; 
    if (ySpeed > 0 && (lastrb > TheB))
    {
      ySpeed = -ySpeed;
    }
    else if (ySpeed < 0 && (lastrb < TheB))
    {
      ySpeed = -ySpeed;
    }
  }

  if (y >= height-5 || y <= 35)
  {
    ySpeed = -ySpeed;
  }

  if (x <= -5) {
    p2Score++; 
    x = width/2;
    y = height/2;
    xSpeed = 2.9;
    ySpeed = 1.7;
  }
  if (x >= width + 5) {
    p1Score++;
    x = width/2;
    y = height/2;
    xSpeed = -2.9;
    ySpeed = 1.7;
  }
}

void Victory() {
  if ( p1Score == targetScore ) {

    xSpeed = 0;
    ySpeed = 0;
    text("Player 1 Wins!", width/2-10, height/2);
    text("Press X to play again, press Z to quit", (width/2)+20, (height/2)+20); 
    if (keyPressed) {
      if ( key == 'x' || key == 'X') {
        background(0);
        TheX = 15;
        TheY = 195;
        TheB = 195;
        xSpeed = 2.9;
        ySpeed = 1.7;
        p1Score = 0;
        p2Score = 0;
      }
      if ( key == 'z' || key == 'Z') {
        exit();
      }
    }
  }
  if (p2Score == targetScore) {

    xSpeed = 0;
    ySpeed = 0;
    text("Player 2 Wins!", width/2-10, height/2);
    text("Press X to play again, press Z to quit", (width/2)+20, (height/2)+20);
    if (keyPressed) {
      if ( key == 'x' || key == 'X') {
        background(0);
        TheX = 15;
        TheY = 195;
        TheB = 195;
        xSpeed = 2.9;
        ySpeed = 1.7;
        p1Score = 0;
        p2Score = 0;
      }
      if ( key == 'z' || key == 'Z') {
        exit();
      }
    }
  }
}


