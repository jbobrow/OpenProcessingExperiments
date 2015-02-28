
int paintTool;
int color1R;
int color1G;
int color1B;
int color2R;
int color2G;
int color2B;
int color3R;
int color3G;
int color3B;
int color4R;
int color4G;
int color4B;
float ellipse1X;
float ellipse1Y;
float ellipse2X;
float ellipse2Y;
float ellipse3X;
float ellipse3Y;
float ellipse4X;
float ellipse4Y;
int ellipse1number;
int ellipse2number;
int ellipse3number;
int ellipse4number;
int[] colorArray = new int [25];
int playerSelect;
int currentColor = 0;
int currentColorShowing = 0;
float adjustedNumber = 2.0;
int roundNumber = 1;
int instructionNumber = 0;
PImage troll;

float timer1;
float timer2 = 0;
float timer3;
float timer4 = 0;



int countdown = 5;
int playerKeySelect;

boolean playerTurn = false;
boolean keyBeenPressed = false;
boolean numbersMatch = false;
boolean shake1 = false;
boolean shake2 = false;
boolean shake3 = false;
boolean shake4 = false;
boolean instructions = false;

void setup()
{
  size(500, 500);

  setEllipseColors();
  troll = loadImage("troll-face-png.png");

  for (int i = 0; i < 25; i++)
  {
    colorArray[i] = getColor();
  }
}

void draw()
{

  background(214, 211, 110);     
  fill(0);
  if (instructions == false)
  {
    textSize(20);
    text("Press ENTER to continue", 0, 450);
    if (instructionNumber == 0)
    {
      textSize(20);
      text("The game is a Simon says type Game", 75, 25);
      text("When the game appears you will see a pad", 75, 50); 
      text("that looks like this", 75, 75);
      drawEllipse();
    }
    if (instructionNumber == 1)
    {
      text("To the top right you will see", 0, 50);
      text("these instructions for the", 0, 75);
      text("specific circles", 0, 100);
      text("Note: They will dissappear after level 15", 0, 150);
      textSize(11);
      text("The Blue circle is number 1", 300, 50);
      text("The Green circle is number 2", 300, 75);
      text("The Red circle is number 3", 300, 100);
      text("The Yellow circle is number 4", 300, 125);
    }
    if (instructionNumber == 2)
    {
      text("One color will shake and brighten up ", 0, 25);
      text("for a few seconds", 0, 50);
      text("After it's done shaking, you only",0,75);
      text("have a few seconds to select the right circle number", 0,100);
      text("Note: As the rounds get higher,", 0, 125); 
      text("this time will decrease", 0, 150);
      text("There are 25 rounds, good luck!",0,175);
      fill(color1R, color1G, color1B); 
      ellipse(175 + ellipse1number, 300, 50, 50);
      displayEllipse1();
      ellipse1Shake();
    }
    if (instructionNumber == 3)
    {
      instructions = true;
    }
  
  }
  if (instructions == true)
  {
    image(troll, mouseX-100, mouseY-100);
    tint(255, (roundNumber * 10));
    textSize(11);
    text("Color Selected: " + playerSelect, 50, 50);
    text("Current Level: " + roundNumber, 50, 75);
    if(roundNumber < 15)
    {
    text("The Blue circle is number 1", 300, 50);
    text("The Green circle is number 2", 300, 75);
    text("The Red circle is number 3", 300, 100);
    text("The Yellow circle is number 4", 300, 125);
    }
    if (countdown > 0)
    {
      timer1 += .0167;
      countdown = 5 - (int)timer1;
      text("The game will start in " + countdown + " second(s)", 0, 150);
    }
    if (countdown <= 0 )
    {
      if (playerTurn == false)
      {
        
        timer2 += .0167;
        textSize(15);
        text("Computers Turn ", 100, 100);
        textSize(11);
        paintTool = 0;


        if (timer2 <= 1);
        {
          if (colorArray[currentColor] == 1 && timer2 <= adjustedNumber)
          {

            ellipse1Shake();
            displayEllipse1();
          }
          else if (colorArray[currentColor] == 1 && timer2 > adjustedNumber)
          {
            ellipse1StopShake();
            setEllipseColors();
          }

          else if (colorArray[currentColor] == 2 && timer2 <= adjustedNumber)
          {

            ellipse2Shake();
            displayEllipse2();
          }
          else if (colorArray[currentColor] == 2 && timer2 > adjustedNumber)
          {
            ellipse2StopShake();
            setEllipseColors();
          }
          else if (colorArray[currentColor] == 3 && timer2 <= adjustedNumber)
          {

            ellipse3Shake();
            displayEllipse3();
          }
          else if (colorArray[currentColor] == 3 && timer2 > adjustedNumber)
          {
            ellipse3StopShake();
            setEllipseColors();
          }
          else if (colorArray[currentColor] == 4 && timer2 <= adjustedNumber)
          {

            ellipse4Shake();
            displayEllipse4();
          }
          else if (colorArray[currentColor] == 4 && timer2 > adjustedNumber)
          {
            ellipse4StopShake();
            setEllipseColors();
          }
        }    
        if (timer2 > adjustedNumber)
        {
          timer2 = 0;
          playerTurn = true;
        }
      }



      println(colorArray[currentColor]);
      if (playerTurn == true )
      {
        timer3 += .0167;
        textSize(15);
        text("Your Turn", 100, 100);
        textSize(11);


        if (colorArray[currentColor] == playerSelect)
        {
          numbersMatch = true;
        }
        if (colorArray[currentColor] != playerSelect)
        {
          numbersMatch = false;
        }
      }

      checkFalse();
      checkTrue();
    }
    drawEllipse();
  }
}




void checkFalse()
{
  if (numbersMatch == false && timer3 >= 2 || numbersMatch == false && keyBeenPressed == true )
  {

    fill(0);
    text("I'm sorry, that is not the right color, the correct color was number " + colorArray[currentColor], 0, 150);
    noLoop();
    timer3 = 0;
  }
}

void checkTrue()
{
  if (numbersMatch == true && timer3 >= 2 || numbersMatch == true && keyBeenPressed == true )
  {
    playerTurn = false;
    timer3 = 0;
    playerSelect = 0;
    numbersMatch = false;
    keyBeenPressed = false;
    roundNumber++;
    currentColor++;
    if (roundNumber >= 1 && roundNumber <= 5)
    {
      adjustedNumber = 2;
    }
    if (roundNumber >= 8 && roundNumber <= 10)
    {
      adjustedNumber = 1.5;
    }
    if (roundNumber >= 11 && roundNumber <= 15)
    {
      adjustedNumber = 1;
    }
    if (roundNumber >= 16 && roundNumber <= 20)
    {
      adjustedNumber = .50;
    }
    if (roundNumber >= 21 && roundNumber <= 25)
    {
      adjustedNumber = .25;
    }
    if (roundNumber > 25)
    {
      textSize(25);
      text("Congradulations! You have won!", 0, 450);
      noLoop();
    }
  }
}

void keyPressed()
{

  if (key == '1' && playerTurn == true)
  {
    playerSelect = 1;
    displayEllipse1();
    ellipse1Shake();
    keyBeenPressed = true;
  }
  if (key == '2' && playerTurn == true)
  {
    playerSelect = 2;
    displayEllipse2();
    ellipse2Shake();
    keyBeenPressed = true;
  }
  if (key == '3' && playerTurn == true)
  {
    playerSelect = 3;
    displayEllipse3();
    ellipse3Shake();
    keyBeenPressed = true;
  }
  if (key == '4' && playerTurn == true)
  {
    playerSelect = 4;
    displayEllipse4();
    ellipse4Shake();
    keyBeenPressed = true;
  }
  if (key == ENTER)
  {
    instructionNumber++;
  }
}


void drawEllipse()
{

  ellipse(250, 300, 100, 100);
  fill(color1R, color1G, color1B); 
  ellipse(175 + ellipse1number, 300, 50, 50);
  fill(color2R, color2G, color2B);
  ellipse(325 + ellipse2number, 300, 50, 50);
  fill(color3R, color3G, color3B);
  ellipse(250, 225 + ellipse3number, 50, 50);
  fill(color4R, color4G, color4B);
  ellipse(250, 375 + ellipse4number, 50, 50);
}

int getColor()
{
  int colorCode;

  colorCode = (int)random(1, 5);

  return colorCode;
}

void displayEllipse1()
{
  color1R = 0;
  color1G = 0;
  color1B = 255;
  color2R = 64;
  color2G = 191;
  color2B = 83;
  color3R = 211;
  color3G = 64;
  color3B = 64;
  color4R = 211;
  color4G = 207;
  color4B = 64;
}

void displayEllipse2()
{
  color1R = 86;
  color1G = 72;
  color1B = 222;
  color2R = 0;
  color2G = 255;
  color2B = 0;
  color3R = 211;
  color3G = 64;
  color3B = 64;
  color4R = 211;
  color4G = 207;
  color4B = 64;
}

void displayEllipse3()
{
  color1R = 86;
  color1G = 72;
  color1B = 222;
  color2R = 64;
  color2G = 191;
  color2B = 83;
  color3R = 255;
  color3G = 0;
  color3B = 0;
  color4R = 211;
  color4G = 207;
  color4B = 64;
}

void displayEllipse4()
{
  color1R = 86;
  color1G = 72;
  color1B = 222;
  color2R = 64;
  color2G = 191;
  color2B = 83;
  color3R = 211;
  color3G = 64;
  color3B = 64;
  color4R = 255;
  color4G = 255;
  color4B = 0;
}



void ellipse1Shake()
{
  ellipse1number = (int)random(-5, 5);
  ellipse2number = 0;
  ellipse3number = 0;
  ellipse4number = 0;
}

void ellipse1StopShake()
{
  ellipse1number = 0;
  ellipse2number = 0;
  ellipse3number = 0;
  ellipse4number = 0;
}

void ellipse2Shake()
{
  ellipse1number = 0;
  ellipse2number = (int)random(-5, 5);
  ;
  ellipse3number = 0;
  ellipse4number = 0;
}

void ellipse2StopShake()
{
  ellipse1number = 0;
  ellipse2number = 0;
  ellipse3number = 0;
  ellipse4number = 0;
} 
void ellipse3Shake()
{

  ellipse1number = 0;
  ellipse2number = 0;
  ellipse3number = (int)random(-5, 5);
  ;
  ellipse4number = 0;
}

void ellipse3StopShake()
{
  ellipse1number = 0;
  ellipse2number = 0;
  ellipse3number = 0;
  ellipse4number = 0;
}
void ellipse4Shake()
{
  ellipse1number = 0;
  ellipse2number = 0;
  ellipse3number = 0;
  ellipse4number = (int)random(-5, 5);
}

void ellipse4StopShake()
{
  ellipse1number = 0;
  ellipse2number = 0;
  ellipse3number = 0;
  ellipse4number = 0;
}

void setEllipseColors()
{
  color1R = 86;
  color1G = 72;
  color1B = 222;
  color2R = 64;
  color2G = 191;
  color2B = 83;
  color3R = 211;
  color3G = 64;
  color3B = 64;
  color4R = 211;
  color4G = 207;
  color4B = 64;
}



