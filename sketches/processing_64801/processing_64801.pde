
/*
Basic output - DONE
Piece dropping - DONE
Piece movement - DONE
Rotation - DONE
Instadrop - DONE
Clearing lines - DONE
Next piece display - DONE
Pause - DONE
Ghost piece - DONE
Score (50,120,300,800) - DONE
Combos - DONE
Speed progression - DONE
Fancy Level-up Scrolling Text Thingy - DONE
End Stat Screen - DONE
Piece holding - DONE
Main Menu
Options menu
(O) Start speed
Cascade mode (And advanced falling detection)
(O) 1-5 size blocks
(O) Piece Mirroring
Fusion mode
Hotline mode
Sticky mode
Square mode
Garbage mode
*/

/*
Piece IDs (
1  2    3    4    5     6  7
X  XX   X    XX  XX   XXX  XXX
X  XX  XXX  XX    XX    X  X
X
X
*/

int[][] colorgrid = new int[15][25]; //[3-12][3-22] is the actual grid
String[] scorepopupvalue = new String[21];
int[] scorepopupX = new int[21];
int[] scorepopupY = new int[21];
int[] scorepopuptimer = new int[21];
int[] keyspressed = new int[10];
int[] keysdown = new int[10];
int[] keytimer = new int[10];
int[] fallingpieceX = new int[6];
int[] fallingpieceY = new int[6];
int[] yvalues = new int[54];
int[] stats_score = new int[31];
int[] stats_bonus = new int[31];
int[] stats_timeseconds = new int[31];
int[] stats_timeminutes = new int[31];
int[] stats_blocks = new int[31];
int[] stats_bpm = new int[31];
int[] stats_maxcombo = new int[31];
int[] stats_combos = new int[31];
int[] stats_lines = new int[31];
int[] stats_avgcombo = new int[31];//Value 10 times actual.
int bgB = 255;
int bgR = 0;
int popped = 0;
int popupX = 0;
int popupY = 0;
int scorepopupcounter = 1;
//int highscore = 0; //DISABLED IN OPENPROCESSING MODE
int saved = 0;
int droppoints = 0;
int temp = 0;
int heldpieceID = 0;
int heldthisdrop = 0;
int totalcombos = 0;
int totalcombocounter = 0;
int yscounter = 0;
int gameovertimer = 0;
int combos = 0;
int combocounter = 0;
int maxcombo = 0;
int scoretolastlevel = 0;
int bonusmessagetimer = 0;
int bonus = 0;
int tempframes = 0;
int levelframes = 0;
int levelseconds = 0;
int levelminutes = 0;
int levelblocks = -1;
int levelbpm = 0;
int levelupypos = 53;
int comboframesleft = 0;
int combosecondsleft = 0;
int combo = 0;
int gameover = 0;
int goal = 5;
int lines = 0;
int linesinclear = 0;
int level = 1;
int score = 0;
int ghostcounter = 0;
int paused = 1;
int dropped = 0;
int fallingpieceID = 0;
int nextpieceID = int(random(1,7.999999999));
int fallingpieceorientation = 0;
int piecedropped = 1;
int fallingpiececolor = 0;
int mode = 1;
int speed = 30;
int falltick = 60;
int droptick = 8;
int ok = 0;
boolean altframe = false;
//String highscorestr[] = new String[1]; //DISABLED IN OPENPROCESSING MODE
String combomessage = "";
String bonusmessage = "";
String dropmessage = "";
PFont font;
color[] colors = new color[10];

void setup()
{
  //highscorestr = loadStrings("highscore.txt"); //DISABLED IN OPENPROCESSING MODE
  //highscore = int(highscorestr[0]); //DISABLED IN OPENPROCESSING MODE
  size(401,441);
  background(255);
  stroke(0);
  font = loadFont("ArialNarrow-12.vlw");
  textFont(font);
  rectMode(CORNERS);
  frameRate(60);
  colors[1] = color(0,255,255);
  colors[2] = color(255,255,0);
  colors[3] = color(170,0,255);
  colors[4] = color(0,255,0);
  colors[5] = color(255,0,0);
  colors[6] = color(0,0,255);
  colors[7] = color(255,165,0);
  for (int i = 3; i <= 12; i++)
  {
    colorgrid[i][23] = 12;
  }
  for (int i = 3; i <= 22; i++)
  {
    colorgrid[2][i] = 12;
    colorgrid[13][i] = 12;
  }
  yvalues[1] = 450;
  yvalues[2] = 425;
  yvalues[3] = 401;
  yvalues[4] = 378;
  yvalues[5] = 356;
  yvalues[6] = 345;
  yvalues[7] = 325;
  yvalues[8] = 306;
  yvalues[9] = 288;
  yvalues[10] = 271;
  yvalues[11] = 255;
  yvalues[12] = 240;
  yvalues[13] = 226;
  yvalues[14] = 213;
  yvalues[15] = 201;
  yvalues[16] = 190;
  yvalues[17] = 180;
  yvalues[18] = 171;
  yvalues[19] = 163;
  yvalues[20] = 156;
  yvalues[21] = 150;
  yvalues[22] = 145;
  yvalues[23] = 141;
  yvalues[24] = 138;
  yvalues[25] = 136;
  yvalues[26] = 135;
  for (int i = 1; i <= 26; i++)
  {
    yvalues[26+i] = yvalues[27-i];
  }
  yvalues[53] = 500;
}

void draw()
{
  if (mode == 1)
  {
    MainGameMethod();
  }
  else if (mode == 2)
  {
    GameOverMainMethod();
  }
  else if (mode == 3)
  {
    StatsScreenMethod();
  }
  altframe = !altframe;
}

void MainGameMethod()
{
  if (popped == 1)
  {
    popped = 0;
    scorepopuptimer[scorepopupcounter] = 60;
    scorepopupX[scorepopupcounter] = popupX;
    scorepopupY[scorepopupcounter] = popupY;
    scorepopupcounter++;
    if (scorepopupcounter == 21)
    {
      scorepopupcounter = 1;
    }
  }
  DrawPlayField();
  if (gameover == 0)
  {
    InputFunction();
    if (paused == 0)
    {
      Falling();
      CheckForClears();
      NewPiece();
      ComboHandler();
    }
  }
}

void GameOverMainMethod()
{
  DrawPlayField();
  if (gameovertimer == 31)
  {
    stats_timeseconds[level] = levelseconds;
    stats_timeminutes[level] = levelminutes;
    stats_blocks[level] = levelblocks;
    stats_bpm[level] = levelbpm;
    stats_maxcombo[level] = maxcombo;
    if (combos != 0)
    {
      stats_avgcombo[level] = 10 * combocounter / combos;
    }
    stats_score[level] = score - scoretolastlevel;
  }
  if (gameovertimer > 0)
  {
    gameovertimer--;
  }
  else
  {
    if (keyPressed)
    {
      mode = 3;
      gameovertimer = 31;
    }
  }
  if (saved == 0)
  {
    saved = 1;
    /*highscore = max(highscore,score);
    highscorestr[0] = str(highscore);
    saveStrings("highscore.txt",highscorestr); */ //DISABLED IN OPENPROCESSING MODE
  }
}

void StatsScreenMethod()
{
  StatsScreen();
  if (gameovertimer > 0)
  {
    gameovertimer--;
  }
  else
  {
    if (keyPressed)
    {
      mode = 1;
      for (int i = 3; i <= 12; i++)
      {
        for (int j = 3; j <= 22; j++)
        {
          colorgrid[i][j] = 0;
        }
      }
      for (int i = 0; i <= 30; i++)
      {
        stats_score[i] = 0;
        stats_bonus[i] = 0;
        stats_timeseconds[i] = 0;
        stats_timeminutes[i] = 0;
        stats_blocks[i] = 0;
        stats_bpm[i] = 0;
        stats_maxcombo[i] = 0;
        stats_combos[i] = 0;
        stats_lines[i] = 0;
        stats_avgcombo[i] = 0;
      }
      combocounter = 0;
      maxcombo = 0;
      scoretolastlevel = 0;
      levelframes = 0;
      levelblocks = -1;
      levelupypos = 53;
      gameover = 0;
      goal = 5;
      lines = 0;
      level = 1;
      score = 0;
      paused = 0;
      nextpieceID = int(random(1,7.999999999));
      piecedropped = 1;
      speed = 30;
      heldpieceID = 0;
      dropmessage = "";
      saved = 0;
      paused = 1;
      totalcombos = 0;
      totalcombocounter = 0;
    }
  }
}

void StatsScreen()
{
  background(255);
  bonus = 0;
  levelblocks = 0;
  levelminutes = 0;
  levelseconds = 0;
  text("Lvl",1,11);
  text("Pts",26,11);
  text("Bns",61,11);
  text("Blks",96,11);
  text("Time",121,11);
  text("BPM",156,11);
  text("MxCb",181,11);
  text("AvCb",211,11);
  yscounter = 23;
  for (int i = 1; i <= level; i++)
  {
    text(i,1,yscounter);
    text(stats_score[i],26,yscounter);
    text(stats_bonus[i],61,yscounter);
    bonus += stats_bonus[i];
    text(stats_blocks[i],96,yscounter);
    levelblocks += stats_blocks[i];
    if (stats_timeseconds[i] <= 9)
    {
      text(stats_timeminutes[i]+":0"+stats_timeseconds[i],121,yscounter);
    }
    else
    {
      text(stats_timeminutes[i]+":"+stats_timeseconds[i],121,yscounter);
    }
    levelminutes += stats_timeminutes[i];
    levelseconds += stats_timeseconds[i];
    text(stats_bpm[i],156,yscounter);
    text(stats_maxcombo[i],181,yscounter);
    text((stats_avgcombo[i] / 10) + "." + (stats_avgcombo[i] % 10),211,yscounter);
    yscounter += 12;
  }
  text("TOT",1,yscounter);
  text(score,26,yscounter);
  text(bonus,61,yscounter);
  text(levelblocks,96,yscounter);
  levelminutes += (levelseconds / 60);
  levelseconds = levelseconds % 60;
  if (levelseconds <= 9)
  {
    text(levelminutes + ":0" + levelseconds,121,yscounter);
  }
  else
  {
    text(levelminutes + ":" + levelseconds,121,yscounter);
  }
  text((60 * levelblocks) / ((60 * levelminutes) + levelseconds),156,yscounter);
  text(max(stats_maxcombo),181,yscounter);
  tempframes = 10 * totalcombocounter / totalcombos;
  text((tempframes / 10) + "." + (tempframes % 10),211,yscounter);
}

void DrawPlayField()
{
  if (combo < 5)
  {
    background(bgB,bgB,255);
    bgB+=4;
    if (bgB > 255)
    {
      bgB = 255;
    }
  }
  else
  {
    if (combosecondsleft == -1)
    {
      bgR = 115 + (2 * (70 - comboframesleft));
    }
    background(255,bgR,bgR);
    bgR+=2;
    if (combosecondsleft != 0 && bgR > 115)
    {
      bgR = 115;
    }
  }
    
  stroke(0);
  fill(0);
  rect(0,0,20,440);
  rect(0,0,240,20);
  rect(221,0,240,440);
  rect(0,421,240,440);
  if (paused == 0)
  {
    if (piecedropped == 0)
    {
      DrawGhostPiece();
    }
    stroke(0);
    for(int i = 3; i <= 12; i++)
    {
      for(int j = 3; j <= 22; j++)
      {
        if (colorgrid[i][j] != 0)
        {
          fill(colors[colorgrid[i][j]]);
          rect((i * 20) - 39,(j * 20) - 39,(i * 20) - 20,(j * 20) - 20);
        }
      }
    }
    for (int i = 1; i <= 4; i++)
    {
      fill(colors[fallingpieceID]);
      rect((fallingpieceX[i] * 20) - 39,(fallingpieceY[i] * 20) - 39,(fallingpieceX[i] * 20) - 20,(fallingpieceY[i] * 20) - 20);
    }
  }
  fill(0);
  text("NEXT",243,11);
  if (paused == 0)
  {
    fill(colors[nextpieceID]);
    if (nextpieceID == 1)
    {
      rect(241,21,260,40);
      rect(261,21,280,40);
      rect(281,21,300,40);
      rect(301,21,320,40);
    }
    else if (nextpieceID == 2)
    {
      rect(241,21,260,40);
      rect(261,21,280,40);
      rect(241,41,260,60);
      rect(261,41,280,60);
    }
    else if (nextpieceID == 3)
    {
      rect(261,21,280,40);
      rect(241,41,260,60);
      rect(261,41,280,60);
      rect(281,41,300,60);
    }
    else if (nextpieceID == 4)
    {
      rect(261,21,280,40);
      rect(241,41,260,60);
      rect(261,41,280,60);
      rect(281,21,300,40);
    }
    else if (nextpieceID == 5)
    {
      rect(261,21,280,40);
      rect(241,21,260,40);
      rect(261,41,280,60);
      rect(281,41,300,60);
    }
    else if (nextpieceID == 6)
    {
      rect(281,41,300,60);
      rect(241,21,260,40);
      rect(261,21,280,40);
      rect(281,21,300,40);
    }
    else if (nextpieceID == 7)
    {
      rect(241,41,260,60);
      rect(241,21,260,40);
      rect(261,21,280,40);
      rect(281,21,300,40);
    }
  }
  fill(0);
  text("HOLD",323,11);
  if (paused == 0)
  {
    if (heldpieceID != 0)
    {
      fill(colors[heldpieceID]);
      if (heldpieceID == 1)
      {
        rect(321,21,340,40);
        rect(341,21,360,40);
        rect(361,21,380,40);
        rect(381,21,400,40);
      }
      else if (heldpieceID == 2)
      {
        rect(321,21,340,40);
        rect(341,21,360,40);
        rect(321,41,340,60);
        rect(341,41,360,60);
      }
      else if (heldpieceID == 3)
      {
        rect(341,21,360,40);
        rect(321,41,340,60);
        rect(341,41,360,60);
        rect(361,41,380,60);
      }
      else if (heldpieceID == 4)
      {
        rect(341,21,360,40);
        rect(321,41,340,60);
        rect(341,41,360,60);
        rect(361,21,380,40);
      }
      else if (heldpieceID == 5)
      {
        rect(341,21,360,40);
        rect(321,21,340,40);
        rect(341,41,360,60);
        rect(361,41,380,60);
      }
      else if (heldpieceID == 6)
      {
        rect(361,41,380,60);
        rect(321,21,340,40);
        rect(341,21,360,40);
        rect(361,21,380,40);
      }
      else if (heldpieceID == 7)
      {
        rect(321,41,340,60);
        rect(321,21,340,40);
        rect(341,21,360,40);
        rect(361,21,380,40);
      }
    }
  }
  fill(0);
  text("SCORE",243,75);
  text(score,243,87);
  text("LINES",243,99);
  text(lines,243,111);
  text("LEVEL",243,123);
  text(level,243,135);
  text("GOAL",243,147);
  text(goal,243,159);
  if (gameover == 1)
  {
    text("GAME OVER!",243,440);
  }
  text("TIME(LVL)",243,240);
  if (gameover == 0 && paused == 0)
  {
    levelframes++;
  }
  levelminutes = levelframes / 3600;
  tempframes = levelframes % 3600;
  levelseconds = tempframes / 60;
  if (levelseconds <= 9)
  {
    text(levelminutes + ":0" + levelseconds,243,252);
  }
  else
  {
    text(levelminutes + ":" + levelseconds,243,252);
  }
  text("BLOCKS(LVL)",243,264);
  text(levelblocks,243,276);
  if (levelframes > 60)
  {
    levelbpm = (60 * levelblocks) / ((60 * levelminutes) + levelseconds);
    text("BPM(LVL)",243,288);
    text(levelbpm,243,300);
  }
  if (bonusmessagetimer > 0 && paused == 0)
  {
    bonusmessagetimer--;
    text(bonusmessage,243,410);
  }
  text(dropmessage,243,324);
  //text("HIGH",243,380); //DISABLED IN OPENPROCESSING MODE
  //text(highscore,243,392); //DISABLED IN OPENPROCESSING MODE
  fill(0,100,0);
  for (int i = 1; i <= 20; i++)
  {
    if (scorepopuptimer[i] > 0)
    {
      //if (altframe)
      //{
        scorepopuptimer[i]--;
        scorepopupY[i]--;
      //}
      text(scorepopupvalue[i],scorepopupX[i],scorepopupY[i]);
    }
  }
  if (levelupypos < 53 && altframe)
  {
    levelupypos++;
  }
  textFont(font,24);
  text("LEVEL UP!!!",60,yvalues[levelupypos]);
  fill(255,255,0);
  text(combomessage,30,46);
  textFont(font,12);
  fill(0);
}

void DrawGhostPiece()
{
  ok = 1;
  ghostcounter = 0;
  while (ok == 1)
  {
    for (int i = 1; i <= 4; i++)
    {
      if (colorgrid[fallingpieceX[i]][fallingpieceY[i]+ghostcounter+1] != 0)
      {
        ok = 0;
      }
    }
    if (ok == 1)
    {
      ghostcounter++;
    }
  }
  stroke(127);
  for (int i = 1; i <= 4; i++)
  {
    fill(red(colors[fallingpieceID]),green(colors[fallingpieceID]),blue(colors[fallingpieceID]),63);
    rect((fallingpieceX[i] * 20) - 39,(fallingpieceY[i] * 20) - 39 + (20 * ghostcounter),(fallingpieceX[i] * 20) - 20,(fallingpieceY[i] * 20) - 20 + (20 * ghostcounter));
  }
}

/*
void InputFunction()
{
  if (!keyPressed)
  {
    for (int i = 1; i <= 9; i++)
    {
      keyspressed[i] = 0;
    }
  }
  if (keyPressed && paused == 0)
  {
    if (key != '1')
    {
      keyspressed[1] = 0;
    }
    if (key == '1')
    {
      if (keyspressed[1] == 0)
      {
        keyspressed[1] = 1;
        keytimer[1] = 4;
        if (PieceCanMove("left"))
        {
          droptick = 8;
          for (int i = 1; i <= 4; i++)
          {
            fallingpieceX[i]--;
          }
        }
      }
      if (keyspressed[1] == 1 && keytimer[1] <= 0)
      {
        if (PieceCanMove("left"))
        {
          droptick = 8;
          for (int i = 1; i <= 4; i++)
          {
            fallingpieceX[i]--;
          }
        }
      }
      else
      {
        keytimer[1]--;
      }
    }
    if (key != '3')
    {
      keyspressed[2] = 0;
    }
    if (key == '3')
    {
      if (keyspressed[2] == 0)
      {
        keyspressed[2] = 1;
        keytimer[2] = 4;
        if (PieceCanMove("right"))
        {
          droptick = 8;
          for (int i = 1; i <= 4; i++)
          {
            fallingpieceX[i]++;
          }
        }
      }
      if (keyspressed[2] == 1 && keytimer[2] <= 0)
      {
        if (PieceCanMove("right"))
        {
          droptick = 8;
          for (int i = 1; i <= 4; i++)
          {
            fallingpieceX[i]++;
          }
        }
      }
      else
      {
        keytimer[2]--;
      }
    }
    if (key != '2')
    {
      keyspressed[3] = 0;
    }
    if (key == '2')
    {
      if (keyspressed[3] == 0)
      {
        keyspressed[3] = 1;
        keytimer[3] = 4;
        if (droptick == 8)
        {
          score += level;
          falltick = 1;
        }
        else
        {
          droptick = 1;
        }
      }
      if (keyspressed[3] == 1 && keytimer[3] <= 0)
      {
        if (droptick == 8)
        {
          score += level;
          falltick = 1;
        }
        else
        {
          droptick = 1;
        }
      }
      else
      {
        keytimer[3]--;
      }
    }
    if (key != '6')
    {
      keyspressed[4] = 0;
    }
    if (key == '6' && keyspressed[4] == 0)
    {
      keyspressed[4] = 1;
      RotateCW();
    }
    if (key != '5')
    {
      keyspressed[5] = 0;
    }
    if (key == '5' && keyspressed[5] == 0)
    {
      keyspressed[5] = 1;
      RotateCCW();
    }
    if (key != ' ')
    {
      keyspressed[6] = 0;
    }
    if (key == ' ' && keyspressed[6] == 0)
    {
      keyspressed[6] = 1;
      InstaDrop();
    }
    
  }
  if (keyPressed)
  {
    if (key != 'p')
    {
      keyspressed[7] = 0;
    }
    if (key == 'p' && keyspressed[7] == 0)
    {
      keyspressed[7] = 1;
      if (paused == 0)
      {
        paused = 1;
      }
      else
      {
        paused = 0;
      }
    }
  }
}*/

void keyPressed()
{
  if (key == '1')
  {
    keysdown[1] = 1;
  }
  if (key == '3')
  {
    keysdown[2] = 1;
  }
  if (key == '2')
  {
    keysdown[3] = 1;
  }
  if (key == '6')
  {
    keysdown[4] = 1;
  }
  if (key == '5')
  {
    keysdown[5] = 1;
  }
  if (key == ' ')
  {
    keysdown[6] = 1;
  }
  if (key == 'p')
  {
    keysdown[7] = 1;
  }
  if (key == '4')
  {
    keysdown[8] = 1;
  }
}

void keyReleased()
{
  if (key == '1')
  {
    keysdown[1] = 0;
  }
  if (key == '3')
  {
    keysdown[2] = 0;
  }
  if (key == '2')
  {
    keysdown[3] = 0;
  }
  if (key == '6')
  {
    keysdown[4] = 0;
  }
  if (key == '5')
  {
    keysdown[5] = 0;
  }
  if (key == ' ')
  {
    keysdown[6] = 0;
  }
  if (key == 'p')
  {
    keysdown[7] = 0;
  }
  if (key == '4')
  {
    keysdown[8] = 0;
  }
}

void InputFunction()
{
  if (!keyPressed)
  {
    for (int i = 1; i <= 9; i++)
    {
      keyspressed[i] = 0;
    }
  }
  if (keyPressed && paused == 0)
  {
    if (keysdown[1] == 0)
    {
      keyspressed[1] = 0;
    }
    if (keysdown[1] == 1)
    {
      if (keyspressed[1] == 0)
      {
        keyspressed[1] = 1;
        keytimer[1] = 8;
        if (PieceCanMove("left"))
        {
          droptick = 8;
          for (int i = 1; i <= 4; i++)
          {
            fallingpieceX[i]--;
          }
        }
      }
      if (keyspressed[1] == 1 && keytimer[1] <= 0)
      {
        if (PieceCanMove("left"))
        {
          droptick = 8;
          for (int i = 1; i <= 4; i++)
          {
            fallingpieceX[i]--;
          }
        }
      }
      else
      {
        keytimer[1]--;
      }
    }
    if (keysdown[2] == 0)
    {
      keyspressed[2] = 0;
    }
    if (keysdown[2] == 1)
    {
      if (keyspressed[2] == 0)
      {
        keyspressed[2] = 1;
        keytimer[2] = 8;
        if (PieceCanMove("right"))
        {
          droptick = 8;
          for (int i = 1; i <= 4; i++)
          {
            fallingpieceX[i]++;
          }
        }
      }
      if (keyspressed[2] == 1 && keytimer[2] <= 0)
      {
        if (PieceCanMove("right"))
        {
          droptick = 8;
          for (int i = 1; i <= 4; i++)
          {
            fallingpieceX[i]++;
          }
        }
      }
      else
      {
        keytimer[2]--;
      }
    }
    if (keysdown[3] == 0)
    {
      keyspressed[3] = 0;
    }
    if (keysdown[3] == 1)
    {
      if (keyspressed[3] == 0)
      {
        keyspressed[3] = 1;
        keytimer[3] = 8;
        if (droptick == 8)
        {
          score += level;
          falltick = 1;
        }
        else
        {
          droptick = 1;
        }
      }
      if (keyspressed[3] == 1 && keytimer[3] <= 0)
      {
        if (droptick == 8)
        {
          score += level;
          falltick = 1;
        }
        else
        {
          droptick = 1;
        }
      }
      else
      {
        keytimer[3]--;
      }
    }
    if (keysdown[4] == 0)
    {
      keyspressed[4] = 0;
    }
    if (keysdown[4] == 1 && keyspressed[4] == 0)
    {
      keyspressed[4] = 1;
      RotateCW();
    }
    if (keysdown[5] == 0)
    {
      keyspressed[5] = 0;
    }
    if (keysdown[5] == 1 && keyspressed[5] == 0)
    {
      keyspressed[5] = 1;
      RotateCCW();
    }
    if (keysdown[6] == 0)
    {
      keyspressed[6] = 0;
    }
    if (keysdown[6] == 1 && keyspressed[6] == 0)
    {
      keyspressed[6] = 1;
      InstaDrop();
    }
    if (keysdown[8] == 0)
    {
      keyspressed[8] = 0;
    }
    if (keysdown[8] == 1 && keyspressed[8] == 0)
    {
      keyspressed[8] = 1;
      HoldPiece();
    }
  }
  if (keyPressed)
  {
    if (key != 'p')
    {
      keyspressed[7] = 0;
    }
    if (key == 'p' && keyspressed[7] == 0)
    {
      keyspressed[7] = 1;
      if (paused == 0)
      {
        paused = 1;
      }
      else
      {
        paused = 0;
      }
    }
  }
}

void NewPiece()
{
  if (piecedropped == 1)
  {
    if (heldthisdrop > 0)
    {
      heldthisdrop--;
    }
    if (heldthisdrop <= 0)
    {
      levelblocks++;
    }
    piecedropped = 0;
    keytimer[3] = 8;
    for (int i = 3; i <= 12; i++)
    {
      colorgrid[i][2] = 0;
    }
    fallingpieceorientation = 1;
    falltick = speed;
    if (heldthisdrop == 0)
    {
      fallingpieceID = nextpieceID;
      nextpieceID = int(random(1,7.999999999));
    }
    if (fallingpieceID == 1)
    {
      fallingpieceX[1] = 6;
      fallingpieceY[1] = 3;
      fallingpieceX[2] = 7;
      fallingpieceY[2] = 3;
      fallingpieceX[3] = 8;
      fallingpieceY[3] = 3;
      fallingpieceX[4] = 9;
      fallingpieceY[4] = 3;
    }
    else if (fallingpieceID == 2)
    {
      fallingpieceX[1] = 7;
      fallingpieceY[1] = 3;
      fallingpieceX[2] = 8;
      fallingpieceY[2] = 3;
      fallingpieceX[3] = 7;
      fallingpieceY[3] = 4;
      fallingpieceX[4] = 8;
      fallingpieceY[4] = 4;
    }
    else if (fallingpieceID == 3)
    {
      fallingpieceX[1] = 7;
      fallingpieceY[1] = 3;
      fallingpieceX[2] = 6;
      fallingpieceY[2] = 4;
      fallingpieceX[3] = 7;
      fallingpieceY[3] = 4;
      fallingpieceX[4] = 8;
      fallingpieceY[4] = 4;
    }
    else if (fallingpieceID == 4)
    {
      fallingpieceX[1] = 7;
      fallingpieceY[1] = 3;
      fallingpieceX[2] = 8;
      fallingpieceY[2] = 3;
      fallingpieceX[3] = 6;
      fallingpieceY[3] = 4;
      fallingpieceX[4] = 7;
      fallingpieceY[4] = 4;
    }
    else if (fallingpieceID == 5)
    {
      fallingpieceX[1] = 6;
      fallingpieceY[1] = 3;
      fallingpieceX[2] = 7;
      fallingpieceY[2] = 3;
      fallingpieceX[3] = 7;
      fallingpieceY[3] = 4;
      fallingpieceX[4] = 8;
      fallingpieceY[4] = 4;
    }
    else if (fallingpieceID == 6)
    {
      fallingpieceX[1] = 6;
      fallingpieceY[1] = 3;
      fallingpieceX[2] = 7;
      fallingpieceY[2] = 3;
      fallingpieceX[3] = 8;
      fallingpieceY[3] = 3;
      fallingpieceX[4] = 8;
      fallingpieceY[4] = 4;
    }
    else if (fallingpieceID == 7)
    {
      fallingpieceX[1] = 6;
      fallingpieceY[1] = 3;
      fallingpieceX[2] = 7;
      fallingpieceY[2] = 3;
      fallingpieceX[3] = 8;
      fallingpieceY[3] = 3;
      fallingpieceX[4] = 6;
      fallingpieceY[4] = 4;
    }
  }
  for (int i = 1; i <= 4; i++)
  {
    if (colorgrid[fallingpieceX[i]][fallingpieceY[i]] != 0)
    {
      gameover = 1;
      mode = 2;
      gameovertimer = 31;
    }
  }
}

void Falling()
{
  speed = 62 - (2*level);
  if (droptick == 8)
  {
    falltick--;
    if (falltick == 0)
    {
      falltick = speed;
      ok = 1;
      for (int i = 1; i <= 4; i++)
      {
        if (colorgrid[fallingpieceX[i]][fallingpieceY[i]+1] != 0)
        {
          ok = 0;
        }
      }
      if (ok == 1)
      {
        for (int i = 1; i <= 4; i++)
        {
          fallingpieceY[i]++;
        }
      }
      else
      {
        droptick = 7;
      }
    }
  }
  else
  {
    droptick--;
    if (droptick <= 0)
    {
      for (int i = 1; i <= 4; i++)
      {
        colorgrid[fallingpieceX[i]][fallingpieceY[i]] = fallingpieceID;
      }
      popupX = (20 * fallingpieceX[1]) - 40;
      popupY = (20 * fallingpieceY[1]) - 40;
      piecedropped = 1;
      droptick = 8;
    }
  }
}

boolean PieceCanMove(String dir)
{
  if (dir == "right")
  {
    ok = 1;
    for (int i = 1; i <= 4; i++)
    {
      if (fallingpieceX[i] == 12 || colorgrid[fallingpieceX[i]+1][fallingpieceY[i]] != 0)
      {
        ok = 0;
      }
    }
  }
  else if (dir == "left")
  {
    ok = 1;
    for (int i = 1; i <= 4; i++)
    {
      if (fallingpieceX[i] == 3 || colorgrid[fallingpieceX[i]-1][fallingpieceY[i]] != 0)
      {
        ok = 0;
      }
    }
  }
  if (ok == 1)
  {
    return true;
  }
  else
  {
    return false;
  }
}

void RotateCW()
{
  if (fallingpieceID == 1) //Straight piece
  {
    if (fallingpieceorientation == 1) //Straight piece going from Horiz to Vert
    {
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]+2] == 0 && colorgrid[fallingpieceX[2]][fallingpieceY[2]+1] == 0 && colorgrid[fallingpieceX[2]][fallingpieceY[2]-1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 2;
        fallingpieceX[1]++;
        fallingpieceY[1]--;
        fallingpieceX[3]--;
        fallingpieceY[3]++;
        fallingpieceX[4]-=2;
        fallingpieceY[4]+=2;
      }
    }
    else if (fallingpieceorientation == 2) //Straight piece going from Vert to Horiz
    {
      if (colorgrid[fallingpieceX[2]-1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+2][fallingpieceY[2]] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 1;
        fallingpieceX[1]--;
        fallingpieceY[1]++;
        fallingpieceX[3]++;
        fallingpieceY[3]--;
        fallingpieceX[4]+=2;
        fallingpieceY[4]-=2;
      }
    }
  }                        
  if (fallingpieceID == 4) //            XX
  {                        //"S" piece  XX
    if (fallingpieceorientation == 1) //From ^That to the other way
    {
      if (colorgrid[fallingpieceX[1]][fallingpieceY[1]-1] == 0 && colorgrid[fallingpieceX[1]+1][fallingpieceY[1]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 2;
        fallingpieceX[3] += 2;
        fallingpieceY[4] -= 2;
      }
    }
    else if (fallingpieceorientation == 2) //From the other way to ^That
    {
      if (colorgrid[fallingpieceX[1]][fallingpieceY[1]+1] == 0 && colorgrid[fallingpieceX[1]-1][fallingpieceY[1]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 1;
        fallingpieceX[3] -= 2;
        fallingpieceY[4] += 2;
      }
    }
  }
  else if (fallingpieceID == 5) //           XX
  {                             // "Z" piece  XX
    if (fallingpieceorientation == 1) //From ^That way to the other way
    {
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]-1] == 0 && colorgrid[fallingpieceX[2]-1][fallingpieceY[2]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 2;
        fallingpieceY[3] -= 2;
        fallingpieceX[4] -= 2;
      }
    }
    else if (fallingpieceorientation == 2) //From the other way to ^That
    {
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]+1] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 1;
        fallingpieceY[3] += 2;
        fallingpieceX[4] += 2;
      }
    }
  }
  else if (fallingpieceID == 3) //T piece
  {
    if (fallingpieceorientation == 1) //pointing up
    {
      if (colorgrid[fallingpieceX[3]][fallingpieceY[3]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 2;
        fallingpieceX[1]++;
        fallingpieceY[1]++;
        fallingpieceX[2]++;
        fallingpieceY[2]--;
        fallingpieceX[4]--;
        fallingpieceY[4]++;
      }
    }
    else if (fallingpieceorientation == 2) //pointing right
    {
      if (colorgrid[fallingpieceX[3]-1][fallingpieceY[3]] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 3;
        fallingpieceX[1]--;
        fallingpieceY[1]++;
        fallingpieceX[2]++;
        fallingpieceY[2]++;
        fallingpieceX[4]--;
        fallingpieceY[4]--;
      }
    }
    else if (fallingpieceorientation == 3) //pointing down
    {
      if (colorgrid[fallingpieceX[3]][fallingpieceY[3]-1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 4;
        fallingpieceX[1]--;
        fallingpieceY[1]--;
        fallingpieceX[2]--;
        fallingpieceY[2]++;
        fallingpieceX[4]++;
        fallingpieceY[4]--;
      }
    }
    else if (fallingpieceorientation == 4) //pointing left
    {
      if (colorgrid[fallingpieceX[3]+1][fallingpieceY[3]] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 1;
        fallingpieceX[1]++;
        fallingpieceY[1]--;
        fallingpieceX[2]--;
        fallingpieceY[2]--;
        fallingpieceX[4]++;
        fallingpieceY[4]++;
      }
    }
  }
  else if (fallingpieceID == 6)      //       X  X   XX
  {                                  // XXX 2 X  XXX X 4
    if (fallingpieceorientation == 1)// 1 X  XX 3    X
    {
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]-1] == 0 && colorgrid[fallingpieceX[2]][fallingpieceY[2]+1] == 0 && colorgrid[fallingpieceX[2]-1][fallingpieceY[2]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 2;
        fallingpieceX[1]++;
        fallingpieceY[1]--;
        fallingpieceX[3]--;
        fallingpieceY[3]++;
        fallingpieceX[4] -= 2;
      }
    }
    else if (fallingpieceorientation == 2)
    {
      if (colorgrid[fallingpieceX[2]-1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]-1][fallingpieceY[2]-1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 3;
        fallingpieceX[1]++;
        fallingpieceY[1]++;
        fallingpieceX[3]--;
        fallingpieceY[3]--;
        fallingpieceY[4] -= 2;
      }
    }                                      //       X  X   XX
    else if (fallingpieceorientation == 3) // XXX 2 X  XXX X 4
    {                                      // 1 X  XX 3    X
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]+1] == 0 && colorgrid[fallingpieceX[2]][fallingpieceY[2]-1] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]-1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 4;
        fallingpieceX[1]--;
        fallingpieceY[1]++;
        fallingpieceX[3]++;
        fallingpieceY[3]--;
        fallingpieceX[4] += 2;
      }
    }
    else if (fallingpieceorientation == 4)
    {
      if (colorgrid[fallingpieceX[2]-1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 1;
        fallingpieceX[1]--;
        fallingpieceY[1]--;
        fallingpieceX[3]++;
        fallingpieceY[3]++;
        fallingpieceY[4] += 2;
      }
    }
  }
  else if (fallingpieceID == 7)       //1    XX 3  X  X 4
  {                                   // XXX  X  XXX  X
    if (fallingpieceorientation == 1) // X  2 X       XX
    {
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]-1] == 0 && colorgrid[fallingpieceX[2]][fallingpieceY[2]+1] == 0 && colorgrid[fallingpieceX[2]-1][fallingpieceY[2]-1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 2;
        fallingpieceX[1]++;
        fallingpieceY[1]--;
        fallingpieceX[3]--;
        fallingpieceY[3]++;
        fallingpieceY[4] -= 2;
      }
    }
    else if (fallingpieceorientation == 2)
    {
      if (colorgrid[fallingpieceX[2]-1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]-1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 3;
        fallingpieceX[1]++;
        fallingpieceY[1]++;
        fallingpieceX[3]--;
        fallingpieceY[3]--;
        fallingpieceX[4] += 2;
      }
    }                                      //1    XX 3  X  X 4
    else if (fallingpieceorientation == 3) // XXX  X  XXX  X
    {                                      // X  2 X       XX
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]-1] == 0 && colorgrid[fallingpieceX[2]][fallingpieceY[2]+1] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 4;
        fallingpieceX[1]--;
        fallingpieceY[1]++;
        fallingpieceX[3]++;
        fallingpieceY[3]--;
        fallingpieceY[4] += 2;
      }
    }
    else if (fallingpieceorientation == 4)
    {
      if (colorgrid[fallingpieceX[2]+1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]-1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]-1][fallingpieceY[2]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 1;
        fallingpieceX[1]--;
        fallingpieceY[1]--;
        fallingpieceX[3]++;
        fallingpieceY[3]++;
        fallingpieceX[4] -= 2;
      }
    }
  }
}

void RotateCCW()
{
  if (fallingpieceID == 1) //Straight piece
  {
    if (fallingpieceorientation == 1) //Straight piece going from Horiz to Vert
    {
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]+2] == 0 && colorgrid[fallingpieceX[2]][fallingpieceY[2]+1] == 0 && colorgrid[fallingpieceX[2]][fallingpieceY[2]-1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 2;
        fallingpieceX[1]++;
        fallingpieceY[1]--;
        fallingpieceX[3]--;
        fallingpieceY[3]++;
        fallingpieceX[4]-=2;
        fallingpieceY[4]+=2;
      }
    }
    else if (fallingpieceorientation == 2) //Straight piece going from Vert to Horiz
    {
      if (colorgrid[fallingpieceX[2]-1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+2][fallingpieceY[2]] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 1;
        fallingpieceX[1]--;
        fallingpieceY[1]++;
        fallingpieceX[3]++;
        fallingpieceY[3]--;
        fallingpieceX[4]+=2;
        fallingpieceY[4]-=2;
      }
    }
  }
  if (fallingpieceID == 4) //            XX
  {                        //"S" piece  XX
    if (fallingpieceorientation == 1) //From ^That to the other way
    {
      if (colorgrid[fallingpieceX[1]][fallingpieceY[1]-1] == 0 && colorgrid[fallingpieceX[1]+1][fallingpieceY[1]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 2;
        fallingpieceX[3] += 2;
        fallingpieceY[4] -= 2;
      }
    }
    else if (fallingpieceorientation == 2) //From the other way to ^That
    {
      if (colorgrid[fallingpieceX[1]][fallingpieceY[1]+1] == 0 && colorgrid[fallingpieceX[1]-1][fallingpieceY[1]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 1;
        fallingpieceX[3] -= 2;
        fallingpieceY[4] += 2;
      }
    }
  }
  else if (fallingpieceID == 5) //           XX
  {                             // "Z" piece  XX
    if (fallingpieceorientation == 1) //From ^That way to the other way
    {
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]-1] == 0 && colorgrid[fallingpieceX[2]-1][fallingpieceY[2]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 2;
        fallingpieceY[3] -= 2;
        fallingpieceX[4] -= 2;
      }
    }
    else if (fallingpieceorientation == 2) //From the other way to ^That
    {
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]+1] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 1;
        fallingpieceY[3] += 2;
        fallingpieceX[4] += 2;
      }
    }
  }
  else if (fallingpieceID == 3) //T piece
  {
    if (fallingpieceorientation == 1) //pointing up
    {
      if (colorgrid[fallingpieceX[3]][fallingpieceY[3]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 4;
        fallingpieceX[1]--;
        fallingpieceY[1]++;
        fallingpieceX[2]++;
        fallingpieceY[2]++;
        fallingpieceX[4]--;
        fallingpieceY[4]--;
      }
    }
    else if (fallingpieceorientation == 2) //pointing right
    {
      if (colorgrid[fallingpieceX[3]-1][fallingpieceY[3]] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 1;
        fallingpieceX[1]--;
        fallingpieceY[1]--;
        fallingpieceX[2]--;
        fallingpieceY[2]++;
        fallingpieceX[4]++;
        fallingpieceY[4]--;
      }
    }
    else if (fallingpieceorientation == 3) //pointing down
    {
      if (colorgrid[fallingpieceX[3]][fallingpieceY[3]-1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 2;
        fallingpieceX[1]++;
        fallingpieceY[1]--;
        fallingpieceX[2]--;
        fallingpieceY[2]--;
        fallingpieceX[4]++;
        fallingpieceY[4]++;
      }
    }
    else if (fallingpieceorientation == 4) //pointing left
    {
      if (colorgrid[fallingpieceX[3]+1][fallingpieceY[3]] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 3;
        fallingpieceX[1]++;
        fallingpieceY[1]++;
        fallingpieceX[2]++;
        fallingpieceY[2]--;
        fallingpieceX[4]--;
        fallingpieceY[4]++;
      }
    }
  }
  else if (fallingpieceID == 6)      //       X  X   XX
  {                                  // XXX 2 X  XXX X 4
    if (fallingpieceorientation == 1)// 1 X  XX 3    X
    {
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]-1] == 0 && colorgrid[fallingpieceX[2]][fallingpieceY[2]+1] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]-1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 4;
        fallingpieceX[1]++;
        fallingpieceY[1]++;
        fallingpieceX[3]--;
        fallingpieceY[3]--;
        fallingpieceY[4] -= 2;
      }
    }
    else if (fallingpieceorientation == 2)
    {
      if (colorgrid[fallingpieceX[2]-1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 1;
        fallingpieceX[1]--;
        fallingpieceY[1]++;
        fallingpieceX[3]++;
        fallingpieceY[3]--;
        fallingpieceX[4] += 2;
      }
    }                                      //       X  X   XX
    else if (fallingpieceorientation == 3) // XXX 2 X  XXX X 4
    {                                      // 1 X  XX 3    X
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]+1] == 0 && colorgrid[fallingpieceX[2]][fallingpieceY[2]-1] == 0 && colorgrid[fallingpieceX[2]-1][fallingpieceY[2]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 2;
        fallingpieceX[1]--;
        fallingpieceY[1]--;
        fallingpieceX[3]++;
        fallingpieceY[3]++;
        fallingpieceY[4] += 2;
      }
    }
    else if (fallingpieceorientation == 4)
    {
      if (colorgrid[fallingpieceX[2]-1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]-1][fallingpieceY[2]-1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 3;
        fallingpieceX[1]++;
        fallingpieceY[1]--;
        fallingpieceX[3]--;
        fallingpieceY[3]++;
        fallingpieceX[4] -= 2;
      }
    }
  }
  else if (fallingpieceID == 7)       //1    XX 3  X  X 4
  {                                   // XXX  X  XXX  X
    if (fallingpieceorientation == 1) // X  2 X       XX
    {
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]-1] == 0 && colorgrid[fallingpieceX[2]][fallingpieceY[2]+1] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 4;
        fallingpieceX[1]++;
        fallingpieceY[1]++;
        fallingpieceX[3]--;
        fallingpieceY[3]--;
        fallingpieceX[4] += 2;
      }
    }
    else if (fallingpieceorientation == 2)
    {
      if (colorgrid[fallingpieceX[2]-1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]-1][fallingpieceY[2]+1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 1;
        fallingpieceX[1]--;
        fallingpieceY[1]++;
        fallingpieceX[3]++;
        fallingpieceY[3]--;
        fallingpieceY[4] += 2;
      }
    }                                      //1    XX 3  X  X 4
    else if (fallingpieceorientation == 3) // XXX  X  XXX  X
    {                                      // X  2 X       XX
      if (colorgrid[fallingpieceX[2]][fallingpieceY[2]-1] == 0 && colorgrid[fallingpieceX[2]][fallingpieceY[2]+1] == 0 && colorgrid[fallingpieceX[2]-1][fallingpieceY[2]-1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 2;
        fallingpieceX[1]--;
        fallingpieceY[1]--;
        fallingpieceX[3]++;
        fallingpieceY[3]++;
        fallingpieceX[4] -= 2;
      }
    }
    else if (fallingpieceorientation == 4)
    {
      if (colorgrid[fallingpieceX[2]+1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]-1][fallingpieceY[2]] == 0 && colorgrid[fallingpieceX[2]+1][fallingpieceY[2]-1] == 0)
      {
        droptick = 8;
        fallingpieceorientation = 3;
        fallingpieceX[1]++;
        fallingpieceY[1]--;
        fallingpieceX[3]--;
        fallingpieceY[3]++;
        fallingpieceY[4] -= 2;
      }
    }
  }
}

void InstaDrop()
{
  dropped = 0;
  droppoints = 0;
  while (dropped == 0)
  {
    for (int i = 1; i <= 4; i++)
    {
      if (colorgrid[fallingpieceX[i]][fallingpieceY[i]+1] != 0)
      {
        dropped = 1;
      }
    }
    if (dropped == 0)
    {
      score += level;
      droppoints += level;
      for (int i = 1; i <= 4; i++)
      {
        fallingpieceY[i]++;
      }
    }
  }
  droptick = 1;
  dropmessage = "DROP: " + droppoints;
  scorepopupvalue[scorepopupcounter] = droppoints + "";
  popped = 1;
}

void CheckForClears()
{
  linesinclear = 0;
  for (int i = 3; i <= 22; i++)
  {
    if (colorgrid[3][i] != 0 && colorgrid[4][i] != 0 && colorgrid[5][i] != 0 && colorgrid[6][i] != 0 && colorgrid[7][i] != 0 && colorgrid[8][i] != 0 && colorgrid[9][i] != 0 && colorgrid[10][i] != 0 && colorgrid[11][i] != 0 && colorgrid[12][i] != 0)
    {
      linesinclear++;
      lines++;
      for (int j = 3; j <= 12; j++)
      {
        colorgrid[j][i] = 0;
      }
      for (int k = i - 1; k >= 2; k--)
      {
        for (int m = 3; m <= 12; m++)
        {
          colorgrid[m][k+1] = colorgrid[m][k];
        }
      }
    }
  }
  switch(linesinclear)
  {
    case 1:
      score += int(50.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      dropmessage = dropmessage + "\nCLEAR: " + int(50.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      scorepopupvalue[scorepopupcounter] += "+" + int(50.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      popped = 1;
      break;
    case 2:
      score += int(120.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      dropmessage = dropmessage + "\nCLEAR: " + int(120.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      scorepopupvalue[scorepopupcounter] += "+" + int(120.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      popped = 1;
      break;
    case 3:
      score += int(300.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      dropmessage = dropmessage + "\nCLEAR: " + int(300.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      scorepopupvalue[scorepopupcounter] += "+" + int(300.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      popped = 1;
      break;
    case 4:
      score += int(800.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      dropmessage = dropmessage + "\nCLEAR: " + int(800.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      scorepopupvalue[scorepopupcounter] += "+" + int(800.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      popped = 1;
  }
  goal -= linesinclear;
  stats_lines[level] += linesinclear;
  if (goal <= 0 && level != 30)
  {
    if (level != 30)
    {
      level++;
    }
    stats_timeseconds[level-1] = levelseconds;
    stats_timeminutes[level-1] = levelminutes;
    stats_blocks[level-1] = levelblocks;
    stats_bpm[level-1] = levelbpm;
    stats_maxcombo[level-1] = maxcombo;
    stats_avgcombo[level-1] = 10 * combocounter / combos;
    maxcombo = 0;
    levelupypos = 1;
    levelblocks = 0;
    levelframes = 0;
    stats_score[level-1] = score - scoretolastlevel;
    bonus = int(.1 * pow(levelbpm,2) * pow(level-1,2));
    stats_bonus[level-1] = bonus;
    score += bonus;
    scoretolastlevel = score;
    bonusmessagetimer = 600;
    bonusmessage = "BPM: " + levelbpm + "\nBONUS: " + bonus;
    scorepopupvalue[scorepopupcounter] += "+" + bonus;
    if (level != 30)
    {
      goal = 5 * level;
    }
  }
  if (linesinclear != 0)
  {
    bgR = 3;
    combo++;
    maxcombo = max(maxcombo,combo);
    combocounter++;
    totalcombocounter++;
    if (combo == 1)
    {
      stats_combos[level]++;
      totalcombos++;
      combos++;
    }
  }
  combosecondsleft += linesinclear;
}

void ComboHandler()
{
  if (comboframesleft == 0 && combo > 0)
  {
    combosecondsleft--;
    comboframesleft = 70;
  }
  if (comboframesleft > 0 && combo > 0)
  {
    comboframesleft--;
  }
  if (comboframesleft == 0 && combosecondsleft == -1)
  {
    if (combo >= 5)
    {
      bgB = 95;
      combomessage = "C-C-C-COMBO\nBREAKER!";
    }
    combo = 0;
    combosecondsleft = 0;
  }
  switch(combo)
  {
    case 0:
      break;
    case 1:
    case 2:
    case 3:
    case 4:
      combomessage = "";
      break;
    case 5:
    case 6:
    case 7:
      combomessage = "HOT COMBO!";
      break;
    case 8:
    case 9:
    case 10:
      combomessage = "IMPRESSIVE!!";
      break;
    case 11:
    case 12:
    case 13:
      combomessage = "PERFECT!!!";
      break;
    case 14:
    case 15:
    case 16:
      combomessage = "INSANE!!!!";
      break;
    case 17:
    case 18:
    case 19:
      combomessage = "UNBELIEVEABLE!!!!!";
      break;
    default:
      combomessage = "> 9000 DEGREES!!!!!";
  }
  color arccolor;
  switch (combosecondsleft)
  {
    case -1:
      arccolor = color(255,0,0);
      break;
    case 0:
      arccolor = color(255,165,0);
      break;
    default:
      arccolor = color(0,0,255);
  }
  
  stroke(arccolor);
  strokeWeight(2);
  fill(255);
  arc(263,200,30,30,0,(36/7*comboframesleft*PI/180));
  fill(0);
  text("COMBO",243,181);
  if (combo != 0)
  {
    text(combosecondsleft+1,261,205);
  }
  textFont(font,24);
  if (combo <= 4)
  {
    fill(min(50*combo,255),0,max(0,255-(50*combo)));
  }
  else
  {
    fill(255,255,0);
  }
  text(combo,291,205);
  textFont(font,12);
  strokeWeight(1);
}

float FloatIt(int var)
{
  return var;
}

float FloatIt(float var)
{
  return var;
}

void HoldPiece()
{
  if (heldthisdrop <= 0)
  {
    heldthisdrop = 2;
    piecedropped = 1;
    if (heldpieceID == 0)
    {
      heldpieceID = fallingpieceID;
      fallingpieceID = nextpieceID;
      nextpieceID = int(random(1,7.999999999));
    }
    else
    {
      temp = heldpieceID;
      heldpieceID = fallingpieceID;
      fallingpieceID = temp;
    }
  }
}

void stop()
{
  if (mode != 1)
  {
    exit();
  }
}

