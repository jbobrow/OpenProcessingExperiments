
int numDice = 5;
PImage[] dicePicture;
int[] roll;
boolean[] picked;
int diceSideLength;
int space;
int diceY;
int dieClicked;
int rolls;
boolean endTurn;

color bgColor;

void setup()
{

  space = 10;

  bgColor = color(255);


  dicePicture = new PImage[7];
  roll = new int[numDice+1];
  picked = new boolean[7];

  background(bgColor);

  for (int i=0; i<=6; i++)
  {
    dicePicture[i] = loadImage("http://www.jnyhoff.net/trnty/cpsc251/" + i + ".png");
  }


  diceSideLength = dicePicture[0].width;
  size(diceSideLength*(numDice+2), diceSideLength*4);

  initialize();
}

void draw()
{
}

void keyPressed()
{
  if (key == ' ')
  {
    rollDice();
    displayDice();
  }
}

void keyReleased()
{            
  background(bgColor);
  displayDice();
  fill(0);
  rolls = rolls + 1;
  if (rolls < 3)
  {
    displayTurn();
  }
  else
  {
    endTurn = true;
  }
  displayButton();
}


void rollDice()
{
  if (endTurn == false)
  {
    for (int i=1; i<=numDice; i++)
    {
      if (picked[i] == false)
      {
        roll[i] = floor( random(1, 7) );
        println("roll[" + i + "] = " + roll[i]);
      }
    }
  }
}

void displayDice()
{

  for (int i=1; i<=numDice; i++)
  {
    if (picked[i] == true)
    {
      diceY = 0;
    }
    else
    {
      diceY = height/2;
    }

    image(dicePicture[ roll[i] ], (i-1)*(diceSideLength), diceY);
  }
}

void mouseReleased()
{
  // if clicked in horizontal dice range
  if ( mouseX <= numDice * diceSideLength )
  {
    //if clicked in bottom dice row
    if ( (mouseY > height/2) && (mouseY < (height/2 + diceSideLength) ) ) 
    { 
      // println("dice row clicked.");
      // println("mouseX: " + mouseX);
      dieClicked = mouseX/100 + 1;
      println("die clicked: " + dieClicked);
      println();
      picked[dieClicked] = true;
      background(bgColor);
      displayDice();
      displayTurn();
      displayButton();
    }

    // if clicked in top dice row
    if ( mouseY < diceSideLength ) 
    { 
      println("top row clicked.");
      println("mouseX: " + mouseX);
      dieClicked = mouseX/100 + 1;
      println("die clicked: " + dieClicked);
      println();
      picked[dieClicked] = false;
      background(bgColor);
      displayDice();
      displayTurn();
      displayButton();
    }
  }
  else  // did not click in either dice row
  {
    // click button?
    if ( (mouseX > width-diceSideLength) && (mouseY < diceSideLength) )
    {
      // wants to stop
      if (rolls < 3)
      {
        println("Wants to Stop");
        rolls = 3;
        displayButton();
      }

      else
      {
        println("Next Player");
      }
      initialize();
    }
  }
}

void displayTurn()
{
  println("rolls: " + rolls);
  textSize(48);
  textAlign(LEFT);
  if (rolls < 3)
  {
    text("Roll: " + rolls, width-170, height-20);
  }
}

void displayButton()
{
  fill(255, 255, 0);
  rect(width-100, 0, 100, 100);
  fill(0);
  textSize(24);
  textAlign(CENTER);
  if (endTurn == true )
  {
    text("Next \nPlayer", width-50, 40);
  }
  else
  {
    text("Stop", width-50, 60);
  }
}

void initialize()
{
  for (int i=0; i<=6; i++)
  {
    picked[i] = false;
  }

  background(bgColor);
  fill(0);
  textAlign(CENTER);
  textSize(64);
  text("YAHTZEE!\n", width/2, height/2-100);
  textSize(48);
  text("Press SPACE to Roll", width/2, height-25);

  endTurn = false;
  rolls = 0;
}
