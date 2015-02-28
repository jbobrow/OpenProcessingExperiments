
/*
There used to be a whole bunch of notes up here pertaining to what I planned to do and what I had already done. However, for the online version, I've decided to remove the notes to keep them private.
Instead, have some technical details on how this program works!

This Tetris clone was made to conform to as many parts of the Tetris Guideline as possible. Below is a copy/paste of the guideline as it appeared on the Tetris Wiki, and whether or not I conform to each part:

Playfield is 10 cells wide and at least 22 cells tall, where rows above 20 are hidden or obstructed by the field frame
--The playfield is 10 by 20, and pieces spawn in the top two rows. This is only a minor change.
Tetromino colors
Cyan I
Yellow O
Purple T
Green S
Red Z
Blue J
Orange L
--Matched exactly.
Tetromino start locations
The I and O spawn in the middle columns
The rest spawn in the left-middle columns
The tetrominoes spawn horizontally and with their flat side pointed down.
--Matched exactly.
Super Rotation System (SRS) specifies tetromino rotation
--It took a lot of research and coding, but as far as I can tell, this is matched exactly. I pretty much called the test run a success when I was able to make a T-spin triple.
So-called Random Generator (also called "random bag" or "7 system")
--Nope! Frankly, I dislike this; combine this with the low speed progression of this clone and it becomes FAR too easy. (The next queue required to pull off the "play forever" tactic is absent as of now...but that's changing.)
--However, soon, I also plan to allow for a cornucopia of randomization methods, including the 7-bag system.
"Hold piece": (Long explanation of it...)
--Yup. Hold is here.
Game must have ghost piece function.
--Yup. You can see the ghost piece.
Designated soft drop speed. Details vary between guideline versions.
--Soft drop speed is 1G. (Framerate is 60) Soft drop is also put on the DAS system; you must hold the move down key for 8 frames before soft-dropping at 1G speed.
Player may only level up by clearing lines or performing T-Spin. Required lines depends in the game.
--Mostly matched. You must clear lines to level up, but the game doesn't recognize T-spins.
The player tops out when a piece is spawned overlapping at least one block, or a piece locks completely above the visible portion of the playfield.
--Sort of. The "block out" (game over when spawned piece overlaps an already-existing one) condition is here, but the "lock out" is not.
--Also worth noting: any minoes above the bounding box will be removed immediately upon landing. This is done even before clearing lines, so a part of a piece above the field will cease to exist before it can drop back into the field.

*/

/*
Piece IDs (
1  2    3    4    5     6  7
X  XX   X    XX  XX   XXX  XXX
X  XX  XXX  XX    XX    X  X
X
X
*/

/*

SRS SYSTEM!

PIECE ORIENTATIONS:

SPAWN
  0     1     2     3  fallingpieceorientation
  0     R     2     L  Title
  
34567 34567 34567 34567
XXXXX XXXXX XXXXX XX2XX
XXXXX XX3XX XXXXX XX1XX ID 1
X3012 XX0XX 2103X XX0XX
XXXXX XX1XX XXXXX XX3XX
XXXXX XX2XX XXXXX XXXXX

 2XX   X12   XXX   X3X  ID 6
 103   X0X   301   X0X
 XXX   X3X   XX2   21X

 XX2   X3X   XXX   21X  ID 7
 301   X0X   103   X0X
 XXX   X12   2XX   X3X

 X12   X3X   XXX   2XX  ID 4
 30X   X01   X03   10X
 XXX   XX2   21X   X3X

 21X   XX2   XXX   X3X  ID 5
 X03   X01   30X   10X
 XXX   X3X   X12   2XX

 X1X   X2X   XXX   X3X  ID 3
 203   X01   302   10X
 XXX   X3X   X1X   X2X

  01    01    01    01  ID 2
  23    23    23    23
  
  
           2,-1 
X4XXX      1, 2
XXXX1     -2, 1
XX0XX     -1,-2
3XXXX
XXX2X

ROTATION AND EFFECT ON BRICK OFFSET:

To find X in rotation state...
  0: Use OffsetX.
  1: Use negative OffsetY.
  2: Use negative OffsetX.
  3: Use OffsetY.
To find Y in rotation state...
  0: Use OffsetY.
  1: Use OffsetX.
  2: Use negative OffsetY.
  3: Use negative OffsetX.

WALL (and floor) KICKS:

For each piece, there is an array of five offsets that will attempt to be applied to the piece after rotation.

On rotation:
i = 1
Check the new position of the piece in the matrix using offset i. (Loop start)
  START ERROR CATCHING
  Does it overlap with any existing blocks?
    If so, i++.
    Else, end loop and put the piece there.
  STOP ERROR CATCHING
  If error was caught: Do nothing. (Assumption: The error was an IndexOutOfBounds exception caused by trying to reference a cell waaaay outside the matrix. This will always be a bad rotation attempt, so just move on.)
  Is i = 6?
    If so, the rotation fails and doesn't happen.
    Else, start loop over.
    
USING THE OFFSETS:
The offsets are relative to adjacent offsets. In the method above, "offset i" is computed as follows: Take the offset for the orientation the piece is coming FROM, and subtract the offset for the orientation the piece is going TO.
For example, the "offset i" values for an I piece going from orientation R to orientation 2 are ( 0,+1) (-1,+1) (+2,+1) (-1,-1) (+2,+2)


OFFSET MATRIX FOR J, L, S, Z, T PIECES: (Y has been sign-changed to compensate for the inverted y-axis in this version)
0	( 0, 0)	( 0, 0)	( 0, 0)	( 0, 0)	( 0, 0)
R	( 0, 0)	(+1, 0)	(+1,+1)	( 0,-2)	(+1,-2)
2	( 0, 0)	( 0, 0)	( 0, 0)	( 0, 0)	( 0, 0)
L	( 0, 0)	(-1, 0)	(-1,+1)	( 0,-2)	(-1,-2)

OFFSET MATRIX FOR I PIECE: (Y has been sign-changed to compensate for the inverted y-axis in this version)
0	( 0, 0)	(-1, 0)	(+2, 0)	(-1, 0)	(+2, 0)
R	(-1, 0)	( 0, 0)	( 0, 0)	( 0,-1)	( 0,+2)
2	(-1,-1)	(+1,-1)	(-2,-1)	(+1, 0)	(-2, 0)
L	( 0,-1)	( 0,-1)	( 0,-1)	( 0,+1)	( 0,-2)

The O piece does not need an offset matrix. Simply don't move it when it is told to rotate it. (Still reset the droptick; do this before anything!)

*/

int[][] colorgrid = new int[15][25]; //[3-12][3-22] is the actual grid
String[] scorepopupvalue = new String[21];
int[][] mainOffsetX = new int[4][6]; //[index1] is the linked rotation state, [index2] is the attempt
int[][] mainOffsetY = new int[4][6];
int[][] IOffsetX = new int[4][6];
int[][] IOffsetY = new int[4][6];
int[][] brickOffsetX = new int[8][5]; //[index1] is the pieceID, [index2] is the brick in question from 1 to 3 (Defines where bricks are in relation to the central brick for each piece)
int[][] brickOffsetY = new int[8][5]; //Offsets are with respect to rotation state 0. They can be signchanged and/or swapped for other rotations.
int[] scorepopupX = new int[21];
int[] scorepopupY = new int[21];
int[] scorepopuptimer = new int[21];
int[] keyspressed = new int[10];
int[] keysdown = new int[10];
int[] keytimer = new int[10];
int[] fallingpieceX = new int[6];
int[] fallingpieceY = new int[6];
int[] destinationX = new int[6];
int[] destinationY = new int[6];
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
int stats_droppoints = 0;
int stats_linepoints = 0;
int stats_combopoints = 0;
int stats_bonuspoints = 0;
int bgB = 255;
int bgR = 0;
int popped = 0;
int popupX = 0;
int popupY = 0;
int scorepopupcounter = 1;
//int highscore = 0; Disabled in online applet
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
int droptick = 31;
int ok = 0;
int destinationorientation = 0;
int rotationvalid = 0;
int offsetX = 0;
int offsetY = 0;
boolean altframe = false;
//String highscorestr[] = new String[1]; Disabled in online applet
String combomessage = "";
String bonusmessage = "";
String dropmessage = "";
PFont font;
color[] colors = new color[10];

void setup()
{
  //highscorestr = loadStrings("highscore.txt"); Disabled in online applet
  //highscore = int(highscorestr[0]); Disabled in online applet
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
  
  IOffsetX[0][1] = 0;
  IOffsetY[0][1] = 0;
  IOffsetX[0][2] = -1;
  IOffsetY[0][2] = 0;
  IOffsetX[0][3] = 2;
  IOffsetY[0][3] = 0;
  IOffsetX[0][4] = -1;
  IOffsetY[0][4] = 0;
  IOffsetX[0][5] = 2;
  IOffsetY[0][5] = 0;
  IOffsetX[1][1] = -1;
  IOffsetY[1][1] = 0;
  IOffsetX[1][2] = 0;
  IOffsetY[1][2] = 0;
  IOffsetX[1][3] = 0;
  IOffsetY[1][3] = 0;
  IOffsetX[1][4] = 0;
  IOffsetY[1][4] = -1;
  IOffsetX[1][5] = 0;
  IOffsetY[1][5] = 2;
  IOffsetX[2][1] = -1;
  IOffsetY[2][1] = -1;
  IOffsetX[2][2] = 1;
  IOffsetY[2][2] = -1;
  IOffsetX[2][3] = -2;
  IOffsetY[2][3] = -1;
  IOffsetX[2][4] = 1;
  IOffsetY[2][4] = 0;
  IOffsetX[2][5] = -2;
  IOffsetY[2][5] = 0;
  IOffsetX[3][1] = 0;
  IOffsetY[3][1] = -1;
  IOffsetX[3][2] = 0;
  IOffsetY[3][2] = -1;
  IOffsetX[3][3] = 0;
  IOffsetY[3][3] = -1;
  IOffsetX[3][4] = 0;
  IOffsetY[3][4] = 1;
  IOffsetX[3][5] = 0;
  IOffsetY[3][5] = -2;
  
  mainOffsetX[0][1] = 0;
  mainOffsetY[0][1] = 0;
  mainOffsetX[0][2] = 0;
  mainOffsetY[0][2] = 0;
  mainOffsetX[0][3] = 0;
  mainOffsetY[0][3] = 0;
  mainOffsetX[0][4] = 0;
  mainOffsetY[0][4] = 0;
  mainOffsetX[0][5] = 0;
  mainOffsetY[0][5] = 0;
  mainOffsetX[1][1] = 0;
  mainOffsetY[1][1] = 0;
  mainOffsetX[1][2] = 1;
  mainOffsetY[1][2] = 0;
  mainOffsetX[1][3] = 1;
  mainOffsetY[1][3] = 1;
  mainOffsetX[1][4] = 0;
  mainOffsetY[1][4] = -2;
  mainOffsetX[1][5] = 1;
  mainOffsetY[1][5] = -2;
  mainOffsetX[2][1] = 0;
  mainOffsetY[2][1] = 0;
  mainOffsetX[2][2] = 0;
  mainOffsetY[2][2] = 0;
  mainOffsetX[2][3] = 0;
  mainOffsetY[2][3] = 0;
  mainOffsetX[2][4] = 0;
  mainOffsetY[2][4] = 0;
  mainOffsetX[2][5] = 0;
  mainOffsetY[2][5] = 0;
  mainOffsetX[3][1] = 0;
  mainOffsetY[3][1] = 0;
  mainOffsetX[3][2] = -1;
  mainOffsetY[3][2] = 0;
  mainOffsetX[3][3] = -1;
  mainOffsetY[3][3] = 1;
  mainOffsetX[3][4] = 0;
  mainOffsetY[3][4] = -2;
  mainOffsetX[3][5] = -1;
  mainOffsetY[3][5] = -2;
  
  brickOffsetX[1][1] = 1;
  brickOffsetY[1][1] = 0;
  brickOffsetX[1][2] = 2;
  brickOffsetY[1][2] = 0;
  brickOffsetX[1][3] = -1;
  brickOffsetY[1][3] = 0;
  brickOffsetX[2][1] = 1;
  brickOffsetY[2][1] = 0;
  brickOffsetX[2][2] = 0;
  brickOffsetY[2][2] = 1;
  brickOffsetX[2][3] = 1;
  brickOffsetY[2][3] = 1;
  brickOffsetX[3][1] = 0;
  brickOffsetY[3][1] = -1;
  brickOffsetX[3][2] = -1;
  brickOffsetY[3][2] = 0;
  brickOffsetX[3][3] = 1;
  brickOffsetY[3][3] = 0;
  brickOffsetX[4][1] = 0;
  brickOffsetY[4][1] = -1;
  brickOffsetX[4][2] = 1;
  brickOffsetY[4][2] = -1;
  brickOffsetX[4][3] = -1;
  brickOffsetY[4][3] = 0;
  brickOffsetX[5][1] = 0;
  brickOffsetY[5][1] = -1;
  brickOffsetX[5][2] = -1;
  brickOffsetY[5][2] = -1;
  brickOffsetX[5][3] = 1;
  brickOffsetY[5][3] = 0;
  brickOffsetX[6][1] = -1;
  brickOffsetY[6][1] = 0;
  brickOffsetX[6][2] = -1;
  brickOffsetY[6][2] = -1;
  brickOffsetX[6][3] = 1;
  brickOffsetY[6][3] = 0;
  brickOffsetX[7][1] = 1;
  brickOffsetY[7][1] = 0;
  brickOffsetX[7][2] = 1;
  brickOffsetY[7][2] = -1;
  brickOffsetX[7][3] = -1;
  brickOffsetY[7][3] = 0;
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
  /*if (saved == 0)
  {
    saved = 1;
    highscore = max(highscore,score); 
    highscorestr[0] = str(highscore);
    saveStrings("highscore.txt",highscorestr);
  } Disabled in online applet */
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
  text("Bns",71,11);
  text("Blks",106,11);
  text("Time",131,11);
  text("BPM",166,11);
  text("MxCb",191,11);
  text("AvCb",221,11);
  yscounter = 23;
  for (int i = 1; i <= level; i++)
  {
    text(i,1,yscounter);
    text(stats_score[i],26,yscounter);
    text(stats_bonus[i],71,yscounter);
    bonus += stats_bonus[i];
    text(stats_blocks[i],106,yscounter);
    levelblocks += stats_blocks[i];
    if (stats_timeseconds[i] <= 9)
    {
      text(stats_timeminutes[i]+":0"+stats_timeseconds[i],131,yscounter);
    }
    else
    {
      text(stats_timeminutes[i]+":"+stats_timeseconds[i],131,yscounter);
    }
    levelminutes += stats_timeminutes[i];
    levelseconds += stats_timeseconds[i];
    text(stats_bpm[i],166,yscounter);
    text(stats_maxcombo[i],191,yscounter);
    text((stats_avgcombo[i] / 10) + "." + (stats_avgcombo[i] % 10),221,yscounter);
    yscounter += 12;
  }
  text("TOT",1,yscounter);
  text(score,26,yscounter);
  text(levelblocks,106,yscounter);
  levelminutes += (levelseconds / 60);
  levelseconds = levelseconds % 60;
  if (levelseconds <= 9)
  {
    text(levelminutes + ":0" + levelseconds,131,yscounter);
  }
  else
  {
    text(levelminutes + ":" + levelseconds,131,yscounter);
  }
  text((60 * levelblocks) / ((60 * levelminutes) + levelseconds),166,yscounter);
  text(max(stats_maxcombo),191,yscounter);
  tempframes = 10 * totalcombocounter / totalcombos;
  text((tempframes / 10) + "." + (tempframes % 10),221,yscounter);
  yscounter += 12;
  text("Source",1,yscounter);
  text("Total",36,yscounter);
  text("Percent",81,yscounter);
  yscounter += 12;
  text("Drop",1,yscounter);
  text(stats_droppoints,36,yscounter);
  text(100.0*float(stats_droppoints)/float(score),81,yscounter);
  yscounter += 12;
  text("Clear",1,yscounter);
  text(stats_linepoints,36,yscounter);
  text(100.0*float(stats_linepoints)/float(score),81,yscounter);
  yscounter += 12;
  text("Combo",1,yscounter);
  text(stats_combopoints,36,yscounter);
  text(100.0*float(stats_combopoints)/float(score),81,yscounter);
  yscounter += 12;
  text("Bonus",1,yscounter);
  text(stats_bonuspoints,36,yscounter);
  text(100.0*float(stats_bonuspoints)/float(score),81,yscounter);
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
    for (int i = 0; i <= 3; i++)
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
      rect(241,21,260,40);
      rect(241,41,260,60);
      rect(261,41,280,60);
      rect(281,41,300,60);
    }
    else if (nextpieceID == 7)
    {
      rect(281,21,300,40);
      rect(241,41,260,60);
      rect(261,41,280,60);
      rect(281,41,300,60);
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
        rect(321,21,340,40);        
        rect(321,41,340,60);       
        rect(341,41,360,60);
        rect(361,41,380,60);
      }
      else if (heldpieceID == 7)
      {
        rect(361,21,380,40);        
        rect(321,41,340,60);       
        rect(341,41,360,60);
        rect(361,41,380,60);
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
  //text("HIGH",243,380); Disabled in online applet
  //text(highscore,243,392);
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
    for (int i = 0; i <= 3; i++)
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
  for (int i = 0; i <= 3; i++)
  {
    fill(red(colors[fallingpieceID]),green(colors[fallingpieceID]),blue(colors[fallingpieceID]),63);
    rect((fallingpieceX[i] * 20) - 39,(fallingpieceY[i] * 20) - 39 + (20 * ghostcounter),(fallingpieceX[i] * 20) - 20,(fallingpieceY[i] * 20) - 20 + (20 * ghostcounter));
  }
}

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
  if (key == '6' || key == 'x')
  {
    keysdown[4] = 1;
  }
  if (key == '5' || key == 'z')
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
  if (key == '4' || key == 'c')
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
  if (key == '6' || key == 'x')
  {
    keysdown[4] = 0;
  }
  if (key == '5' || key == 'z')
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
  if (key == '4' || key == 'c')
  {
    keysdown[8] = 0;
  }
}

void InputFunction()
{
  if (paused == 0)
  {
    if (keysdown[1] == 0)
    {
      keyspressed[1] = 0;
      keytimer[1] = 8;
    }
    if (keysdown[1] == 1)
    {
      if (keyspressed[1] == 0)
      {
        keyspressed[1] = 1;
        keytimer[1] = 8;
        if (PieceCanMove("left"))
        {
          droptick = 31;
          MovePiece(-1,0,0);
        }
      }
      if (keyspressed[1] == 1 && keytimer[1] <= 0)
      {
        if (PieceCanMove("left"))
        {
          droptick = 31;
          MovePiece(-1,0,0);
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
      keytimer[2] = 8;
    }
    if (keysdown[2] == 1)
    {
      if (keyspressed[2] == 0)
      {
        keyspressed[2] = 1;
        keytimer[2] = 8;
        if (PieceCanMove("right"))
        {
          droptick = 31;
          MovePiece(1,0,0);
        }
      }
      if (keyspressed[2] == 1 && keytimer[2] <= 0)
      {
        if (PieceCanMove("right"))
        {
          droptick = 31;
          MovePiece(1,0,0);
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
      keytimer[3] = 8;
    }
    if (keysdown[3] == 1)
    {
      if (keyspressed[3] == 0)
      {
        keyspressed[3] = 1;
        keytimer[3] = 8;
        if (droptick == 31)
        {
          score += level;
          stats_droppoints += level;
          falltick = 1;
        }
      }
      if (keyspressed[3] == 1 && keytimer[3] <= 0)
      {
        if (droptick == 31)
        {
          score += level;
          stats_droppoints += level;
          falltick = 1;
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
      RotatePiece(1);
    }
    if (keysdown[5] == 0)
    {
      keyspressed[5] = 0;
    }
    if (keysdown[5] == 1 && keyspressed[5] == 0)
    {
      keyspressed[5] = 1;
      RotatePiece(-1);
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
  if (keysdown[7] == 0)
  {
    keyspressed[7] = 0;
  }
  if (keysdown[7] == 1 && keyspressed[7] == 0)
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
      colorgrid[i][1] = 0;
    }
    fallingpieceorientation = 0;
    falltick = 62 - (2*level);
    if (heldthisdrop == 0)
    {
      fallingpieceID = nextpieceID;
      nextpieceID = int(random(1,7.999999999));
    }
    if (fallingpieceID == 1 || fallingpieceID == 2)
    {
      fallingpieceX[0] = 7;
      fallingpieceY[0] = 3;
    }
    else
    {
      fallingpieceX[0] = 7;
      fallingpieceY[0] = 4;
    }
    MovePiece(0,0,0);
    for (int i = 0; i <= 3; i++)
    {
      if (colorgrid[fallingpieceX[i]][fallingpieceY[i]] != 0)
      {
        gameover = 1;
        mode = 2;
        gameovertimer = 31;
      }
    }
  }
}

void Falling()
{
  speed = 62 - (2*level);
  if (droptick == 31)
  {
    falltick--;
    if (falltick == 0)
    {
      falltick = speed;
      ok = 1;
      for (int i = 0; i <= 3; i++)
      {
        if (colorgrid[fallingpieceX[i]][fallingpieceY[i]+1] != 0)
        {
          ok = 0;
        }
      }
      if (ok == 1)
      {
        MovePiece(0,1,0);
      }
      else
      {
        droptick = 30;
      }
    }
  }
  else
  {
    droptick--;
    if (droptick <= 0)
    {
      for (int i = 0; i <= 3; i++)
      {
        colorgrid[fallingpieceX[i]][fallingpieceY[i]] = fallingpieceID;
      }
      popupX = (20 * fallingpieceX[0]) - 40;
      popupY = (20 * fallingpieceY[0]) - 40;
      piecedropped = 1;
      droptick = 31;
    }
  }
}

boolean PieceCanMove(String dir)
{
  if (dir == "right")
  {
    ok = 1;
    for (int i = 0; i <= 3; i++)
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
    for (int i = 0; i <= 3; i++)
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

void RotatePiece(int rotdir)
{
  droptick = 31;
  destinationorientation = fallingpieceorientation + rotdir;
  if (destinationorientation >= 4)
  {
    destinationorientation -= 4;
  }
  if (destinationorientation <= -1)
  {
    destinationorientation += 4;
  }
  if (fallingpieceID >= 3 || fallingpieceID == 1)
  {
    for (int i = 1; i <= 5; i++)
    {
      if (fallingpieceID >= 3)
      {
        offsetX = mainOffsetX[fallingpieceorientation][i] - mainOffsetX[destinationorientation][i];
        offsetY = mainOffsetY[fallingpieceorientation][i] - mainOffsetY[destinationorientation][i];
      }
      else
      {
        offsetX = IOffsetX[fallingpieceorientation][i] - IOffsetX[destinationorientation][i];
        offsetY = IOffsetY[fallingpieceorientation][i] - IOffsetY[destinationorientation][i];
      }
      destinationX[0] = fallingpieceX[0] + offsetX;
      destinationY[0] = fallingpieceY[0] + offsetY;
      for (int j = 1; j <= 3; j++)
      {
        switch (destinationorientation)
        {
          case 0:
          destinationX[j] = destinationX[0] + brickOffsetX[fallingpieceID][j];
          destinationY[j] = destinationY[0] + brickOffsetY[fallingpieceID][j];
          break;
          case 1:
          destinationX[j] = destinationX[0] - brickOffsetY[fallingpieceID][j];
          destinationY[j] = destinationY[0] + brickOffsetX[fallingpieceID][j];
          break;
          case 2:
          destinationX[j] = destinationX[0] - brickOffsetX[fallingpieceID][j];
          destinationY[j] = destinationY[0] - brickOffsetY[fallingpieceID][j];
          break;
          case 3:
          destinationX[j] = destinationX[0] + brickOffsetY[fallingpieceID][j];
          destinationY[j] = destinationY[0] - brickOffsetX[fallingpieceID][j];
        }
      }
      
      rotationvalid = 1;
      for (int k = 0; k <= 3; k++)
      {
        if (destinationX[k] >= 3 && destinationX[k] <= 12 && destinationY[k] >= 1 && destinationY[k] <= 22)
        {
          if (colorgrid[destinationX[k]][destinationY[k]] != 0)
          {
            rotationvalid = 0;
          }
        }
        else
        {
          rotationvalid = 0;
        }
      }      
      if (rotationvalid == 1)
      {          
        MovePiece(offsetX,offsetY,rotdir);
        i = 9999;
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
    for (int i = 0; i <= 3; i++)
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
      stats_droppoints += level;
      MovePiece(0,1,0);
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
      stats_linepoints += (50 * level);
      stats_combopoints += (50 * level * combo / 2);
      popped = 1;
      break;
    case 2:
      score += int(120.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      dropmessage = dropmessage + "\nCLEAR: " + int(120.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      scorepopupvalue[scorepopupcounter] += "+" + int(120.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      stats_linepoints += (120 * level);
      stats_combopoints += (120 * level * combo / 2);
      popped = 1;
      break;
    case 3:
      score += int(300.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      dropmessage = dropmessage + "\nCLEAR: " + int(300.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      scorepopupvalue[scorepopupcounter] += "+" + int(300.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      stats_linepoints += (300 * level);
      stats_combopoints += (300 * level * combo / 2);
      popped = 1;
      break;
    case 4:
      score += int(800.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      dropmessage = dropmessage + "\nCLEAR: " + int(800.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      scorepopupvalue[scorepopupcounter] += "+" + int(800.0 * FloatIt(level) * FloatIt(1.0 + (FloatIt(combo) / 2.0)));
      stats_linepoints += (800 * level);
      stats_combopoints += (800 * level * combo / 2);
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
    stats_bonuspoints += bonus;
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
    }
    combo = 0;
    combosecondsleft = 0;
  }
  switch(combo)
  {
    case 0:
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

void MovePiece(int xmov, int ymov, int rotmov)
{
  fallingpieceX[0] += xmov;
  fallingpieceY[0] += ymov;
  fallingpieceorientation += rotmov;
  if (fallingpieceorientation >= 4)
  {
    fallingpieceorientation -= 4;
  }
  if (fallingpieceorientation <= -1)
  {
    fallingpieceorientation += 4;
  }
  for (int i = 1; i <= 3; i++)
  {
    switch (fallingpieceorientation)
    {
      case 0:
      fallingpieceX[i] = fallingpieceX[0] + brickOffsetX[fallingpieceID][i];
      fallingpieceY[i] = fallingpieceY[0] + brickOffsetY[fallingpieceID][i];
      break;
      case 1:
      fallingpieceX[i] = fallingpieceX[0] - brickOffsetY[fallingpieceID][i];
      fallingpieceY[i] = fallingpieceY[0] + brickOffsetX[fallingpieceID][i];
      break;
      case 2:
      fallingpieceX[i] = fallingpieceX[0] - brickOffsetX[fallingpieceID][i];
      fallingpieceY[i] = fallingpieceY[0] - brickOffsetY[fallingpieceID][i];
      break;
      case 3:
      fallingpieceX[i] = fallingpieceX[0] + brickOffsetY[fallingpieceID][i];
      fallingpieceY[i] = fallingpieceY[0] - brickOffsetX[fallingpieceID][i];
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

