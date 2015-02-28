
int[][] colorgrid = new int[15][23]; //[3-10][3-18] is the actual grid. 1 = R, 2 = B, 3 = Y
int[][] directiongrid = new int[15][23]; //1 = single pill, 2 = connected to right, 3 = to left, 4 = to top, 5 = to bottom, 6 = virus
int[][] clearinggrid = new int[15][23];
int[][] nextfallcolorgrid = new int[15][23];
int[][] nextfalldirectiongrid = new int[15][23];
int[][][] virusmap = new int[4][15][23];
int[] fallingpilldetails = new int[9]; //1-2 = colors, 3-4 = (1)locX,Y, 5-6 = (2)locX,Y, 7-8 = directions
int[] nextpill = new int[3]; //1-2 = colors
int[] buttonspressed = new int[8]; //1 = p   2 = k   3 = l   4 = a   5 = s   6 = d  7 = space
int altframe = 0;
int pillspermin = 0;
int framestakentemp = 0;
int minutestaken = 0;
int secondstaken = 0;
int pillsdropped = 0;
int framestaken = 0;
int scoreatbeginning = 0;
int hitbottom = 0;
int paused = 1; //0 = paused, 1 = not
int firstkey = 0;
int secondkey = 0;
int selectionprogress = 1;
int stuffcleared = 0;
int fallen = 0;
int clearedindrop = 0;
int virusesclearedindrop = 0;
int pointsinturn = 0;
int pillhoriz = 1; //1 if the pill is horizontal, 0 if not.
int speed = 50; //Minimum=10
int speedcounter = 0; //Every 10 pills, speed-up.
int framessincefall = 0;
int score = 0;
int level = 10;
int viruses = 0;
int randX = 0;
int randY = 0;
int maxY = 0;
int randcolor = 0;
int virusmapgenerated = 0;
int selectedcolor = 0;
int pseudolevel = 0;
int mode = 2;
int gameover = 0; 
String lastmessage = "";
PFont font;

void setup ()
{
  size(301,361);
  background(255);
  stroke(0);
  font = loadFont("ArialNarrow-12.vlw");
  textFont(font);
  rectMode(CORNERS);
  ellipseMode(CORNERS);
  frameRate(60);
}

void draw ()
{
  if (mode == 1)
  {
    MainGameMethod();
  }
  if (mode == 2)
  {
    MenuMethod();
  }
  if (mode == 3)
  {
    GameWonMethod();
  }
}

void MenuMethod()
{
  MenuOutput();
  MenuInput();
  if (selectionprogress == 3)
  {
    ParseInput();
  }
  if (selectionprogress == 3)
  {
    selectionprogress = 1;
  }
}

void MenuOutput()
{
  background(255);
  fill(0);
  if (selectionprogress == 1)
  {
    text("Start level = ??",1,11);
  }
  else
  {
    text("Start level = " + firstkey + "?",1,11);
  }
  text("DOGHEALER'S DR. MARIO",1,35);
  text("Original game and concept belongs to Nintendo.",1,47);
  text("This clone programmed by Doghealer.",1,59);
  text("HOW TO PLAY",1,83);
  text("The goal in each level is to clear all the viruses.",1,95);
  text("You do this by dropping colored pills on them, tetris style.",1,107);
  text("Pill segments and viruses are cleared by lining up four of",1,119);
  text("the same color, horizontally or vertically.",1,131);
  text("Points are awarded ONLY for clearing viruses.",1,143);
  text("You get exponentially more points for clearing more viruses",1,153);
  text("with a single pill. For example, 4 viruses in one pill is worth",1,163);
  text("1500 points, but 5 viruses is worth 3100, and 6 is worth 6300.",1,175);
  text("If you clear all the viruses in one level, you can proceed to the next.",1,187);
  text("You will lose the game if you are unable to drop another pill due to",1,199);
  text("the top of the playfield being blocked off.",1,211);
  text("Key setup: A = move left, D = move right, S = move down",1,223);
  text("K = rotate CCW, L = rotate CW, spacebar = drop all the way, P = pause",1,235);
  text("To begin, choose a level between 0 and 20 to start on. To choose a single",1,259);
  text("digit level, preceed it with a 0. For example, to start on level 5, enter \"05\"",1,271);
}

void MenuInput()
{
  if (!keyPressed)
  {
    buttonspressed[1] = 0;
  }
  if (keyPressed && buttonspressed[1] == 0 && key != ' ')
  {
    buttonspressed[1] = 1;
    if (selectionprogress == 1)
    {
      firstkey = int(str(key));
    }
    else if (selectionprogress == 2)
    {
      secondkey = int(str(key));
    }
    selectionprogress++;
  }
}

void ParseInput()
{
  level = (firstkey * 10) + secondkey;
  if (level > 20)
  {
    selectionprogress = 1;
  }
  else
  {
    gameover = 0;
    pillsdropped = 0;
    framestaken = 0;
    scoreatbeginning = 0;
    score = 0;
    viruses = 0;
    virusmapgenerated = 0;
    speed = max(10,min(50,(73-level)));
    speedcounter = 0;
    altframe = 0;
    mode = 1;
    lastmessage = "";
    for (int i = 3; i <= 10; i++)
    {
      for (int j = 2; j <= 18; j++)
      {
        colorgrid[i][j] = 0;
        directiongrid[i][j] = 0;
        for (int k = 1; k <= 3; k++)
        {
          virusmap[k][i][j] = 0;
        }
      }
    }
  }
}

void GameWonMethod()
{
  DrawPlayField();
  framessincefall--;
  if (framessincefall <= 0)
  {
    framessincefall = 0;
    if (keyPressed)
    {
      pillsdropped = 0;
      framestaken = 0;
      scoreatbeginning = score;
      viruses = 0;
      virusmapgenerated = 0;
      level++;
      speed = max(10,min(50,(73-level)));
      speedcounter = 0;
      altframe = 0;
      mode = 1;
      lastmessage = "";
      for (int i = 3; i <= 10; i++)
      {
        for (int j = 2; j <= 18; j++)
        {
          colorgrid[i][j] = 0;
          directiongrid[i][j] = 0;
          for (int k = 1; k <= 3; k++)
          {
            virusmap[k][i][j] = 0;
          }
        }
      }
    }
  }
}

void MainGameMethod()
{
  DrawPlayField();
  if (gameover == 0)
  {
    if (virusmapgenerated == 0)
    {
      GenerateVirusMap();
    }
    InputFunction();
    FallingPillBehavior();
  }
  else if (keyPressed)
  {
    mode = 2;
  }
}

void DrawPlayField()
{
  background(255);
  stroke(0);
  fill(0);
  rect(1,1,80,20);
  rect(1,1,20,360);
  rect(1,341,200,360);
  rect(181,1,200,360);
  rect(121,1,200,20);
  if (paused == 1)
  {
  for (int i = 3; i <= 18; i++) //Y
  {
    for (int j = 3; j <= 10; j++) //X
    {
      if (colorgrid[j][i] == 1)
      {
        fill(255,0,0);
      }
      else if (colorgrid[j][i] == 2)
      {
        fill(0,0,225);
      }
      else if (colorgrid[j][i] == 3)
      {
        fill(255,255,0);
      }
      if (colorgrid[j][i] != 0)
      {
        selectedcolor = colorgrid[j][i];
        stroke(0);
        ellipse((20 * j) - 39,(20 * i) - 39,(20 * j) - 20,(20 * i) - 20);                 
        if (directiongrid[j][i] == 2)
        {
          rect((20 * j) - 29,(20 * i) - 39,(20 * j) - 20,(20 * i) - 20);
          SetStroke();
          line((20 * j) - 29,(20 * i) - 38,(20 * j) - 29,(20 * i) - 21);
        }
        else if (directiongrid[j][i] == 3)
        {
          rect((20 * j) - 39,(20 * i) - 39,(20 * j) - 30,(20 * i) - 20);
          SetStroke();
          line((20 * j) - 30,(20 * i) - 38,(20 * j) - 30,(20 * i) - 21);
        }
        else if (directiongrid[j][i] == 4)
        {
          rect((20 * j) - 39,(20 * i) - 39,(20 * j) - 20,(20 * i) - 30);
          SetStroke();
          line((20 * j) - 38,(20 * i) - 30,(20 * j) - 21,(20 * i) - 30);
        }
        else if (directiongrid[j][i] == 5)
        {
          rect((20 * j) - 39,(20 * i) - 29,(20 * j) - 20,(20 * i) - 20);
          SetStroke();
          line((20 * j) - 38,(20 * i) - 29,(20 * j) - 21,(20 * i) - 29);
        }
        else if (directiongrid[j][i] == 6)
        {
          strokeWeight(2);
          stroke(0);
          line((20 * j) - 39,(20 * i) - 39,(20 * j) - 20,(20 * i) - 20);
          line((20 * j) - 39,(20 * i) - 20,(20 * j) - 20,(20 * i) - 39);
          strokeWeight(1);
        }
      }
    }
  }
  for (int i = mode; i <= 2; i++)
  {
    if (nextpill[i] == 1)
    {
      fill(255,0,0);
    }
    else if (nextpill[i] == 2)
    {
      fill(0,0,225);
    }
    else if (nextpill[i] == 3)
    {
      fill(255,255,0);
    }
    selectedcolor = nextpill[i];
    stroke(0);
    ellipse(61 + (20 * i),1,80 + (20 * i),20);                 
    if (i == 1)
    {
      rect(91,1,100,20);
      SetStroke();
      line(91,2,91,19);
    }
    else
    {
      rect(101,1,110,20);
      SetStroke();
      line(110,2,110,19);
    }
  }
  for (int i = mode; i <= 2; i++)
  {
    if (fallingpilldetails[i] == 1)
    {
      fill(255,0,0);
    }
    else if (fallingpilldetails[i] == 2)
    {
      fill(0,0,225);
    }
    else if (fallingpilldetails[i] == 3)
    {
      fill(255,255,0);
    }
    selectedcolor = fallingpilldetails[i];
    stroke(0);
    ellipse((20 * fallingpilldetails[2 * i + 1]) - 39,(20 * fallingpilldetails[2 * i + 2]) - 39,(20 * fallingpilldetails[2 * i + 1]) - 20,(20 * fallingpilldetails[2 * i + 2]) - 20);                 
    if (fallingpilldetails[i + 6] == 2)
    {
      rect((20 * fallingpilldetails[2 * i + 1]) - 29,(20 * fallingpilldetails[2 * i + 2]) - 39,(20 * fallingpilldetails[2 * i + 1]) - 20,(20 * fallingpilldetails[2 * i + 2]) - 20);
      SetStroke();
      line((20 * fallingpilldetails[2 * i + 1]) - 29,(20 * fallingpilldetails[2 * i + 2]) - 38,(20 * fallingpilldetails[2 * i + 1]) - 29,(20 * fallingpilldetails[2 * i + 2]) - 21);
    }
    else if (fallingpilldetails[i + 6] == 3)
    {
      rect((20 * fallingpilldetails[2 * i + 1]) - 39,(20 * fallingpilldetails[2 * i + 2]) - 39,(20 * fallingpilldetails[2 * i + 1]) - 30,(20 * fallingpilldetails[2 * i + 2]) - 20);
      SetStroke();
      line((20 * fallingpilldetails[2 * i + 1]) - 30,(20 * fallingpilldetails[2 * i + 2]) - 38,(20 * fallingpilldetails[2 * i + 1]) - 30,(20 * fallingpilldetails[2 * i + 2]) - 21);
    }
    else if (fallingpilldetails[i + 6] == 4)
    {
      rect((20 * fallingpilldetails[2 * i + 1]) - 39,(20 * fallingpilldetails[2 * i + 2]) - 39,(20 * fallingpilldetails[2 * i + 1]) - 20,(20 * fallingpilldetails[2 * i + 2]) - 30);
      SetStroke();
      line((20 * fallingpilldetails[2 * i + 1]) - 38,(20 * fallingpilldetails[2 * i + 2]) - 30,(20 * fallingpilldetails[2 * i + 1]) - 21,(20 * fallingpilldetails[2 * i + 2]) - 30);
    }
    else if (fallingpilldetails[i + 6] == 5)
    {
      rect((20 * fallingpilldetails[2 * i + 1]) - 39,(20 * fallingpilldetails[2 * i + 2]) - 29,(20 * fallingpilldetails[2 * i + 1]) - 20,(20 * fallingpilldetails[2 * i + 2]) - 20);
      SetStroke();
      line((20 * fallingpilldetails[2 * i + 1]) - 38,(20 * fallingpilldetails[2 * i + 2]) - 29,(20 * fallingpilldetails[2 * i + 1]) - 21,(20 * fallingpilldetails[2 * i + 2]) - 29);
    }
  }
  }
  fill(255);
  stroke(255);
  rect(201,1,300,300);
  fill(0);
  text("SCORE",202,11);
  text(score,202,23);
  text("VIRUS",202,35);
  text(viruses,202,47);
  text("LEVEL",202,59);
  text(level,202,71);
  text("SPEED",202,83);
  text(speed,202,95);
  text(lastmessage,202,119);
  minutestaken = framestaken / 1800;
  framestakentemp = framestaken % 1800;
  secondstaken = framestakentemp / 30;
  text("TIME",202,185);
  if (secondstaken <= 9)
  {
    text(minutestaken + ":0" + secondstaken,202,197);
  }
  else
  {
    text(minutestaken + ":" + secondstaken,202,197);
  }
  text("PILLS USED",202,209);
  text(pillsdropped,202,221);
  text("PILLS/MIN",202,233);
  if (framestaken > 31)
  {
    pillspermin = (60 * pillsdropped) / ((60 * minutestaken) + secondstaken);
    text(pillspermin,202,245);
  }
  text("PTS/VIRUS",202,257);
  if ( ((4 * level) + 4) > viruses)
  {
    text(((score - scoreatbeginning) / (((4 * level) + 4) - viruses)),202,269);
  }
}

void SetStroke()
{
  if (selectedcolor == 1)
  {
    stroke(255,0,0);
  }
  else if (selectedcolor == 2)
  {
    stroke(0,0,225);
  }
  else if (selectedcolor == 3)
  {
    stroke(255,255,0);
  }
}

void GenerateVirusMap()
{
  virusmapgenerated = 1;
  pseudolevel = min(level,23);
  for (int i = 1; i <= ((pseudolevel * 4) + 4); i++)
  {
    if (i <= 3)
    {
      randcolor = i;
    }
    else
    {
      randcolor = int(random(1,4));
    }
    if (level <= 4)
    {
      maxY = 10;
    }
    else if (level <= 8)
    {
      maxY = 9;
    }
    else if (level <= 12)
    {
      maxY = 8;
    }
    else if (level <= 16)
    {
      maxY = 7;
    }
    else
    {
      maxY = 6;
    }
    randX = int(random(3,11));
    randY = int(random(maxY,19));
    if (virusmap[randcolor][randX][randY] == 0 && virusmap[1][randX][randY] != 2 && virusmap[2][randX][randY] != 2 && virusmap[3][randX][randY] != 2 && randcolor != 4 && randX != 11 && randY != 19)
    {
      virusmap[randcolor][randX][randY] = 2;
      colorgrid[randX][randY] = randcolor;
      directiongrid[randX][randY] = 6;
      viruses = viruses + 1;
      if (virusmap[randcolor][randX+1][randY] == 2)
      {
        virusmap[randcolor][randX+2][randY] = 1;
        virusmap[randcolor][randX+3][randY] = 1;
        virusmap[randcolor][randX-1][randY] = 1;
        virusmap[randcolor][randX-2][randY] = 1;
      }
      if (virusmap[randcolor][randX-1][randY] == 2)
      {
        virusmap[randcolor][randX+1][randY] = 1;
        virusmap[randcolor][randX+2][randY] = 1;
        virusmap[randcolor][randX-2][randY] = 1;
        virusmap[randcolor][randX-3][randY] = 1;
      }
      if (virusmap[randcolor][randX][randY+1] == 2)
      {
        virusmap[randcolor][randX][randY+2] = 1;
        virusmap[randcolor][randX][randY+3] = 1;
        virusmap[randcolor][randX][randY-1] = 1;
        virusmap[randcolor][randX][randY-2] = 1;
      }
      if (virusmap[randcolor][randX][randY-1] == 2)
      {
        virusmap[randcolor][randX][randY+1] = 1;
        virusmap[randcolor][randX][randY+2] = 1;
        virusmap[randcolor][randX][randY-2] = 1;
        virusmap[randcolor][randX][randY-3] = 1;
      }
      if (virusmap[randcolor][randX+2][randY] == 2)
      {
        virusmap[randcolor][randX+1][randY] = 1;
        virusmap[randcolor][randX+3][randY] = 1;
        virusmap[randcolor][randX-1][randY] = 1;
      }
      if (virusmap[randcolor][randX-2][randY] == 2)
      {
        virusmap[randcolor][randX+1][randY] = 1;
        virusmap[randcolor][randX-1][randY] = 1;
        virusmap[randcolor][randX-3][randY] = 1;
      }
      if (virusmap[randcolor][randX][randY+2] == 2)
      {
        virusmap[randcolor][randX][randY+1] = 1;
        virusmap[randcolor][randX][randY+3] = 1;
        virusmap[randcolor][randX][randY-1] = 1;
      }
      if (virusmap[randcolor][randX][randY-2] == 2)
      {
        virusmap[randcolor][randX][randY+1] = 1;
        virusmap[randcolor][randX][randY-1] = 1;
        virusmap[randcolor][randX][randY-3] = 1;
      }
      if (virusmap[randcolor][randX+3][randY] == 2)
      {
        virusmap[randcolor][randX+1][randY] = 1;
        virusmap[randcolor][randX+2][randY] = 1;
      }
      if (virusmap[randcolor][randX-3][randY] == 2)
      {
        virusmap[randcolor][randX-1][randY] = 1;
        virusmap[randcolor][randX-2][randY] = 1;
      }
      if (virusmap[randcolor][randX][randY+3] == 2)
      {
        virusmap[randcolor][randX][randY+1] = 1;
        virusmap[randcolor][randX][randY+2] = 1;
      }
      if (virusmap[randcolor][randX][randY-3] == 2)
      {
        virusmap[randcolor][randX][randY-1] = 1;
        virusmap[randcolor][randX][randY-2] = 1;
      }
    }
    else
    {
      i--;
    }
  }
  fallingpilldetails[1] = 4;
  while (fallingpilldetails[1] == 4)
  { 
    fallingpilldetails[1] = int(random(1,4));
  }
  fallingpilldetails[2] = 4;
  while (fallingpilldetails[2] == 4)
  { 
    fallingpilldetails[2] = int(random(1,4));
  }
  fallingpilldetails[3] = 6;
  fallingpilldetails[4] = 3;
  fallingpilldetails[5] = 7;
  fallingpilldetails[6] = 3;
  fallingpilldetails[7] = 2;
  fallingpilldetails[8] = 3;
  nextpill[1] = 4;
  while (nextpill[1] == 4)
  {
    nextpill[1] = int(random(1,4));
  }
  nextpill[2] = 4;
  while (nextpill[2] == 4)
  {
    nextpill[2] = int(random(1,4));
  }
  for (int i = 3; i <= 10; i++)
  {
    colorgrid[i][19] = i + 10;
  }
  for (int i = 3; i <= 18; i++)
  {
    colorgrid[2][i] = i + 10;
    colorgrid[11][i] = i + 10;
  }
}

void InputFunction()
{
  if (keyPressed)
  {
    if (key != 's')
    {
      buttonspressed[5] = 0;
    }
    if (key == 's' && buttonspressed[5] == 0)
    {
      buttonspressed[5] = 1;
      DownOne();
    }
    if (key != 'a')
    {
      buttonspressed[4] = 0;
    }
    if (key == 'a' && buttonspressed[4] == 0)
    {
      buttonspressed[4] = 1;
      if (!(fallingpilldetails[3] == 3 || fallingpilldetails[5] == 3 || colorgrid[fallingpilldetails[3]-1][fallingpilldetails[4]] != 0 || colorgrid[fallingpilldetails[5]-1][fallingpilldetails[6]] != 0))
      {
        fallingpilldetails[3] = fallingpilldetails[3] - 1;
        fallingpilldetails[5] = fallingpilldetails[5] - 1;
      }
    }
    if (key != 'd')
    {
      buttonspressed[6] = 0;
    }
    if (key == 'd' && buttonspressed[6] == 0)
    {
      buttonspressed[6] = 1;
      if (!(fallingpilldetails[3] == 10 || fallingpilldetails[5] == 10 || colorgrid[fallingpilldetails[3]+1][fallingpilldetails[4]] != 0 || colorgrid[fallingpilldetails[5]+1][fallingpilldetails[6]] != 0))
      {
        fallingpilldetails[3] = fallingpilldetails[3] + 1;
        fallingpilldetails[5] = fallingpilldetails[5] + 1;
      }
    }
    if (key != 'k')
    {
      buttonspressed[2] = 0;
    }
    if (key == 'k' && buttonspressed[2] == 0) //Rotate CCW
    {
      buttonspressed[2] = 1;
      if (fallingpilldetails[7] == 2)
      {
        if (colorgrid[fallingpilldetails[3]][fallingpilldetails[4]-1] != 0 && colorgrid[fallingpilldetails[5]][fallingpilldetails[6]-1] == 0)
        {
          fallingpilldetails[3] = fallingpilldetails[3] + 1;
          fallingpilldetails[6] = fallingpilldetails[6] - 1;
          fallingpilldetails[7] = 4;
          fallingpilldetails[8] = 5;
        }
        else if (colorgrid[fallingpilldetails[3]][fallingpilldetails[4]-1] == 0)
        {
          fallingpilldetails[5] = fallingpilldetails[5] - 1;
          fallingpilldetails[6] = fallingpilldetails[6] - 1;
          fallingpilldetails[7] = 4;
          fallingpilldetails[8] = 5;
        }
      }
      else if (fallingpilldetails[7] == 3)
      {
        if (colorgrid[fallingpilldetails[5]][fallingpilldetails[6]-1] != 0 && colorgrid[fallingpilldetails[3]][fallingpilldetails[4]-1] == 0)
        {
          fallingpilldetails[4] = fallingpilldetails[4] - 1;
          fallingpilldetails[5] = fallingpilldetails[5] + 1;
          fallingpilldetails[7] = 5;
          fallingpilldetails[8] = 4;
        }
        else if (colorgrid[fallingpilldetails[5]][fallingpilldetails[6]-1] == 0)
        {
          fallingpilldetails[3] = fallingpilldetails[3] - 1;
          fallingpilldetails[4] = fallingpilldetails[4] - 1;
          fallingpilldetails[7] = 5;
          fallingpilldetails[8] = 4;
        }
      }
      else if (fallingpilldetails[7] == 4)
      {
        if (colorgrid[fallingpilldetails[3]+1][fallingpilldetails[4]] != 0 && colorgrid[fallingpilldetails[3]-1][fallingpilldetails[4]] == 0)
        {
          fallingpilldetails[5] = fallingpilldetails[5] - 1;
          fallingpilldetails[6] = fallingpilldetails[6] + 1;
          fallingpilldetails[7] = 3;
          fallingpilldetails[8] = 2;
        }
        else if (colorgrid[fallingpilldetails[3]+1][fallingpilldetails[4]] == 0)
        {
          fallingpilldetails[3] = fallingpilldetails[3] + 1;
          fallingpilldetails[6] = fallingpilldetails[6] + 1;
          fallingpilldetails[7] = 3;
          fallingpilldetails[8] = 2;
        }
      }
      else if (fallingpilldetails[7] == 5)
      {
        if (colorgrid[fallingpilldetails[5]+1][fallingpilldetails[6]] != 0 && colorgrid[fallingpilldetails[5]-1][fallingpilldetails[6]] == 0)
        {
          fallingpilldetails[3] = fallingpilldetails[3] - 1;
          fallingpilldetails[4] = fallingpilldetails[4] + 1;
          fallingpilldetails[7] = 2;
          fallingpilldetails[8] = 3;
        }
        else if (colorgrid[fallingpilldetails[5]+1][fallingpilldetails[6]] == 0)
        {
          fallingpilldetails[4] = fallingpilldetails[4] + 1;
          fallingpilldetails[5] = fallingpilldetails[5] + 1;
          fallingpilldetails[7] = 2;
          fallingpilldetails[8] = 3;
        }
      }
    }
    if (key != 'l')
    {
      buttonspressed[3] = 0;
    }
    if (key == 'l' && buttonspressed[3] == 0) //Rotate CW BROKEN
    {
      buttonspressed[3] = 1;
      if (fallingpilldetails[7] == 2)
      {
        if (colorgrid[fallingpilldetails[3]][fallingpilldetails[4]-1] != 0 && colorgrid[fallingpilldetails[5]][fallingpilldetails[6]-1] == 0)
        {
          fallingpilldetails[3] = fallingpilldetails[3] + 1;
          fallingpilldetails[4] = fallingpilldetails[4] - 1;
          fallingpilldetails[8] = 4;
          fallingpilldetails[7] = 5;
        }
        else if (colorgrid[fallingpilldetails[3]][fallingpilldetails[4]-1] == 0)
        {
          fallingpilldetails[5] = fallingpilldetails[5] - 1;
          fallingpilldetails[4] = fallingpilldetails[4] - 1;
          fallingpilldetails[8] = 4;
          fallingpilldetails[7] = 5;
        }
      }
      else if (fallingpilldetails[7] == 3)
      {
        if (colorgrid[fallingpilldetails[5]][fallingpilldetails[6]-1] != 0 && colorgrid[fallingpilldetails[3]][fallingpilldetails[4]-1] == 0)
        {
          fallingpilldetails[6] = fallingpilldetails[6] - 1;
          fallingpilldetails[5] = fallingpilldetails[5] + 1;
          fallingpilldetails[8] = 5;
          fallingpilldetails[7] = 4;
        }
        else if (colorgrid[fallingpilldetails[5]][fallingpilldetails[6]-1] == 0)
        {
          fallingpilldetails[3] = fallingpilldetails[3] - 1;
          fallingpilldetails[6] = fallingpilldetails[6] - 1;
          fallingpilldetails[8] = 5;
          fallingpilldetails[7] = 4;
        }
      }
      else if (fallingpilldetails[7] == 4)
      {
        if (colorgrid[fallingpilldetails[3]+1][fallingpilldetails[4]] != 0 && colorgrid[fallingpilldetails[3]-1][fallingpilldetails[4]] == 0)
        {
          fallingpilldetails[3] = fallingpilldetails[3] - 1;
          fallingpilldetails[6] = fallingpilldetails[6] + 1;
          fallingpilldetails[8] = 3;
          fallingpilldetails[7] = 2;
        }
        else if (colorgrid[fallingpilldetails[3]+1][fallingpilldetails[4]] == 0)
        {
          fallingpilldetails[5] = fallingpilldetails[5] + 1;
          fallingpilldetails[6] = fallingpilldetails[6] + 1;
          fallingpilldetails[8] = 3;
          fallingpilldetails[7] = 2;
        }
      }
      else if (fallingpilldetails[7] == 5)
      {
        if (colorgrid[fallingpilldetails[5]+1][fallingpilldetails[6]] != 0 && colorgrid[fallingpilldetails[5]-1][fallingpilldetails[6]] == 0)
        {
          fallingpilldetails[5] = fallingpilldetails[5] - 1;
          fallingpilldetails[4] = fallingpilldetails[4] + 1;
          fallingpilldetails[8] = 2;
          fallingpilldetails[7] = 3;
        }
        else if (colorgrid[fallingpilldetails[5]+1][fallingpilldetails[6]] == 0)
        {
          fallingpilldetails[4] = fallingpilldetails[4] + 1;
          fallingpilldetails[3] = fallingpilldetails[3] + 1;
          fallingpilldetails[8] = 2;
          fallingpilldetails[7] = 3;
        }
      }
    }
    if (key != 'p')
    {
      buttonspressed[1] = 0;
    }
    if (key == 'p' && buttonspressed[1] == 0)
    {
      buttonspressed[1] = 1;
      if (paused == 1)
      {
        paused = 0;
      }
      else
      {
        paused = 1;
      }
    }
    if (key != ' ')
    {
      buttonspressed[7] = 0;
    }
    if (key == ' ' && buttonspressed[7] == 0)
    {
      buttonspressed[7] = 1;
      hitbottom = 0;
      while (hitbottom == 0)
      {
        DownOne();
      }
    }
  }
  if (!keyPressed)
  {
    for (int i = 1; i <= 7; i++)
    {
      buttonspressed[i] = 0;
    }
  }
}

void FallingPillBehavior()
{
  if (altframe == 1)
  {
    altframe = 0;
    framestaken = framestaken + paused;
    framessincefall = framessincefall + paused;
    if (framessincefall == speed)
    {
      DownOne();
    }
  }
  else
  {
    altframe = 1;
  }
}

void DownOne()
{
  framessincefall = 0;
  if (colorgrid[fallingpilldetails[3]][fallingpilldetails[4]+1] != 0 || colorgrid[fallingpilldetails[5]][fallingpilldetails[6]+1] != 0)
  {
    pillsdropped++;
    hitbottom = 1;
    lastmessage = "";
    colorgrid[fallingpilldetails[3]][fallingpilldetails[4]] = fallingpilldetails[1];
    colorgrid[fallingpilldetails[5]][fallingpilldetails[6]] = fallingpilldetails[2];
    directiongrid[fallingpilldetails[3]][fallingpilldetails[4]] = fallingpilldetails[7];
    directiongrid[fallingpilldetails[5]][fallingpilldetails[6]] = fallingpilldetails[8];
    speedcounter++;
    if (speedcounter == 10)
    {
      lastmessage = lastmessage + "Speed up!\n";
      speedcounter = 0;
      speed--;
      if (speed < 5)
      {
        speed = 5;
        lastmessage = lastmessage + "\b\b\b\b\b\b\b\b\b\b";
      }
    }
    stuffcleared = 1;
    while (stuffcleared == 1)
    {
      for (int i = 3; i <= 10; i++)
      {
        for (int j = 2; j <= 18; j++)
        {
          clearinggrid[i][j] = 0;
        }
      }
      CheckForClears();
    }
    if (virusesclearedindrop != 0)
    {
      if (virusesclearedindrop <= 8)
      {
        pointsinturn = (int)((pow(2,(virusesclearedindrop))) * 100) - 100;
      }
      else
      {
        pointsinturn = 25500 + (12800 * (virusesclearedindrop - 8));
      }
      lastmessage = lastmessage + "+" + pointsinturn + "points!\n";
      virusesclearedindrop = 0;
    }
    if (colorgrid[6][3] != 0 || colorgrid[7][3] != 0)
    {
      gameover = 1;
      lastmessage = lastmessage + "GAME OVER!";
    }
    else if (viruses == 0)
    {
      mode = 3;
      selectionprogress = 1;
      lastmessage = lastmessage + "STAGE CLEAR!\nTRY NEXT!\nPress any key.";
      framessincefall = 30;
    }
    else
    {
      // Start generate next pill
      fallingpilldetails[1] = nextpill[1];
      fallingpilldetails[2] = nextpill[2];
      fallingpilldetails[3] = 6;
      fallingpilldetails[4] = 3;
      fallingpilldetails[5] = 7;
      fallingpilldetails[6] = 3;
      fallingpilldetails[7] = 2;
      fallingpilldetails[8] = 3;
      pillhoriz = 1;
      nextpill[1] = 4;
      while (nextpill[1] == 4)
      {
        nextpill[1] = int(random(1,4));
      }
      nextpill[2] = 4;
      while (nextpill[2] == 4)
      {
       nextpill[2] = int(random(1,4));
      }
      for (int i = 3; i <= 10; i++)
      {
        colorgrid[i][2] = 0;
        directiongrid[i][2] = 0;
      }
      // End generate next pill
    }
  }
  else
  {
    fallingpilldetails[4] = fallingpilldetails[4] + 1;
    fallingpilldetails[6] = fallingpilldetails[6] + 1;
  }
}

void CheckForClears()
{
  clearedindrop = 0;
  stuffcleared = 0;
  for (int i = 3; i <= 10; i++)
  {
    for (int j = 2; j <= 15; j++)
    {
      if (colorgrid[i][j] == colorgrid[i][j+1] && colorgrid[i][j] == colorgrid[i][j+2] && colorgrid[i][j] == colorgrid[i][j+3] && colorgrid[i][j] != 0)
      {
        clearinggrid[i][j] = 1;
        clearinggrid[i][j+1] = 1;
        clearinggrid[i][j+2] = 1;
        clearinggrid[i][j+3] = 1;
        clearedindrop = 1;
        stuffcleared = 1;
      }
    }
  }
  for (int i = 3; i <= 18; i++)
  {
    for (int j = 3; j <= 7; j++)
    {
      if (colorgrid[j][i] == colorgrid[j+1][i] && colorgrid[j][i] == colorgrid[j+2][i] && colorgrid[j][i] == colorgrid[j+3][i] && colorgrid[j][i] != 0)
      {
        clearinggrid[j][i] = 1;
        clearinggrid[j+1][i] = 1;
        clearinggrid[j+2][i] = 1;
        clearinggrid[j+3][i] = 1;
        clearedindrop = 1;
        stuffcleared = 1;
      }
    }
  }
  if (clearedindrop == 1)
  {
    ClearClears();
    FallFloaters();
  }
}

void ClearClears()
{
  for (int i = 3; i <= 10; i++)
  {
    for (int j = 2; j <= 18; j++)
    {
      if (clearinggrid[i][j] == 1)
      {
        colorgrid[i][j] = 0;
        if (directiongrid[i][j] == 2 && clearinggrid[i+1][j] == 0)
        {
          directiongrid[i+1][j] = 1;
        }
        else if (directiongrid[i][j] == 3 && clearinggrid[i-1][j] == 0)
        {
          directiongrid[i-1][j] = 1;
        }
        else if (directiongrid[i][j] == 4 && clearinggrid[i][j-1] == 0)
        {
          directiongrid[i][j-1] = 1;
        }
        else if (directiongrid[i][j] == 5 && clearinggrid[i][j+1] == 0)
        {
          directiongrid[i][j+1] = 1;
        }
        else if (directiongrid[i][j] == 6)
        {
          viruses--;
          score = score + (min(int(pow(2,virusesclearedindrop)),128) * 100);
          virusesclearedindrop++;
        }
        directiongrid[i][j] = 0;
      }
    }
  }
}

void FallFloaters()
{
  fallen = 1;
  while (fallen == 1)
  {
    for (int i = 3; i <= 10; i++)
    {
      for (int j = 2; j <= 18; j++)
      {
        nextfallcolorgrid[i][j] = colorgrid[i][j];
        nextfalldirectiongrid[i][j] = directiongrid[i][j];
      }
    }
    fallen = 0;
    for (int i = 3; i <= 10; i++)
    {
      for (int j = 2; j <= 18; j++)
      {
        if (colorgrid[i][j] != 0 && colorgrid[i][j+1] == 0 && directiongrid[i][j] != 6)
        {
          if (directiongrid[i][j] == 1 || directiongrid[i][j] == 4 || directiongrid[i][j] == 5)
          {
            FallSingle(i,j);
            fallen = 1;
          }
          else if (directiongrid[i][j] == 2)
          {
            FallConnectedToRight(i,j);
          }
          else if (directiongrid[i][j] == 3)
          {
            FallConnectedToLeft(i,j);
          }
        }
      }
    }
    for (int i = 3; i <= 10; i++)
    {
      for (int j = 2; j <= 18; j++)
      {
        colorgrid[i][j] = nextfallcolorgrid[i][j];
        directiongrid[i][j] = nextfalldirectiongrid[i][j];
      }
    }
  }
}

void FallSingle(int x, int y)
{
  nextfallcolorgrid[x][y+1] = colorgrid[x][y];
  nextfalldirectiongrid[x][y+1] = directiongrid[x][y];
  nextfallcolorgrid[x][y] = 0;
  nextfalldirectiongrid[x][y] = 0;
}

void FallConnectedToRight(int x, int y)
{
  if (colorgrid[x+1][y+1] == 0)
  {
    fallen = 1;
    nextfallcolorgrid[x][y+1] = colorgrid[x][y];
    nextfalldirectiongrid[x][y+1] = directiongrid[x][y];
    nextfallcolorgrid[x][y] = 0;
    nextfalldirectiongrid[x][y] = 0;
    nextfallcolorgrid[x+1][y+1] = colorgrid[x+1][y];
    nextfalldirectiongrid[x+1][y+1] = directiongrid[x+1][y];
    nextfallcolorgrid[x+1][y] = 0;
    nextfalldirectiongrid[x+1][y] = 0;
  }
}

void FallConnectedToLeft(int x, int y)
{
  if (colorgrid[x-1][y+1] == 0)
  {
    fallen = 1;
    nextfallcolorgrid[x][y+1] = colorgrid[x][y];
    nextfalldirectiongrid[x][y+1] = directiongrid[x][y];
    nextfallcolorgrid[x][y] = 0;
    nextfalldirectiongrid[x][y] = 0;
    nextfallcolorgrid[x-1][y+1] = colorgrid[x-1][y];
    nextfalldirectiongrid[x-1][y+1] = directiongrid[x-1][y];
    nextfallcolorgrid[x-1][y] = 0;
    nextfalldirectiongrid[x-1][y] = 0;
  }
}

