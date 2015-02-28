
/*
Dillon Marlatt
 Digital Art: 20 Second Game Exercise
 ==20 Seconds at the Space Buffet==
 -In the near future, dried McTacoBurger cubes become the meal of choice. But during their first venture into
 space, the genetically altered genes within the McTacoBurger cubes mixed with space radiation and created a MONSTER FOOD!
 -The astronauts had to sacrifice themselves and open their ship to the vaccuum of space, in order to save the rest of humanity.
 They didn't expect that the McTacoBurger monster doesn't need air to survive, all it needs it to FEED!
 You are McTacoBurger monster, eat smaller dried vegetable foods in order to gain enough strength to re-enter earth's
 atmosphere before impact in 20 seconds.
 Game Hint: Watch out for dried vegetable cubes bigger than you, you won't be able to eat them and they will absorb you.
 
 This game is an analysis on the rise of genetically altered food and fast food vs. healthy food ideals popular today.
 
 NOTE:
 -the longer the game is, the faster the food runs. Yah, increasing motion!
 */

int begin;               // Time the event/game begins
boolean active;          // Flag for event/game status
boolean done;            // Flag for "game over"
PImage spaceBackground;
PImage mainScreen;
PImage story1;
PImage story2;
PImage story3;
PImage gameHint;
PImage endWin;
PImage endAbsorb;
PImage endBurn;
int storyCount = 0;

float pointDeviation = 15;               //deviation of quad points from mouseX & mouseY
int food = 6;                           //number of food used to grow your beautiful body
float[] foodDeviation = new float[food]; //deviation of quad points for food
float[] foodX = new float[food];         //basically mouseX for the food, foodDeviation helps find 4 points of quad
float[] foodY = new float[food];         //basically mouseY for the food, foodDeviation helps find 4 points of quad
float[] foodSpeedX = new float[food];    //helps get different speed for all the food pals
float[] foodSpeedY = new float[food];    //helps get different speed for all the food pals
boolean defeated;                        //for assertaining if player food collides with too large of a food pal
int foodDeathCount = 0;
float radius = 8;
//interpolated motion below
float x;                                 // x position of follow-object
float y;                                 // y position of follow-object
float dx;                                //delta x
float dy;                                //delta y
float speed = 70;                        //speed of player food

void setup() 
{
  size(400, 400);
  active = false;        // Don't begin with action
  done = false;          // The event/game has not finished
  spaceBackground = loadImage("spaceBackground.gif");
  mainScreen = loadImage("mainScreen.gif");
  story1 = loadImage("story1.gif");
  story2 = loadImage("story2.gif");
  story3 = loadImage("story3.gif");
  gameHint = loadImage("gameHint.gif");
  endWin = loadImage("endWin.gif");
  endAbsorb = loadImage("endAbsorb.gif");
  endBurn = loadImage("endBurn.gif");
  noStroke();

  for (int i=0; i<food; i++) //get location and size of food
  {
    foodDeviation[i] = random(5, 25);
    foodX[i] = random(0, width);
    foodY[i] = random(0, height);
  }
}

void draw() 
{
  background(204);

  if (active == true) 
  {
    eventGame();         // Run the event/game
    timer();             // Time the event/game
  } 
  else 
  {
    if (done == true) 
    {
      endScreen();       // Show the "end" screen
    } 
    else if (storyCount == 0) //main screen
    {
      image(mainScreen, 0, 0);
    }
    else if (storyCount == 1)
    {
      image(story1, 0, 0);
    }
    else if (storyCount == 2)
    {
      image(story2, 0, 0);
    }
    else if (storyCount == 3)
    {
      image(story3, 0, 0);
    }
    else if (storyCount == 4)
    {
      image(gameHint, 0, 0);
    }
  }
}

void eventGame() 
{
  if (defeated == false)
  {
    //interpolated motion
    dx = mouseX - x;
    dy = mouseY - y;

    // apply delta x to x to make a delay
    x = dx/speed + x;
    y = dy/speed + y;

    spaceScreen();
    
    fill(255, 0, 0);
    quad(x-pointDeviation, y-pointDeviation, x+pointDeviation, y-pointDeviation, x+pointDeviation, 
    y+pointDeviation, x-pointDeviation, y+pointDeviation); //draws player food
    fill(0);
    quad(x-pointDeviation+5, y-pointDeviation+5, x-pointDeviation+10, y-pointDeviation+5,
    x-pointDeviation+10, y-pointDeviation+10, x-pointDeviation+5, y-pointDeviation+10); //player food left eye
    quad(x+pointDeviation-10, y-pointDeviation+5, x+pointDeviation-5, y-pointDeviation+5,
    x+pointDeviation-5, y-pointDeviation+10, x+pointDeviation-10, y-pointDeviation+10); //player food right eye
    ellipse(x, y, pointDeviation-5, pointDeviation-5); //player food mouth
    fill(0, 205, 0);

    for (int i=0; i<food; i++) //draws all of those cute little food pals
    {
      quad(foodX[i]-foodDeviation[i], foodY[i]-foodDeviation[i], foodX[i]+foodDeviation[i], foodY[i]-foodDeviation[i], foodX[i]+foodDeviation[i], 
      foodY[i]+foodDeviation[i], foodX[i]-foodDeviation[i], foodY[i]+foodDeviation[i]);
    }

    for (int i=0; i<food; i++) //moves all of those cute little food pals
    {
      foodMove(i);
    }

    for (int i=0; i<food; i++) //woot collision detection!
    {
      float z = (foodX[i]-x) * (foodX[i]-x) + (foodY[i]-y) * (foodY[i]-y) - (foodDeviation[i]+radius) * (foodDeviation[i]+radius);

      if (z<0 && foodDeviation[i]>pointDeviation) //if food pal is bigger than player food
      {
        defeated = true;
      }

      else if (z<0 && foodDeviation[i]<pointDeviation) //if food pal is smaller than player food
      {
        pointDeviation += 2;
        foodDeviation[i] = 0;  //delete food pal
        foodX[i] = 0;
        foodY[i] = 0;
        //System.out.println("POP UP!"); //for debugging (keep for future additions)
      }
    }

    if (foodDeathCount == food) //if all of the food pals have been eaten
    {
      gameOver(true);
    }

    foodDeathCount = 0;

    for (int i=0; i<food; i++)
    {
      if (foodDeviation[i] == 0)
      {
        foodDeathCount++;
      }
    }
  }

  else if (defeated == true) //if player food has collided with too large of a food pal
  {
    gameOver(false);
  }
}

void mousePressed() 
{
  // Begin the event/game when the mouse is clicked
  // and the event/game is not already happening
  if (active == false && storyCount >= 4) {
    active = true;
    begin = millis();
  }
  storyCount++;
}

void timer() 
{
  int curTime = millis();
  if (curTime > begin + 20000) 
  {
    active = false;
    done = true;
  }
  noStroke();
  fill(255);
  rect(0, height-5, width, 5);
  fill(0);
  rect(0, height-5, (curTime-begin)/50, 5);
}

void spaceScreen()
{
  image(spaceBackground, 0, 0);
}

// Displays when the 20 seconds are over
void endScreen() 
{
  image(endBurn, 0, 0);
  //reset all variables to begin anew
  pointDeviation = 15;               
  food = 6;                           
  defeated = false;              
  foodDeathCount = 0;
  storyCount = 4;

  for (int i=0; i<food; i++)
  {
    foodDeviation[i] = random(5, 25);
    foodX[i] = random(0, width);
    foodY[i] = random(0, height);
    foodSpeedX[i] = 0;
    foodSpeedY[i] = 0;
  }
}

void foodMove(int i)
{
  foodSpeedX[i] += random(-0.1, 0.1);
  foodSpeedY[i] += random(-0.1, 0.1);
  foodX[i] += foodSpeedX[i]; //to get gradual motion
  foodY[i] += foodSpeedY[i];

  //to check boundries of canvas
  if (foodX[i] < -5)
  {
    foodX[i] += width;
  }

  if (foodX[i] > width+5)
  {
    foodX[i] -= width;
  }

  if (foodY[i] < -5)
  {
    foodY[i] += height;
  }

  if (foodY[i] > height+5)
  {
    foodY[i] -= height;
  }
}

void gameOver(boolean condition)
{ 
  if (condition == false)
  {
    image(endAbsorb, 0, 0);
  }
  else if (condition == true)
  {
    image(endWin, 0, 0);
  }
}


