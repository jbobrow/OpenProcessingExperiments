
////////////////////////////////////////////////////////////////////
//_________ _______  _______ __________________ _        _______  //
//\__   __/(  ___  )(  ____ \\__   __/\__   __/( \      (  ____ \ //
//   ) (   | (   ) || (    \/   ) (      ) (   | (      | (    \/ //
//   | |   | (___) || |         | |      | |   | |      | (__     //
//   | |   |  ___  || |         | |      | |   | |      |  __)    //
//   | |   | (   ) || |         | |      | |   | |      | (       //
//   | |   | )   ( || (____/\   | |   ___) (___| (____/\| (____/\ //
//   )_(   |/     \|(_______/   )_(   \_______/(_______/(_______/ //
////////////////////////////////////////////////////////////////////
// _______  _______           _______    _______  //
//(  ____ \(  ___  )|\     /|(  ____ \  / ___   ) //
//| (    \/| (   ) || )   ( || (    \/  \/   )  | //
//| |      | (___) || |   | || (__          /   ) //
//| |      |  ___  |( (   ) )|  __)       _/   /  //
//| |      | (   ) | \ \_/ / | (         /   _/   //
//| (____/\| )   ( |  \   /  | (____/\  (   (__/\ //
//(_______/|/     \|   \_/   (_______/  \_______/ //
////////////////////////////////////////////////////

 
///////TC2 STAFF ////
////////////////////////////////////////
//BY: TEAM CORSEHEAD                  //
//art, design and code by Kevin Wong  //
//Music licensed by Ozzed             //
//Copyright 2011 CC BY-SA 3.0         //
//Some rights reserved                //
////////////////////////////////////////

//state the variables
int columns;
int rows;
char[][] level;  //array that will allow us to use characters to represent objects in the grid
int player_x;    //player x index in grid
int player_y;    //player y index in grid
int collected_rays;  //number of rays colleced var
int printed_rays;    //var that counts the number of rays collected in a level
int rays_left;      //var that counts the number of rays left in a level
PFont font;        //font declaration
boolean alive;  //checks whether player is alive
boolean win;  //checks for win for restart function to work
int state;
PImage splash; //splash screen declaration
PImage instructions;  //instruction screen declaration
PImage PCsprite;     //player sprite declaration
PImage lightrays;    //light ray declaration
PImage walls;       //wall sprite declaration
PImage noclip; //noclipwall declaration
int cellsize;  //cell size


//MINIM CODEC HERE
//minim codec;
import ddf.minim.*; 
 
void setup()
{
  win = false;
  //state the number of rows and columns
  columns = 23;
  rows = 11;
  cellsize = 40;  //cells in grid size determination
  smooth();  //makes text and shapes look awesome!
  size (columns * cellsize, rows * cellsize);  // size of game screen
  state = 0;  //sets the state of the game
  //FOR THE SPLASH SCREEN
  splash = loadImage("splash.png");
 
  //LOAD THE INSTRUCTIONS
  instructions = loadImage("INSTRUCTIONS.png");
 
  //Load sprites
  PCsprite = loadImage("PCsprite.png");
  //Load lightrays
  lightrays = loadImage("lightrays.png");
  //Load walls
  walls = loadImage("walls.png");
  //Load noclips
  noclip = loadImage("walls.png");
 
  //BGM1 -- plays first background song
   Minim minim;
   AudioPlayer bgm1;
 
   minim = new Minim(this);
   bgm1 = minim.loadFile("bgm1.mp3", 2048);
   bgm1.play();
   bgm1.loop();
 
  //set the character to alive
  alive = true;
 
  //set the number of rays
  collected_rays = 0;
  printed_rays = 0;
  rays_left = 51;
 
  //load font
  font = loadFont("Arial-Black-48.vlw");
 
  //state the player's position LEVEL 1
  player_x = 2;
  player_y = 7;
 
  //setup array for different objects in the level
  level = new char[columns][rows];
 
  //locations for walls LEVEL 1
  level[3][0] = level[7][0] = level[10][0] = level[14][0] = level[15][0] = level[17][0] = level[20][0] = level[21][0] = level[22][0] = level[1][1] = level[3][1] = level[5][1] = level[7][1] =
  level[12][1] = level[14][1] = level[15][1] = level[17][1] = level[21][1] = level[22][1] = level[3][2] = level[5][2] = level[10][2] = level[11][2] = level[12][2] = level[14][2] = level[15][2] =
  level[22][2] = level[2][3] = level[5][3] = level[7][3] = level[14][3] = level[15][3] = level[1][4] = level[3][4] = level[5][4] = level[6][4] = level[7][4] = level[8][4] = level[9][4] =
  level[18][4] = level[19][4] = level[20][4] = level[3][5] = level[9][5] = level[14][5] = level[20][5] = level[1][6] = level[2][6] = level[3][6] = level[7][6] = level[9][6] = 
  level[10][6] = level[11][6] = level[12][6] = level[13][6] = level[14][6] = level[15][6] = level[16][6] = level[17][6] = level[18][6] = level[19][6] = level[20][6] = level[21][6] = level[22][6] =
  level[7][7] = level[0][8] = level[1][8] = level[7][8] = level[10][8] = level[11][8] = level[12][8] = level[13][8] = level[14][8] = level[15][8] = level[16][8] = level[17][8] = level[18][8] = level[19][8] 
  = level[20][8] = level[21][8] = level[0][9] = level[1][9] = level[7][9] = level[0][10] = level[1][10] = level[2][10] = level[3][10] = level[4][10] = level[5][10] = level[6][10] = level[7][10] =
  level[8][10] = level[9][10] = level[10][10] = level[11][10] = level[12][10] = level[13][10] = level[14][10] = level[15][10] = level[16][10] = level[17][10] = level[18][10] = level[19][10] = level[20][10] =
  level[21][10] = level[22][10] = 'w';
  
  //initial location for player LEVEL 1
  level[2][7] = 'c';
 
  //locations for light rays LEVEL 1 --- 51 of them
  level[8][0] = level[9][0] = level[16][0] = level[18][0] = level[19][0] = level[2][1] = level[8][1] = level[9][1] = level[13][1] = level[16][1] = level[0][2] = level[13][2] =
  level[6][3] = level[8][3] = level[10][3] = level[11][3] = level[2][4] = level[10][4] = level[11][4] = level[12][4] = level[15][4] = level[16][4] = level[21][4] = level[0][5] = 
  level[5][5] = level[10][5] = level[11][5] = level[15][5] = level[18][5] = level[19][5] = level[21][5] = level[22][5] = level[0][7] = level[6][7] = level[11][7] = level[14][7] = 
  level[15][7] = level[17][7] = level[18][7] = level[19][7] = level[6][8] = level[8][8] = level[9][8] = level[22][8] = level[3][9] = level[6][9] = level[8][9] = level[9][9] =
  level[20][9] = level[21][9] = level[22][9] = 'l'; //THERE ARE A CRAPLOAD OF THEM
 
  //locations for traps LEVEL 1 THERE IS ONE OF THEM
  level[0][0] = level[2][0] = level[9][2] = level[1][3] = level[3][3] = level[9][3] = level[12][3] = level[17][3] = level[22][3] = level[17][4] = level[22][4] = level[12][5] = level[5][7]
  = level[5][8] = level[5][9] = level[10][9] = level[18][9] = 't';
}
 
void draw()
{
  if (state == 0)  //title screen
  {
    image(splash, 0, 0, columns * cellsize, rows * cellsize);  //title page
    if (key == '\n'|| key == '\r')  //if ENTER is pressed, show instructions
    {
      state = 1;
    }
  }
 
  else if (state == 1)    //instruction screen
  {
    image(instructions, 0, 0, columns * cellsize, rows * cellsize);  //show instructions
    if (key == ' ')  //SPACE initializes game
    {
      state = 2;
    }
  }
 
  if (state == 2)  //play state
  {
    //draw background
    background(0);
 
    //give player range of sight
    fill (255);
    rect (player_x * cellsize - cellsize, player_y * cellsize - cellsize, 3 * cellsize, 3 * cellsize);
 
    //state the for loops that look for objects and draws them in the array
    for (int i = 0; i < columns; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        //draw walls
        if (level[i][j] == 'w' && i * cellsize >= player_x * cellsize - cellsize && i * cellsize <= player_x * cellsize + cellsize && j * cellsize >= player_y * cellsize - cellsize && j * cellsize <= player_y * cellsize + cellsize)
        {
          noStroke();
          fill(90, 40, 10);
          image(walls, i * cellsize, j * cellsize, cellsize, cellsize);
        }
   //draw noclips
        if (level[i][j] == 'z' && i * cellsize >= player_x * cellsize - cellsize && i * cellsize <= player_x * cellsize + cellsize && j * cellsize >= player_y * cellsize - cellsize && j * cellsize <= player_y * cellsize + cellsize)
        {
          noStroke();
          fill(90, 40, 10);
          image(walls, i * cellsize, j * cellsize, cellsize, cellsize);
        }
        //draw light rays
        if (level[i][j] == 'l' && i * cellsize >= player_x * cellsize - cellsize && i * cellsize <= player_x * cellsize + cellsize && j * cellsize >= player_y * cellsize - cellsize && j * cellsize <= player_y * cellsize + cellsize)
        {
          noStroke();
          fill (229, 120, 30);
          image(lightrays, i * cellsize, j * cellsize, cellsize, cellsize);
        }
 
        //draw traps
        if (level[i][j] == 't' && i * cellsize >= player_x * cellsize - cellsize && i * cellsize <= player_x * cellsize + cellsize && j * cellsize >= player_y * cellsize - cellsize && j * cellsize <= player_y * cellsize + cellsize)
        {
          noStroke();
          fill (150);
          rect(i * cellsize, j * cellsize, cellsize, cellsize);
        }
 
        //draw character
        if (level[i][j] == 'c')
        {
          noStroke();
          image (PCsprite, player_x * cellsize, player_y * cellsize, cellsize, cellsize);
        }
      }
    }
 
    //draw all the columns and rows using for loops
    for (int i = height / rows; i <= height; i = i + height / rows)
    {
      stroke (0);
      line (0, i, width, i);
    }
 
    for (int i = width / columns; i <= width; i = i + width / columns)
    {
      line (i, 0, i, height);
    }
 
    fill (239, 247, 17);
    textFont(font);
    textSize(24);
    text ("Rays Collected = " + printed_rays, 0, 20, 128);
    text ("Rays Left = " + rays_left, 0, 44, 128);
    textSize(48);
 
    //counts number of rays collected
    if (level[player_x][player_y] == 'l')
    {
      collected_rays = collected_rays + 1;
      printed_rays = printed_rays + 1;
      rays_left = rays_left - 1;
      level[player_x][player_y] = 'c';
    }
    //debugging and counting
    println ("number of rays = " + collected_rays);
 
    //set traps
    if (level[player_x][player_y] == 't')
    {
      noLoop();
      background(0);
      fill (255);
      textFont(font);
      text("You Died! U MAD!", width/5, height / 2);
      text("Hit M to restart...", width/5 + 50, height / 2 + 50);
      alive = false;  //kill player
    }
 
    //Print level complete Conditions
    //LEVEL 1
    if (collected_rays == 51)
    {
      noLoop();  //stops program from running too far ahead
      background(85);
      fill (0);
      textFont(font);
      text("You Win! Next Level!", width/5, height / 2);
      text("Hit C to continue...", width/5 + 50, height / 2 + 50);
    }
 
    //second level complete? check
    if (collected_rays == 44)
    {
      noLoop();
      background(170);
      fill (0);
      textFont(font);
      text("You Win! Next Level!", width/5, height / 2);
      text("Hit V to continue...", width/5 + 50, height / 2 + 50);
    }
 
    //game win condition
    if (collected_rays == 100)
    {
      noLoop();
      win = true;
      background(255);
      fill (0);
      textFont(font);
      text("You Win!", width/3, height / 2);
      text("Press R to replay", width/4, height / 2 + 50);
    }
 
    //commands for moving onto next level
    //LEVEL 2 (from level 1)
    if (collected_rays == 51)
    {
      loop();
      collected_rays++;
      alive = true;
      level = new char[columns][rows];
      printed_rays = 0;
      rays_left = 33;
 
      //INITIAL LOCATION OF PLAYER
      player_x = 0;
      player_y = 0;
 
      //locations for walls
      level[2][0] = level[3][0] = level[4][0] = level[12][0] = level[2][1] = level[4][1] = level[5][1] = level[10][1] = level[12][1] = level[0][2] = level[4][2] =
      level[5][2] = level[10][2] = level[11][2] = level[12][2] = level[13][2] = level[14][2] = level[15][2] = level[16][2] = level[17][2] = level[0][3] = level[2][3] = 
      level[3][3] = level[4][3] = level[5][3] = level[6][3] = level[7][3] = level[8][3] = level[0][4] = level[2][4] = level[8][4] = level[9][4] = level[10][4] = level[12][4]
      = level[13][4] = level[15][4] = level[16][4] = level[0][5] = level[2][5] = level[4][5] = level[8][5] = level[12][5] = level[16][5] = level[0][6] = level[4][6] = 
      level[5][6] = level[6][6] = level[7][6] = level[8][6] = level[10][6] = level[12][6] = level[13][6] = level[15][6] = level[16][6] = level[0][7] = level[2][7] = 
      level[3][7] = level[4][7] = level[10][7] = level[12][7] = level[13][7] = level[15][7] = level[16][7] = level[0][8] = level[6][8] = level[7][8] = level[8][8] = level[9][8] =
      level[10][8] = level[12][8] = level[16][8] = level[0][9] = level[1][9] = level[2][9] = level[3][9] = level[4][9] = level[5][9] = level[16][9] = level[0][10] = level[1][10] = level[2][10] = level[3][10] = level[4][10] = level[5][10] = level[6][10] = level[7][10] = level[8][10] = level[9][10] = level[10][10] = level[11][10] = level[12][10] = level[13][10] = level[14][10] = level[15][10] = level[16][10] = level[17][10] = level[18][10] = level[19][10] = level[20][10] =
  level[21][10] = level[22][10] = 'w';
 
      //initial location for player
      level[0][0] = 'c';
 
      //locations for light rays ---- 33 OF THEM
      level[8][0] = level[14][0] = level[7][1] = level[9][1] = level[11][1] = level[1][2] = level[2][2] = level[3][2] = level[14][3] = level[15][3] = level[17][3] = 
      level[5][4] = level[6][4] = level[5][5] = level[6][5] = level[7][5] = level[10][5] = level[11][5] = level[13][5] = level[14][5] = level[15][5] = level[2][6] =
      level[2][7] = level[5][7] = level[8][7] = level[9][7] = level[2][8] = level[14][8] = level[9][9] = level[11][9] = level[13][9] = level[15][9] = level[22][9] = 'l';
 
      //locations for traps ---- 9 OF THEM
      level[6][0] = level[17][0] = level[3][1] = level[6][1] = level[15][1] = level[19][1] = level[20][1] = level[6][2] = level[19][2] = level[22][3] = level[7][4] = level[14][4] =
      level[20][4] = level[18][5] = level[22][6] = level[19][7] = level[21][8] = level[7][9] = level[14][9] = level[18][9] = 't';
    }
 
    //LEVEL 3
    if (collected_rays == 33)
    {
      loop();
      alive = true;
 
      collected_rays++;
      level = new char[columns][rows];
 
      printed_rays = 0;
      rays_left = 54;
 
      //INITIAL LOCATION OF PLAYER
      player_x = 0;
      player_y = 5;
      
      //locations for walls
      level[0][0] = level[2][0] = level[13][0] = level[14][0] = level[15][0] = level[18][0] = level[21][0] = level[0][1] = level[2][1] =
      level[4][1] = level[5][1] = level[7][1] = level[10][1] = level[11][1] = level[13][1] = level[14][1] = level[15][1] = level[18][1] = level[21][1] =
     level[2][0] = level[2][2] = level[10][2] = level[11][2] = level[21][2] = level[0][3] = level[2][3] = level[6][3] = level[7][3] = level[10][3] = level[11][3] =
     level[13][3] = level[14][3] = level[15][3] = level[16][3] = level[21][3] = level[0][4] = level[2][4] = level[6][4] = level[8][4] = level[10][4] = level[11][4] = 
     level[13][4] = level[14][4] = level[15][4] = level[16][4] = level[17][4] = level[18][4] = level[19][4] = level[20][4] = level[21][4] = level[0][6] = level[2][6] =
     level[3][6] = level[4][6] = level[5][6] = level[6][6] = level[7][6] = level[9][6] = level[10][6] = level[11][6] = level[12][6] = level[13][6] = level[14][6] = 
     level[15][6] = level[16][6] = level[17][6] = level[18][6] = level[19][6] = level[20][6] = level[21][6] = level[0][7] = level[7][7] = level[9][7] = level[14][7] = 
      level[0][8] = level[9][8] = level[14][8] = level[0][9] = level[9][9] = level[0][10] = level[1][10] = level[2][10] = level[3][10] = level[4][10] = level[5][10] = level[6][10] = level[7][10] =
  level[8][10] = level[9][10] = level[10][10] = level[11][10] = level[12][10] = level[13][10] = level[14][10] = level[15][10] = level[16][10] = level[17][10] = level[18][10] = level[19][10] = level[20][10] =
  level[21][10] = level[22][10] = 'w';
 
      //initial location for player
      level[0][5] = 'c';
 
      //locations for light rays (38 OF THEM) 
     level[3][0] = level[5][0] = level[9][0] = level[12][0] = level[16][0] = level[17][0] = level[22][0] = level[1][1] = level[6][2] = level[8][2] = level[12][2] = level[22][2]
     = level[1][3] = level[17][3] = level[20][3] = level[3][4] = level[5][4] = level[7][4] = level[12][4] = level[22][4] = level[2][5] = level[1][7] = level[3][7] = level[5][7] =
     level[16][7] = level[19][7] = level[21][7] = level[1][8] = level[2][8] = level[3][8] = level[5][8] = level[6][8] = level[1][9] = level[3][9] = level[5][9] = level[16][9] = 
     level[19][9] = level[21][9] = 'l';
 
      //locations for traps
      level[1][0] = level[4][0] = level[19][0] = level[20][0] = level[6][1] = level[9][1] = level[9][2] = level[4][3] = level[9][4] = level[1][6] = level[2][7] = level[6][7] = level[15][7]
      = level[11][8] = level[12][8] = level[15][8] = level[16][8] = level[17][8] = level[18][8] = level[19][8] = level[20][8] = level[21][8] =
      level[2][9] = level[6][9] = 't';
      
      //locations for noclips
      level[13][2] = level[5][5] = level[15][5] = level[8][6] = level[22][6] = level[7][8] = level[7][9] = level[14][9] = 'z';
    }
  }
}
 
//KEY PRESSED COMMANDS
void keyPressed()
{
  //using if statements to move the character
  //MOVE RIGHT
  if(key == 'd' && player_x < 22 && (level[player_x + 1][player_y] != 'w') && (level[player_x][player_y] != 't'))
  {
    player_x++;
  }
 
  //MOVE LEFT
  if(key == 'a' && player_x > 0 && (level[player_x - 1][player_y] != 'w') && (level[player_x][player_y] != 't'))
  {
    player_x--;
  }
 
  //MOVE UP
  if(key == 'w' && player_y > 0 && (level[player_x][player_y - 1] != 'w') && (level[player_x][player_y] != 't'))
  {
    player_y--;
  }
 
  //MOVE DOWN
  if(key == 's' && player_y < 12 && (level[player_x][player_y + 1] != 'w') && (level[player_x][player_y] != 't'))
  {
    player_y++;
  }
 
  //LEVEL CONTINUE KEY -- USED WHEN PLAYER COMPLETES A LEVEL
  if (key == 'c' && collected_rays == 51 )//|| collected_rays == 44)
  {
    loop();
    collected_rays++;
  }
 
  else if (key == 'v' && collected_rays == 33 )//|| collected_rays == 44)
  {
    loop();
    collected_rays++;
  }
 
  //DEBUGGING TOOL KEY
  if (key == 'q')
   {
   collected_rays = collected_rays + 1;
   }
 
  //give LEVEL 1 restart level function --- WHEN YOU DIE IN LEVEL 1
  if (key == 'm' && alive == false && collected_rays < 52)
  {
    loop();
    //THIS ENTIRE IF COMMAND RESETS THE ENTIRE LEVEL
    //reset number of rays
    collected_rays = 0;
    printed_rays = 0;
    rays_left = 51;
    alive = true;  //reset character
 
    //INIT LOCATION OF PLAYER
  //state the player's position LEVEL 1
  player_x = 2;
  player_y = 7;
 
 
  //locations for walls LEVEL 1
  level[3][0] = level[7][0] = level[10][0] = level[14][0] = level[15][0] = level[17][0] = level[20][0] = level[21][0] = level[22][0] = level[1][1] = level[3][1] = level[5][1] = level[7][1] =
  level[12][1] = level[14][1] = level[15][1] = level[17][1] = level[21][1] = level[22][1] = level[3][2] = level[5][2] = level[10][2] = level[11][2] = level[12][2] = level[14][2] = level[15][2] =
  level[22][2] = level[2][3] = level[5][3] = level[7][3] = level[14][3] = level[15][3] = level[1][4] = level[3][4] = level[5][4] = level[6][4] = level[7][4] = level[8][4] = level[9][4] =
  level[18][4] = level[19][4] = level[20][4] = level[3][5] = level[9][5] = level[14][5] = level[20][5] = level[1][6] = level[2][6] = level[3][6] = level[7][6] = level[9][6] = 
  level[10][6] = level[11][6] = level[12][6] = level[13][6] = level[14][6] = level[15][6] = level[16][6] = level[17][6] = level[18][6] = level[19][6] = level[20][6] = level[21][6] = level[22][6] =
  level[7][7] = level[0][8] = level[1][8] = level[7][8] = level[10][8] = level[11][8] = level[12][8] = level[13][8] = level[14][8] = level[15][8] = level[16][8] = level[17][8] = level[18][8] = level[19][8] 
  = level[20][8] = level[21][8] = level[0][9] = level[1][9] = level[7][9] = level[0][10] = level[1][10] = level[2][10] = level[3][10] = level[4][10] = level[5][10] = level[6][10] = level[7][10] =
  level[8][10] = level[9][10] = level[10][10] = level[11][10] = level[12][10] = level[13][10] = level[14][10] = level[15][10] = level[16][10] = level[17][10] = level[18][10] = level[19][10] = level[20][10] =
  level[21][10] = level[22][10] ='w';
  
  //initial location for player LEVEL 1
  level[2][7] = 'c';
 
  //locations for light rays LEVEL 1 --- 51 of them
  level[8][0] = level[9][0] = level[16][0] = level[18][0] = level[19][0] = level[2][1] = level[8][1] = level[9][1] = level[13][1] = level[16][1] = level[0][2] = level[13][2] =
  level[6][3] = level[8][3] = level[10][3] = level[11][3] = level[2][4] = level[10][4] = level[11][4] = level[12][4] = level[15][4] = level[16][4] = level[21][4] = level[0][5] = 
  level[5][5] = level[10][5] = level[11][5] = level[15][5] = level[18][5] = level[19][5] = level[21][5] = level[22][5] = level[0][7] = level[6][7] = level[11][7] = level[14][7] = 
  level[15][7] = level[17][7] = level[18][7] = level[19][7] = level[6][8] = level[8][8] = level[9][8] = level[22][8] = level[3][9] = level[6][9] = level[8][9] = level[9][9] =
  level[20][9] = level[21][9] = level[22][9] = 'l'; //THERE ARE A CRAPLOAD OF THEM
 
  //locations for traps LEVEL 1 THERE IS ONE OF THEM
  level[0][0] = level[2][0] = level[9][2] = level[1][3] = level[3][3] = level[9][3] = level[12][3] = level[17][3] = level[22][3] = level[17][4] = level[22][4] = level[12][5] = level[5][7]
  = level[5][8] = level[5][9] = level[10][9] = level[18][9] = 't';
  }
 
  //COMMAND FOR RESETTING LEVEL 2
  if (key == 'm' && alive == false && collected_rays > 52 && collected_rays <= 84)
  {
    loop();
    collected_rays = 52;
    alive = true;
    printed_rays = 0;
    rays_left = 33;
  }
 
  //COMMAND FOR RESETTING LEVEL 3
  if (key == 'm' && alive == false && collected_rays > 44 && collected_rays <= 99)
  {
    loop();
    collected_rays = 84;
    alive = true;
    printed_rays = 0;
    rays_left = 38;
  }
 
  //command for restarting game
  if (key == 'r' && win == true)
  {
    loop();
    collected_rays = 0;
    printed_rays = 0; 
    rays_left = 51;
    win = false;
    state = 0;
    alive = true;  //reset character
 
    //INIT LOCATION OF PLAYER
    player_x = 2;
    player_y = 7;
 
    level = new char[columns][rows];
 
   //locations for walls LEVEL 1
  level[3][0] = level[7][0] = level[10][0] = level[14][0] = level[15][0] = level[17][0] = level[20][0] = level[21][0] = level[22][0] = level[1][1] = level[3][1] = level[5][1] = level[7][1] =
  level[12][1] = level[14][1] = level[15][1] = level[17][1] = level[21][1] = level[22][1] = level[3][2] = level[5][2] = level[10][2] = level[11][2] = level[12][2] = level[14][2] = level[15][2] =
  level[22][2] = level[2][3] = level[5][3] = level[7][3] = level[14][3] = level[15][3] = level[1][4] = level[3][4] = level[5][4] = level[6][4] = level[7][4] = level[8][4] = level[9][4] =
  level[18][4] = level[19][4] = level[20][4] = level[3][5] = level[9][5] = level[14][5] = level[20][5] = level[1][6] = level[2][6] = level[3][6] = level[7][6] = level[9][6] = 
  level[10][6] = level[11][6] = level[12][6] = level[13][6] = level[14][6] = level[15][6] = level[16][6] = level[17][6] = level[18][6] = level[19][6] = level[20][6] = level[21][6] = level[22][6] =
  level[7][7] = level[0][8] = level[1][8] = level[7][8] = level[10][8] = level[11][8] = level[12][8] = level[13][8] = level[14][8] = level[15][8] = level[16][8] = level[17][8] = level[18][8] = level[19][8] 
  = level[20][8] = level[21][8] = level[0][9] = level[1][9] = level[7][9] = level[0][10] = level[1][10] = level[2][10] = level[3][10] = level[4][10] = level[5][10] = level[6][10] = level[7][10] =
  level[8][10] = level[9][10] = level[10][10] = level[11][10] = level[12][10] = level[13][10] = level[14][10] = level[15][10] = level[16][10] = level[17][10] = level[18][10] = level[19][10] = level[20][10] =
  level[21][10] = level[22][10] ='w';
  
  //initial location for player LEVEL 1
  level[2][7] = 'c';
 
  //locations for light rays LEVEL 1 --- 51 of them
  level[8][0] = level[9][0] = level[16][0] = level[18][0] = level[19][0] = level[2][1] = level[8][1] = level[9][1] = level[13][1] = level[16][1] = level[0][2] = level[13][2] =
  level[6][3] = level[8][3] = level[10][3] = level[11][3] = level[2][4] = level[10][4] = level[11][4] = level[12][4] = level[15][4] = level[16][4] = level[21][4] = level[0][5] = 
  level[5][5] = level[10][5] = level[11][5] = level[15][5] = level[18][5] = level[19][5] = level[21][5] = level[22][5] = level[0][7] = level[6][7] = level[11][7] = level[14][7] = 
  level[15][7] = level[17][7] = level[18][7] = level[19][7] = level[6][8] = level[8][8] = level[9][8] = level[22][8] = level[3][9] = level[6][9] = level[8][9] = level[9][9] =
  level[20][9] = level[21][9] = level[22][9] = 'l'; //THERE ARE A CRAPLOAD OF THEM
 
  //locations for traps LEVEL 1 THERE IS ONE OF THEM
  level[0][0] = level[2][0] = level[9][2] = level[1][3] = level[3][3] = level[9][3] = level[12][3] = level[17][3] = level[22][3] = level[17][4] = level[22][4] = level[12][5] = level[5][7]
  = level[5][8] = level[5][9] = level[10][9] = level[18][9] = 't';
  }
}


