
// The idea was create a game, for practice the typing ability and show a score.
// It's posible set the level where:
//   - level 1: position and size of letter are constants
//   - level 2: position changes but the size is constant
//   - level 3: position changes and size too
// Althought, for each good keypress, the points increment by one, but for each bad keypress, the points decrease by one.
// It's possible negatives scores.
// The levels are fixed by the 1, 2, 3 keys.
// Reset the game with 0 (zero) key.
// Exit the game with esc key.
// For start, press the space bar.
// It is not possible change the level while the game is running.
// If you want change the max time, you can modify the 'tInitial' variable.
// THE BLOQ MAYUS MUST BE OFF.
// GET READY !!!, with this instructions you can play and enjoy of this easy and entertaining game.


import ddf.minim.*;
Minim minim;

//modify this for change the max time
int tInitial = 100;


//Three sounds for different situations
AudioSample bad;
AudioSample good;
AudioSample tada;

PFont f;
int conta = 0;
int t = tInitial;
int points = 0;
int level = 1;

boolean run = false;

char[] letters = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};

//initialize the currentLetter
char currentLetter = ' ';
//position and size of the letter (those change respect the level)
float px;
float py;
float sizeLetter = 250;

void setup()
{
  size(1000, 600);
  background(#2DB8ED);
  f = createFont("times", 16, true);
  textFont(f, 60);
  
  minim = new Minim(this);
  //assign the sounds
  good = minim.loadSample("good.wav");
  bad = minim.loadSample("bad.wav");
  tada = minim.loadSample("tada.wav");
  px = width / 2;
  py = 400;
  //reset is a function defined below
  reset();
}


void draw()
{
  if ( run == true)
  {
    conta += 1;
    fill(#2DB8ED);
    rect(0, 0, width, height);

    fill(0);
    //this is for do slow clock
    if (conta == 10)
    {
      t--;
      conta = 0;
    }
    textFont(f, sizeLetter);
    text(currentLetter, px, py);
    
    //if clock is zero, show the score
    if ( t <= 0)
    {
      t = 0;
      run = false;
      results();
    }
  }
  
  
  
  //those lines are for draw the box of time, points, level
  textFont(f, 60);
  fill(#B6D315);
  rect(20, 20, 300, 60);
  fill(0);
  text("Time : " + str(t), 170, 75);

  fill(#B6D315);
  strokeWeight(5);
  rect(350, 20, 300, 60);
  fill(0);
  text("Points : " + str(points), 500, 75);

  fill(#B6D315);
  strokeWeight(5);
  rect(680, 20, 300, 60);
  fill(0);
  text("Level : " + str(level), 830, 75);
}


void keyPressed()
{
  switch(key)
  {
  case ' ':
    if (run == false)
    {
      currentLetter = randomLetter();
      run = true;
    }
    break;
  case '1':
    if ( run == false)
    {
      level = 1;
    }
    break;
  case '2':
    if ( run == false)
    {
      level = 2;
    }
    break;
  case '3':
    if ( run == false)
    {
      level = 3;
    }
    break;
  case '0':
    currentLetter = ' ';
    t = tInitial;
    run = false;
    points = 0;
    level = 1;
    px = width / 2;
    py = 400;
    sizeLetter = 250;
    reset();
    break;
  }
  
  
  if (run == true && key != ' ')
  {
    if (key == currentLetter)
    {
      //if the keypress is good, play a sound
      points++;
      good.trigger();
    }
    else
    {
      //if the keypress is bad, play a sound
      points--;
      bad.trigger();
    }
    
    //generate a randomLetter (is defined below)
    currentLetter = randomLetter();
    //select the level
    if (level == 1)
    {
      px = width / 2;
      py = 400;
      sizeLetter = 250;
    }
    else if (level == 2)
    {
      sizeLetter = 250;
      px = random(0, width - 70);
      py = random(sizeLetter, height - sizeLetter);
    }
    else if (level == 3)
    {
      sizeLetter = random(50, 250);
      px = random(0, width - 70);
      py = random(sizeLetter, height - sizeLetter);
    }
  }  
}


//function for generate a randomLetter
char randomLetter()
{
  return letters[int(random(0, 26))];
}

//function for set the initial configuration
void reset()
{
  fill(#2DB8ED);
  rect(0, 0, width, height);
    
  PImage img = loadImage("1.jpg");
  image(img, 400, 150, 374, 323);
  
  stroke(0);
  strokeWeight(5);
  fill(#4CE5D0);
  rect(30, 150, 260, 323);
  textFont(f, 20);
  textAlign(CENTER);
  fill(255, 0, 0);
  text(" Typing game", 140, 180);
  textFont(f, 16);
  textAlign(LEFT);
  fill(0);
  text("GET READY YOUR FINGERS !!!\nHow much you know about \nkeyboard letters organization? ", 47, 210);
  text("These are the commands:\n * 0 = reset \n * 1, 2, 3 = set level \n * space = start the game\n * esc = exit", 47, 310);
  
  textAlign(CENTER);
  
  textFont(f, 60);
  fill(#B6D315);
  rect(20, 20, 300, 60);
  fill(0);
  text("Time : " + str(t), 170, 75);

  fill(#B6D315);
  strokeWeight(5);
  rect(350, 20, 300, 60);
  fill(0);
  text("Points : " + str(points), 500, 75);

  fill(#B6D315);
  strokeWeight(5);
  rect(680, 20, 300, 60);
  fill(0);
  text("Level : " + str(level), 830, 75);
}

//function for print the score and play a tada
void results()
{
  fill(#2DB8ED);
  rect(0, 0, width, height);
  textFont(f, 170);
  textAlign(CENTER);
  fill(255, 0, 0);
  text(" Your Score: \n" + str(points), width / 2, 250);
  tada.trigger();
}


