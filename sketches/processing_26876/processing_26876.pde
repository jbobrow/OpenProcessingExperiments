

//.d8888.  .o88b. db   db d888888b d88888D  .d88b.  d8888b. db   db d8888b. 
//88'  YP d8P  Y8 88   88   `88'   YP  d8' .8P  Y8. 88  `8D 88   88 88  `8D 
//`8bo.   8P      88ooo88    88       d8'  88    88 88oodD' 88ooo88 88oobY' 
//  `Y8b. 8b      88~~~88    88      d8'   88    88 88~~~   88~~~88 88`8b   
//db   8D Y8b  d8 88   88   .88.    d8' db `8b  d8' 88      88   88 88 `88. 
//`8888Y'  `Y88P' YP   YP Y888888P d88888P  `Y88P'  88      YP   YP 88   YD 
                                                                          
                                                                          
//d88888b d8b   db d888888b  .d8b.  
//88'     888o  88   `88'   d8' `8b 
//88ooooo 88V8o 88    88    88ooo88 
//88~~~~~ 88 V8o88    88    88~~~88 
//88.     88  V888   .88.   88   88 
//Y88888P VP   V8P Y888888P YP   YP 

///////ORIGINAL EDITION 0.9 STAFF /////////////
 
///////////////////////////////////////////////
//BY: TEAM DARKLIGHT                         //
//MEMBERS: DAVIS HUANG, KEVIN WONG, DANIEL XU//
///////////////////////////////////////////////
 
 
////////////TEAM///////////////////////////////
//CONCEPT IDEA: TEAM DARKLIGHT               //
//PROGRAMMING: DAVIS HUANG, DANIEL XU        //
//GRAPHICS & MUSIC: KEVIN WONG               //
//TESTING & DEBUGGING: DANIEL XU             //
///////////////////////////////////////////////
 
 
//////////SPECIAL THANKS & ACKNOWLEDGMENTS////////////
//TEACHERS: GILLIAN SMITH, ANNE SULLIVAN            //
//TEACHER ASSISTANTS: ALEX SCHNEIDER, BRANDON TEARSE//
//PLAYTESTERS: CLUSTER 5                            //
//////////////////////////////////////////////////////

//////ENHANCED EDITION STAFF 0.95////////////

///////////0.95 Version Differences//////
// New Player Sprite                   //
// BGM1 Plays                          //
// Wall Sprites Avaliable              //
// Various Debug      
// Looping BGM                         //
/////////////////////////////////////////

////////////TEAM////////////////////////
// GRAPHICS: KEVIN WONG              ///
// DEBUG/PROGRAM: KEVIN WONG         ///
// PLAYTEST: AA2D PERIOD A           ///
// HEAD: MS. HELLSTROM               /// 
//SPECIAL THANKS:STUDIO C5           ///
////////////////////////////////////////

//////Psychology Project Staff//////

/////Version Differences////////////////
//Schizophrenia is a mental diesese c-//
//haracterized by multisensory halluc-//
//inations and delusional thoughts as //
//well as abnormal interactive proper-//
//ties, this game is intended to arti-//
//stically represent the impact of th-//
//is puzzling and saddening illness.  //
//In a sense of the term, these are g-//
//litches of the mind, these translat-//
//e into glitches within the game.    //
////////////////////////////////////////

//////DEVELOPMENT/////////////////////
//DEVELOPED BY: CORSEHEAD STUDIO    //
//DESIGN: KEVIN WONG                //
//PROGRAM: KEVIN WONG               //
//MUSIC: JACK "droid song" TAYLOR   //
//MUSIC: GLITCHY PIGGY - droid song //
//RESEARCH: MR. WOODARD             //
//SPECIAL THANKS: PSYCH PERIOD D    //
//SPECIAL THANKS: TEAM DARKLIGHT    //
//SPECIAL THANKS: STUDIO C5         //
//////////////////////////////////////

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
PImage csb; //COOL STORY BRO
int cellsize;  //cell size


//MINIM CODEC HERE
//minim codec;
import ddf.minim.*; 
 
void setup()
{
  win = false;
  //state the number of rows and columns
  columns = 23;
  rows = 13;
  cellsize = 40;  //cells in grid size determination
  smooth();  //makes text and shapes look awesome!
  size (columns * cellsize, rows * cellsize);  // size of game screen
  state = 0;  //sets the state of the game
  //FOR THE SPLASH SCREEN
  splash = loadImage("SPLASH.png");
 
  //LOAD THE INSTRUCTIONS
  instructions = loadImage("INSTRUCTIONS.png");
 
  //Load sprites
  PCsprite = loadImage("PCsprite2.png");
  //Load lightrays
  lightrays = loadImage("lightrays.png");
  //Load walls
  walls = loadImage("walls.png");
  //Load noclips
  noclip = loadImage("lazer.png");
 
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
  rays_left = 8;
 
  //load font
  font = loadFont("Arial-Black-48.vlw");
 
  //state the player's position LEVEL 1
  player_x = 5;
  player_y = 1;
 
  //setup array for different objects in the level
  level = new char[columns][rows];
 
  //locations for walls LEVEL 1
  level[0][0] = level[0][1] = level[0][2] = level[0][3] = level[0][4] = level[0][5] = level[0][6] = level[0][7] = level[0][8] = level[0][9] = level[0][10] = level[1][0] = level[1][10] = level[0][5] =
    level[2][0] = level[2][5] = level[2][6] = level[2][7] = level[2][8] = level[2][10] = level[3][0] = level[3][5] = level[3][6] = level[3][7] = level[3][8] = level[3][10] = level[4][0] = level[4][0] =
    level[4][5] = level[4][6] = level[4][7] = level[4][8] = level[4][10] = level[5][0] = level[5][0] = level[5][5] = level[5][6] = level[5][7] = level[5][8] = level[5][10] = level[6][0]  = level[6][1] =
    level[6][2] = level[6][3] = level[6][4] = level[6][5] = level[6][6] = level[6][7] = level[6][8] = level[6][10] = level[7][0] = level[7][1] = level[7][2] = level[7][3] = level[7][4] = level[7][5] =
    level[7][6] = level[7][7]  = level[7][8] = level[7][10] = level[8][0] = level[8][1] = level[8][2] = level[8][3] = level[8][4] = level[8][5] = level[8][6] = level[8][7] = level[8][8] = level[8][10] =
    level[9][0] = level[9][1] = level[9][10] = level[10][0] = level[10][1] = level[10][10] = level[11][0] = level[11][1] = level[11][7] = level[11][8] = level[11][9] = level[11][10] = level[12][0] =
    level[12][1] = level[12][7] = level[12][8] = level[12][9] = level[12][10] = level[13][0] = level[13][1] = level[13][7] = level[13][8] = level[13][9] = level[13][10] = level[14][0] = level[14][1] =
    level[14][7] = level[14][8] = level[14][9] = level[14][10] = level[15][0] = level[15][1] = level[15][7] = level[15][8] = level[15][9] = level[15][10] = level[16][0] = level[16][1] = level[16][2] =
    level[16][3] = level[16][4] = level[16][5] = level[16][6] = level[16][7] = level[16][8] = level[16][9] = level[16][10] = level[2][2] = level[2][3] = level[4][2] = level[5][2] = level[9][8] = level[10][6] =
    level[11][6] = level[9][4] = level[10][4] = level[10][3] = level[12][2] = level[11][4] = level[12][4] = level[13][4] = level[14][4] = level[14][3] = level[15][6] = level[4][4] = level[13][5] = 'w';
 
  //initial location for player LEVEL 1
  level[5][1] = 'c';
 
  //locations for light rays LEVEL 1 --- 8 of them
  level[1][1] = level[1][9] = level[10][9] = level[5][4]  = level[9][3] = level[15][2] = level[9][5] = level[15][5] = 'l'; //THERE ARE 8 OF THEM
 
  //locations for traps LEVEL 1 THERE IS ONE OF THEM
  level[3][2] = 't';
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
    background(random(255));
 
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
          image(noclip, i * cellsize, j * cellsize, cellsize, cellsize);
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
          image (PCsprite, player_x + 50 , player_y + 50, 80, 80);
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
 
    fill (random(170));
    textFont(font);
    textSize(24);
    text ("HERP = " + printed_rays, 0, 20, 128);
    text ("DERP = " + rays_left, 0, 44, 128);
    text ("thegameislost" , 0, 64, 149);
    text ("mr woodard" + rays_left, 0, 44, 128);
    text ("teancirsgeadg" , 0, 194, 186);
    text ("C:|Windows|Branding|ShellBrd|shellbrd.dll", 0, 164, 186);
    text ("C:|Program Files (x86)|Steam|steamapps|wikipedianmarlith|team fortress 2|hl2.exe", 0, 224, 186);
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
      background(204,153,0);
      fill (204,153,120);
      textFont(font);
      text("You Died! Try Again!", width/5, height / 2);
      text("Hit M to restart...", width/5 + 50, height / 2 + 50);
      text ("C:|Windows|Branding|ShellBrd|shellbrd.dll", 0, 164, 186);
      text("PSYCHOLOGY PERIOD D.", width/5 +60, height / 2 +40);
      text("MRWOODARD.", width/5 +110, height / 2 +140);
      alive = false;  //kill player
    }
 
    //Print level complete Conditions
    //LEVEL 1
    if (collected_rays == 8)
    {
      noLoop();  //stops program from running too far ahead
      background(85);
      fill (60);
      textFont(font);
      text("You Died!!", width/5, height / 2);
      text("Hit C to try again.", width/5 + 50, height / 2 + 50);
      text("PSYCHOLOGY PERIOD D.", width/5 +60, height / 2 +40);
      text("MRWOODARD.", width/5 +110, height / 2 +140);
    }
 
    //second level complete? check
    if (collected_rays == 46)
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
      background(0);
      fill (0);
      textFont(font);
      text("You Win!", width/3, height / 2);
      text("Press R to replay", width/4, height / 2 + 50);
    }
 
    //commands for moving onto next level
    //LEVEL 2 (from level 1)
    if (collected_rays == 9)
    {
      loop();
      collected_rays++;
      alive = true;
      level = new char[columns][rows];
      printed_rays = 0;
      rays_left = 34;
 
      //INITIAL LOCATION OF PLAYER
      player_x = 1;
      player_y = 1;
 
      //locations for walls
   
        level[13][0] = level[13][12] = level[14][0] = level[14][12] = level[15][0] = level[15][3] = level[15][4] = level[15][7] = level[15][8] = level[15][9] = level[15][12] = level[16][0] = level[16][12] = level[17][0] =
        level[17][12] = level[18][0] = level[18][1] = level[18][2] = level[18][3] = level[18][6] = level[18][7] = level[18][8] = level[18][9] = level[18][10] = level[18][11] = level[18][12] = level[19][0] =
        level[19][6] = level[19][12] = level[20][0] = level[20][10] = level[20][12] = level[21][0] = level[21][3] = level[21][10] = level[21][12] = level[22][0] = level[22][1] = level[22][2] = level[22][3] = level[22][4] =
        level[22][5] = level[22][6] = level[22][7] = level[22][8] = level[22][9] = level[22][10] = level[22][11] = level[22][12] = 'w';
 
      //initial location for player
      level[1][1] = 'c';
 
      //locations for light rays ---- 34 OF THEM
      level[1][5] = level[2][5] = level[2][10] = level[4][6] = level[4][9] = level[5][10] = level[6][1] = level[6][2] = level[6][5] = level[7][6] = level[7][7] = level[7][11] =
        level[8][6] = level[8][7] = level[8][10] = level[8][11] = level[9][2] = level[9][10] = level[10][3] = level[11][7] = level[12][3] = level[13][9] = level[14][10] = level[15][1] =
        level[15][5] = level[15][6] = level[15][11] = level[16][2] = level[17][8] = level[19][2] = level[19][4] = level[20][3] = level[20][7] = level[21][6] = level[21][11] = 'l';
 
      //locations for traps ---- 9 OF THEM
      level[3][7] = level[3][11] = level[6][4] = level[12][4] = level[12][6] = level[15][2] = level[15][10] = level[18][5] = level[21][6] = 't';
      
      //locations for noclips
         level[0][0] = level[0][1] = level[0][2] = level[0][3] = level[0][4] = level[0][5] = level[0][6] = level[0][7] = level[0][8] = level[0][9] = level[0][10] = level[0][11] = level[0][12] =
        level[1][0] = level[1][9] = level[1][12] = level[2][0] = level[2][9] = level[2][12] = level[3][0] = level[3][1] = level[3][2] = level[3][3] = level[3][4] = level[3][5] = level[3][6] = level[3][9] =
        level[3][12] = level[4][0] = level[4][3] = level[4][12] = level[5][0] = level[5][3] = level[5][12] = level[6][0] = level[6][3] = level[6][6] = level[6][7] = level[6][8] = level[6][9]  = level[6][10] =
        level[6][11] = level[6][12] = level[7][0] = level[7][9] = level[7][12] = level[8][0] = level[8][9] = level[8][12] = level[9][0] = level[9][3] = level[9][4] = level[9][5] = level[9][6] = level[9][7] =
        level[9][8] = level[9][9]  = level[9][12] = level[10][0] = level[10][5] = level[10][12] = level[11][0] = level[11][5] = level[11][12] = level[12][0] = level[12][1] = level[12][2] = level[12][5] = level[12][8] =
        level[12][9] = level[12][10] = level[12][11] = level[12][12] = 'z';
    }
 
    //LEVEL 3
    if (collected_rays == 45)
    {
      loop();
      alive = true;
    
      collected_rays++;
      level = new char[columns][rows];
 
      printed_rays = 0;
      rays_left = 54;
 
      //INITIAL LOCATION OF PLAYER
      player_x = 0;
      player_y = 0;
      //locations for walls
      level[2][0] = level[3][0] = level[16][0] = level[20][0] = level[3][1] = level[5][1] = level[7][1] = level[8][1] = level[9][1] = level[10][1] = level[11][1] = level[12][1] =
        level[13][1] = level[14][1] = level[16][1] = level[18][1] = level[20][1] = level[1][2] = level[5][2] = level[7][2] = level[11][2] = level[14][2] = level[18][2] = level [22][2] = 
        level[0][3] = level[1][3] = level[3][3] = level[4][3] = level[5][3] = level[7][3] = level[9][3] = level[11][3] = level[13][3] = level[14][3] = level[15][3] = level[16][3] =
        level[17][3] = level[18][3] = level[19][3] = level[20][3] = level[21][3] = level[22][3] = level[3][4] = level[7][4] = level[9][4] = level[11][4] = level[14][4] = level[1][5] = level[2][5] = level[3][5]=
        level[5][5] = level[7][5] = level[9][5] = level[11][5] = level[12][5] = level[14][5] = level[16][5] = level[17][5] = level[18][5] = level[19][5] = level[20][5] = level[21][5] = level[3][6] = level[5][6] =
        level[9][6] = level[16][6] = level[1][7] = level[2][7] = level[3][7] = level[4][7] = level[5][7] = level[6][7] = level[8][7] = level[9][7] = level[10][7] = level[11][7] = level[12][7] = level[14][7] =
        level[15][7] = level[16][7] = level[18][7] = level[19][7] = level[20][7] = level[21][7] = level[22][7] = level[1][8] = level[5][8] = level[8][8] = level[12][8] = level[14][8] = level[16][8] = level[3][9] = 
        level[5][9] = level[7][9] = level[8][9] = level[10][9] = level[12][9] = level[14][9] = level[16][9] = level[20][9] = level[21][9] = level[22][9] = level[0][10] = level[1][10] = level[2][10] = level[3][10]=
        level[5][10] = level[8][10] = level[11][10] = level[12][10] = level[14][10] = level[16][10]= level[18][10] = level[5][11] = level[6][11] = level[10][11] = level[10][11] = level[12][11] = level[13][11] = 
        level[14][11] = level[16][11] = level[18][11] = level[20][11] = level[21][11] = level[22][11] = level[3][12] = level[5][12] = level[11][12] = level[12][12] = level[16][12] = level[18][12] = 'w';
 
      //initial location for player
      level[0][0] = 'c';
 
      //locations for light rays
      level[2][1] = level[0][2] = level[4][9] = level[9][3] = level[10][3] = level[11][2] = level[11][3] = level[15][12] = level[6][6] = level[4][2] 
        = level[8][3] = level[11][2] = level[12][4] = level[3][12] = level[0][7] = level[15][0] = level[17][0] = level[2][9] = level[5][4] = level[8][6]
        = level[10][6] = level[14][6] = level[19][6] = level[22][5] = level[19][2] = level[15][2] = level[17][2] = level[22][1] = level[22][0] = level[18][4] 
        = level[7][7] = level[13][7] = level[17][7] = level[8][3] = level[8][10] = level[15][8] = level[0][8] = level[20][8] = level[6][9] = level[9][9] 
        = level[11][9] = level[13][9] = level[14][9] = level[4][10] = level[17][10] = level[20][10] = level[0][11] = level[7][11] = level[8][11] = level[15][11] 
        = level[16][11] = level[18][11] = level[0][12] = level[6][12] = level[14][12] = level[17][12] = level[19][12] = level[2][6] = level[4][6] = 'l';
 
      //locations for traps
      level[3][11] = level[1][11] = level[22][12] = level[22][10] = level[22][8]
        = level[18][8] = level[14][2] = level[10][10] = level[10][12] = level[22][5] =
        't';
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
  if (key == 'c' && collected_rays == 8 )//|| collected_rays == 44)
  {
    loop();
    collected_rays++;
  }
 
  else if (key == 'v' && collected_rays == 44 )//|| collected_rays == 44)
  {
    loop();
    collected_rays++;
  }
 
  //DEBUGGING TOOL KEY
  /*if (key == 'q')
   {
   collected_rays = collected_rays + 1;
   }*/
 
  //give LEVEL 1 restart level function --- WHEN YOU DIE IN LEVEL 1
  if (key == 'm' && alive == false && collected_rays < 9)
  {
    loop();
    //THIS ENTIRE IF COMMAND RESETS THE ENTIRE LEVEL
    //reset number of rays
    collected_rays = 0;
    printed_rays = 0;
    rays_left = 8;
    alive = true;  //reset character
 
    //INIT LOCATION OF PLAYER
    player_x = 5;
    player_y = 1;
 
    level = new char[columns][rows];
 
    //locations for walls
    level[0][0] = level[0][1] = level[0][2] = level[0][3] = level[0][4] = level[0][5] = level[0][6] = level[0][7] = level[0][8] = level[0][9] = level[0][10] = level[1][0] = level[1][10] = level[0][5] =
      level[2][0] = level[2][5] = level[2][6] = level[2][7] = level[2][8] = level[2][10] = level[3][0] = level[3][5] = level[3][6] = level[3][7] = level[3][8] = level[3][10] = level[4][0] = level[4][0] =
      level[4][5] = level[4][6] = level[4][7] = level[4][8] = level[4][10] = level[5][0] = level[5][0] = level[5][5] = level[5][6] = level[5][7] = level[5][8] = level[5][10] = level[6][0]  = level[6][1] =
      level[6][2] = level[6][3] = level[6][4] = level[6][5] = level[6][6] = level[6][7] = level[6][8] = level[6][10] = level[7][0] = level[7][1] = level[7][2] = level[7][3] = level[7][4] = level[7][5] =
      level[7][6] = level[7][7]  = level[7][8] = level[7][10] = level[8][0] = level[8][1] = level[8][2] = level[8][3] = level[8][4] = level[8][5] = level[8][6] = level[8][7] = level[8][8] = level[8][10] =
      level[16][4] = level[16][5] = level[16][6] = level[16][7] = level[16][8] = level[16][9] = level[16][10] = level[2][2] = level[2][3] = level[4][2] = level[5][2] = level[9][8] = level[10][6] =
      level[11][6] = level[9][4] = level[10][4] = level[10][3] = level[12][2] = level[11][4] = level[12][4] = level[13][4] = level[14][4] = level[14][3] = level[15][6] = level[4][4] = level[13][5] = 'w';
 
    //initial location for player
    level[5][1] = 'c';
 
    //locations for light rays
    level[1][1] = level[1][9] = level[10][9] = level[5][4]  = level[9][3] = level[15][2] = level[9][5] = level[15][5] = 'l';
 
    //locations for traps
    level[3][2] = 't';
    
    //locations for noclips
     level[5][1] = level[9][0] = level[9][1] = level[9][10] = level[10][0] = level[10][1] = level[10][10] = level[11][0] = level[11][1] = level[11][7] = level[11][8] = level[11][9] = level[11][10] = level[12][0] =
      level[12][1] = level[12][7] = level[12][8] = level[12][9] = level[12][10] = level[13][0] = level[13][1] = level[13][7] = level[13][8] = level[13][9] = level[13][10] = level[14][0] = level[14][1] =
      level[14][7] = level[14][8] = level[14][9] = level[14][10] = level[15][0] = level[15][1] = level[15][7] = level[15][8] = level[15][9] = level[15][10] = level[16][0] = level[16][1] = level[16][2] =
      level[16][3] = 'z';
  }
 
  //COMMAND FOR RESETTING LEVEL 2
  if (key == 'm' && alive == false && collected_rays > 9 && collected_rays <= 44)
  {
    loop();
    collected_rays = 9;
    alive = true;
    printed_rays = 0;
    rays_left = 34;
  }
 
  //COMMAND FOR RESETTING LEVEL 3
  if (key == 'm' && alive == false && collected_rays > 44 && collected_rays <= 99)
  {
    loop();
    collected_rays = 45;
    alive = true;
    printed_rays = 0;
    rays_left = 54;
  }
 
  //command for restarting game
  if (key == 'r' && win == true)
  {
    loop();
    collected_rays = 0;
    printed_rays = 0; 
    rays_left = 8;
    win = false;
    state = 0;
    alive = true;  //reset character
 
    //INIT LOCATION OF PLAYER
    player_x = 5;
    player_y = 1;
 
    level = new char[columns][rows];
 
    //locations for walls
    level[0][0] = level[0][1] = level[0][2] = level[0][3] = level[0][4] = level[0][5] = level[0][6] = level[0][7] = level[0][8] = level[0][9] = level[0][10] = level[1][0] = level[1][10] = level[0][5] =
      level[2][0] = level[2][5] = level[2][6] = level[2][7] = level[2][8] = level[2][10] = level[3][0] = level[3][5] = level[3][6] = level[3][7] = level[3][8] = level[3][10] = level[4][0] = level[4][0] =
      level[4][5] = level[4][6] = level[4][7] = level[4][8] = level[4][10] = level[5][0] = level[5][0] = level[5][5] = level[5][6] = level[5][7] = level[5][8] = level[5][10] = level[6][0]  = level[6][1] =
      level[6][2] = level[6][3] = level[6][4] = level[6][5] = level[6][6] = level[6][7] = level[6][8] = level[6][10] = level[7][0] = level[7][1] = level[7][2] = level[7][3] = level[7][4] = level[7][5] =
      
 
    //initial location for player
    level[5][1] = 'c';
 
    //locations for light rays
    level[1][1] = level[1][9] = level[10][9] = level[5][4]  = level[9][3] = level[15][2] = level[9][5] = level[15][5] = 'l';
 
    //locations for traps
    level[3][2] = 't';
    
    //locations for noclips
    level[7][6] = level[7][7]  = level[7][8] = level[7][10] = level[8][0] = level[8][1] = level[8][2] = level[8][3] = level[8][4] = level[8][5] = level[8][6] = level[8][7] = level[8][8] = level[8][10] =
      level[9][0] = level[9][1] = level[9][10] = level[10][0] = level[10][1] = level[10][10] = level[11][0] = level[11][1] = level[11][7] = level[11][8] = level[11][9] = level[11][10] = level[12][0] =
      level[12][1] = level[12][7] = level[12][8] = level[12][9] = level[12][10] = level[13][0] = level[13][1] = level[13][7] = level[13][8] = level[13][9] = level[13][10] = level[14][0] = level[14][1] =
      level[14][7] = level[14][8] = level[14][9] = level[14][10] = level[15][0] = level[15][1] = level[15][7] = level[15][8] = level[15][9] = level[15][10] = level[16][0] = level[16][1] = level[16][2] =
      level[16][3] = level[16][4] = level[16][5] = level[16][6] = level[16][7] = level[16][8] = level[16][9] = level[16][10] = level[2][2] = level[2][3] = level[4][2] = level[5][2] = level[9][8] = level[10][6] =
      level[11][6] = level[9][4] = level[10][4] = level[10][3] = level[12][2] = level[11][4] = level[12][4] = level[13][4] = level[14][4] = level[14][3] = level[15][6] = level[4][4] = level[13][5] = 'z';
  }
}


