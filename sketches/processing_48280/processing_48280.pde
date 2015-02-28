
int stage_X = 1200;
int stage_Y = 700;

int game_state = 0;

String version = "ALPHA v1.4.1";
String mod_date = "11.18.10";
PFont visitor;

MainMenu theMenu;
Game theGame;
GameOver theGO;

int FRAMES_PER_SECOND = 60;
int fps_counter = 0;
float lastFPS = 0;

void setup()
{
  size(1200, 700);
  frameRate(FRAMES_PER_SECOND);
  
  visitor = loadFont("VisitorTT2BRK-72.vlw");
  
  theMenu = new MainMenu();
  theGame = new Game();
  theGO = new GameOver();
}

void draw()
{
  switch(game_state)
  {
    case 0:
      theMenu.display();
      break;
    case 1:
      if(theGame.display())
        goscreen();
      break;
    case 2:
      theGO.display();
      break;
  }
  
  textAlign(LEFT);
  textFont(visitor, 24);
  fill(255);
  text(version, 5, 15);
  text(mod_date, 5, 30);
  
  if(fps_counter == FRAMES_PER_SECOND)
  {
    lastFPS = decPlaces(frameRate, 2);
    fps_counter = 0;
  }else{
    fps_counter++;
  }

  textAlign(RIGHT);
  text(lastFPS + " fps (target " + FRAMES_PER_SECOND + ")", stage_X - 20, 20);
}

float decPlaces(float val, int figs)
{
  return round(val * pow(10, figs)) / pow(10, figs);
}

void keyPressed()
{
  //println("key = " + key + ", keyCode = " + keyCode);
  if(game_state == 1)
    theGame.keyPressedRec();
}

void keyReleased()
{
  if(game_state == 1)
    theGame.keyReleasedRec();
}

void mousePressed()
{
  switch(game_state)
  {
    case 0:
      if(theMenu.mousePressedRec())
        game();
      break;
    case 2:
      mainmenu();
      break;
  }
}

void mainmenu()
{
  theMenu = new MainMenu();
  game_state = 0;
}

void game()
{
  theGame = new Game();
  game_state = 1;
}

void goscreen()
{
  theGO = new GameOver();
  game_state = 2;
}

