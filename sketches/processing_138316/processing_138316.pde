
// This is mechanographics game, the idea is demonstrate the ability tou have in typing fastly the keyboard.
// the instructions for the game are in the canvas.
// now try it, try to be the better typing keyboard letters.
// atention!!!



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
  background(255,255,255);
  f = createFont("HannotateSC-W5", 16, true);
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
    fill(255,255,255);
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
  fill(#EC7EF5);
  rect(20, 20, 300, 60);
  fill(0);
  text("Time : " + str(t), 170, 75);

  fill(#EC7EF5);
  strokeWeight(5);
  rect(350, 20, 300, 60);
  fill(0);
  text("Points : " + str(points), 500, 75);

  fill(#EC7EF5);
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
  fill(#A5F0E0);
  rect(0, 0, width, height);
    
  PImage img = loadImage("mecha.png");
  image(img, 400, 150, 394, 323);
  
  stroke(0);
  strokeWeight(5);
  fill(#3EF56A);
  rect(30, 150, 280, 340);
  textFont(f, 22);
  textAlign(CENTER);
  fill(255, 0, 0);
  text("    Mechanographics game", 140, 180);
  textFont(f, 18);
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
  fill(255,255,255);
  rect(0, 0, width, height);
  textFont(f, 160);
  textAlign(CENTER);
  fill(255, 105, 105);
  text(" Your Score: \n" + str(points), width / 2, 250);
  tada.trigger();
}


