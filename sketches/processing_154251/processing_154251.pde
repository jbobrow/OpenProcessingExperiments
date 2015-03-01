
//Pacman Variables
float maxMouthSize;
float mouthSize;
int pacSpeed;
int pacX;
float pacY;
int pacRadius;
boolean decreasing = true;
color pacColor;

//Dot variables
int numDots = 9;

//Word variables
String[] hexCode = new String[50];

//Main initialization
void setup()
{
  size(750, 750);
  background(0);
  maxMouthSize = PI / 5;
  mouthSize = maxMouthSize;
  pacX = 100;
  pacY = height / 2;
  pacRadius = 100;
  pacSpeed = 3;
  color pacColor = color(255, 255, 0);
}

//Main draw loop
void draw()
{
  background(0);
  animatePacman();

  drawDots();
  drawPacman();
  
  //drawWords();
}

//Animates Pacman
void animatePacman()
{
  pacY = (height / 2)+ random(10);

  // MOVEMENT ACROSS SCREEN
  if (pacX - 100 <= width)
  {
    pacX += pacSpeed;
  } else if (pacX - 100 > width)
  {
    pacX = -100;
    numDots = 9;
  }

  /* MOUTH MOTION CONTROL
   Changing "PI / 100" will change the rate of open and close. */
  if (decreasing == true)
  {
    mouthSize -= PI / 80;
    if (mouthSize <= 0)
    {
      decreasing = false;
      pacColor = color(random(255), random(255), random(255));
      addWords();
    }
  }

  if (decreasing == false)
  {
    mouthSize += PI / 80;
    if (mouthSize >= maxMouthSize)
    {
      decreasing = true;
      pacColor = color(random(255), random(255), random(255));
      addWords();
    }
  }
}

//Draws the Pacman
void drawPacman()
{
  noStroke();
  fill(pacColor); //Color the Pacman yellow
  arc(pacX, pacY, pacRadius, pacRadius, mouthSize, (2 * PI) - mouthSize); //Create Pacman
}

//Draws dots
void drawDots()
{
  int dotX = 75;
  for (int i = 1; i <= numDots; i++)
  {
    fill(255);
    if (dotX > pacX)
    {
      ellipse(dotX, pacY, 20, 20);
    }
    dotX += 75;
  }
}

//THE FOLLOWING IS A WORK IN PROGRESS

//Make words
int lastWord = 0;
int wordCount = 0;
void addWords()
{
  if (lastWord >= 50)
  {
    lastWord = 0;
  }
  
  if (wordCount < hexCode.length)
  {
    wordCount++;
  }
  hexCode[lastWord] = "#" + hex(pacColor);
  lastWord++;
}

//Draws the words
void drawWords()
{
  for (int i = 0; i < wordCount; i++)
  {
    fill(pacColor);
    textSize(32);
    text(hexCode[i], pacX, pacY);
  }
}

class Text
{
  int xPos;
  int yPos;
  float speed;
  color textColor;
}
