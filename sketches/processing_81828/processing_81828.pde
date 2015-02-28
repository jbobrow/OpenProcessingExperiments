

/**
This is the main class containing the state transitions and managing transitions between them,
as well as all the necessary data in the form of images and level grids
**/
import ddf.minim.*;
Minim minim;
AudioPlayer music; // AudioPlayer uses less memory. Better for music.
AudioSample sndJump, sndFood, sndRight, sndWrong, sndAttack, sndHit, sndWin, sndLose;
int buffersize = 1024;
//Game states
final int stateWelcomeScreenDisplay=0;
final int stateGame=1;
final int stateShowInstructions= 2;
final int pauseGame = 3;
final int stateGameOver = 4;
final int stateBossLevel = 5;
final int stateWon = 6;
final int stateInformation = 7;
final int stateEndGame = 8;
final int stateHighScore = 9;

int instrcounter;
PImage[] instrimages;
PImage[] levelinfoimages;
int stateOfProgram = stateWelcomeScreenDisplay;

//Button positions for various menus

int instrbuttonx = 90;
int instrbuttony = 425;
int startbuttonwidth = 360; int startbuttonheight = 90; int startbuttonx = 90; int startbuttony = 350;
int resumebuttonwidth = 175; int resumebuttonheight = 50; int resumebuttonx = 180; int resumebuttony = 200;
int quitbuttonwidth = 125; int quitbuttonheight = 50; int quitbuttonx = 210; int quitbuttony = 260;

color buttonColor;
PFont bigfont, biggerfont;
PImage bg,startbutton, startbuttonhover, resumebutton, resumebuttonhover, quitbutton, quitbuttonhover, nextlevel,nextlevelhover, submitbutton,submithover, hiscoresbutton, hiscoreshover, pause, gameover,victory, endgame, hiscores;
PImage instructionbutton, instructionbuttonhover, instr1,instr2,instr3,instr4,levelinfo1,levelinfo2,levelinfo3,backbutton,backbuttonhover,nextbutton,nextbuttonhover;

GameLevel level; //The current level
GameLevel icelevel,ovenlevel,sinklevel; //Names of individual levels

int timetospare = 0; //for accumulating user's total time across 3 levels
boolean startGame;
boolean startBossLevel;
boolean showInstr;
boolean resumeGame;
boolean quitGame;
boolean goback;
boolean goforward;
boolean showLevelInfo;
boolean showHighScores;

boolean saveScore;
boolean[] states;
final int MY_WIDTH = 560 ;
final int MY_HEIGHT = 560 ;

GameLevel[] levels = new GameLevel[3]; //Array to hold the game levels
int levelcounter = 0;
String username = ""; //Name for high score table
String icehint,icesolved,ovenhint,ovensolved,sinkhint,sinksolved; //Text hints and solved messages for each level
Enemy[] iceenemies = new Enemy[7];
Food[] icefoods = new Food[7];
Enemy[] ovenenemies = new Enemy[7];
Food[] ovenfoods = new Food[8] ;
Enemy[] sinkenemies = new Enemy[7];
Food[] sinkfoods = new Food[8];

void setup(){
  minim = new Minim(this);
  sndJump = minim.loadSample("jumpy.mp3", buffersize);
  sndHit = minim.loadSample("ow.mp3",buffersize);
  sndFood = minim.loadSample("yay.mp3",buffersize);
  sndAttack = minim.loadSample("fire.mp3",buffersize);
  sndRight = minim.loadSample("correct.WAV",buffersize);
  sndWrong = minim.loadSample("wrong.mp3",buffersize);
  
  //Set the font
  bigfont = createFont("ITCKrist.TTF",24);
  biggerfont = createFont("ITCKrist.TTF",36);
  textFont(bigfont);

  //Images for buttons and background screen
  bg = loadImage("startscreen.jpg");
  gameover = loadImage("gameover.png");
  instructionbutton = loadImage("instruction.jpg"); instructionbuttonhover = loadImage("instructionhover.jpg");
  startbutton = loadImage("startbutton.jpg"); startbuttonhover = loadImage("startbuttonhover.jpg");
  resumebutton = loadImage("resumebutton.jpg"); resumebuttonhover = loadImage("resumebuttonhover.jpg");
  quitbutton = loadImage("quitbutton.jpg"); quitbuttonhover = loadImage("quitbuttonhover.jpg");
  submitbutton = loadImage("submit.jpg"); submithover = loadImage("submithover.jpg");
  pause = loadImage("paused.png");
  victory = loadImage("victory.png");
  endgame = loadImage("endscreen.jpg");
  nextlevel = loadImage("nextlevel.jpg"); nextlevelhover = loadImage("nextlevelhover.jpg");
  hiscores = loadImage("hiscores.jpg");
  hiscoresbutton = loadImage("hiscoresbutton.jpg"); hiscoreshover = loadImage("hiscoreshover.jpg");
  //Images and buttons for viewing instructions
  instr1 = loadImage("instructions1.jpg"); instr2 = loadImage("instructions2.jpg"); instr3 = loadImage("instructions3.jpg"); instr4 = loadImage("instructions4.jpg");
  instrimages = new PImage[]{instr1,instr2,instr3,instr4};
  instrcounter = 0;
  nextbutton = loadImage("nextbutton.jpg"); nextbuttonhover = loadImage("nextbuttonhover.jpg");
  backbutton = loadImage("backbutton.jpg"); backbuttonhover = loadImage("backbuttonhover.jpg");
  
  //Level information images
  levelinfo1 = loadImage("level1instr.jpg"); levelinfo2 = loadImage("level2instr.jpg"); levelinfo3 = loadImage("level3instr.jpg");
  levelinfoimages = new PImage[]{levelinfo1,levelinfo2,levelinfo3};
  
 
  size(MY_WIDTH,MY_HEIGHT); //Set the window size
  buttonColor = color(123,123,255);
  
  //Initialise the levels with their relevant images
  levels[0] = icelevel = new GameLevel("iceback.jpg","iceplatform.png","pot.png","ladder.png","exit.png","exitice.png","chilli.png","giufire.png","fire.mp3","mussel.png","MUSSELINI");
  levels[1] = ovenlevel = new GameLevel("ovenback.jpg","tileplatform.png","pot.png","ladder.png","exit.png","exitrock.png","salad.png","giupunch.png","punch.mp3","scone.png","BURNTASCONI");
  levels[2] = sinklevel = new GameLevel("sinkback.jpg","sinkplatform.png","pot.png","ladder.png","exit.png","exitsink.png","currentbun.png","giuthunder.png","thunder.mp3","meatball.png","FLYING SPAGHETTI MONSTER");
  states = new boolean[]{startGame,startBossLevel,showInstr,resumeGame,quitGame,goback,goforward};
}

//Load the relevant level
void loadLevel(int levelcounter){
  if(levelcounter ==0)loadIceLevel();
  else if(levelcounter == 1)loadOvenLevel();
  else loadSinkLevel();
}
void loadSinkLevel(){
    sinkhint = "For some shocking fun, you'll need a currant bun!";
  sinksolved = "Ate the current bun! Press SPACE to unleash a shock!";
  sinklevel.setHint(sinkhint);
  sinklevel.setSolved(sinksolved);
  sinklevel.setGravity(0.5);
  sinklevel.setAirFriction(0.88);
  sinkfoods[7] = new Food(0,0,loadImage("currentbun.png"),"Current Bun",true);
  sinkfoods[6] = new Food(0,0,loadImage("sugar.png"),"Sugar",true);
  sinkfoods[5] = new Food(0,0,loadImage("flour.png"),"Flour",true);
  sinkfoods[4] = new Food(0,0,loadImage("egg.png"),"Egg",true);
  sinkfoods[3] = new Food(0,0,loadImage("butter.png"),"Butter",true);
  sinkfoods[2] = new Food(0,0,loadImage("currants.png"),"Currants",true);
  sinkfoods[1] = new Food(0,0,loadImage("tomato.png"),"Tomato",false);
  sinkfoods[0] = new Food(0,0,loadImage("sauce.png"),"Hot Sauce",false);
  sinklevel.setFoods(sinkfoods);
  sinkenemies[0] = new Enemy(0,0,0,0,loadImage("pea.png"),true,false);
  sinkenemies[1] = new Enemy(0,0,0,0,loadImage("pea.png"),true,false);
  sinkenemies[2] = new Enemy(0,0,0,0,loadImage("pea.png"),true,false);
  sinkenemies[3] = new Enemy(0,0,0,0,loadImage("pea.png"),true,false);
  sinkenemies[4] = new Enemy(0,0,0,0,loadImage("fishbones.png"),true,true);
  sinkenemies[5] = new Enemy(0,0,0,0,loadImage("fishbones.png"),true,true);
  sinkenemies[6] = new Enemy(0,0,0,0,loadImage("fishbones.png"),true,true);
  sinklevel.setEnemies(sinkenemies);
   int[][] bossGrid = {{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},
                    {0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},
                    {0,2,0,0,0,0,0,0},{1,1,1,1,1,1,1,1}};
  int[][] grid = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
{0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,1,1,0,0,0},
{0,0,0,1,1,1,0,0,1,1,1,1,1,0,0,0,0,0,0,0},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,6,0,0,4,0,0,1,0,0,1,7,1,0,0},
{0,0,0,1,0,1,1,1,1,1,1,0,0,0,0,0,7,0,0,0},
{0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,7,0,0,0},
{0,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,7,4,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,1},
{0,0,0,0,0,1,0,0,1,1,1,0,0,0,0,0,0,0,0,0},
{0,0,0,1,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0},
{4,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0},
{1,1,7,1,1,1,7,1,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,7,0,0,0,7,0,0,0,0,0,1,1,1,0,0,0,0,0},
{0,0,7,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,4,0},
{1,1,1,0,0,0,7,0,0,0,0,0,0,0,1,7,1,1,1,1},
{0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,7,0,0,0,0},
{0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,7,0,0,0,0},
{0,1,1,1,1,0,1,0,0,0,0,0,0,0,0,7,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0},
{0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,2,0},
{0,0,8,5,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1},
{0,0,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0}};
sinklevel.setGrids(grid,bossGrid);
}
void loadOvenLevel(){
  ovenhint = "For a rock-breaking punch, make a healthy lunch!";
  ovensolved = "Ate the super salad! Press SPACE to punch like The Hulk!";
  ovenlevel.setHint(ovenhint);
  ovenlevel.setSolved(ovensolved);
  ovenfoods[7] = new Food(0,0,loadImage("salad.png"),"Super Salad",true);
  ovenfoods[6] = new Food(0,0,loadImage("tomato.png"),"Tomato",true);
  ovenfoods[5] = new Food(0,0,loadImage("lettuce.png"),"Lettuce",true);
  ovenfoods[4] = new Food(0,0,loadImage("cucumber.png"),"Cucumber",true);
  ovenfoods[3] = new Food(0,0,loadImage("bellpepper.png"),"Bell Pepper",true);
  ovenfoods[2] = new Food(0,0,loadImage("jam.png"),"Jam",false);
  ovenfoods[1] = new Food(0,0,loadImage("cheese.png"),"Cheese",false);
  ovenfoods[0] = new Food(0,0,loadImage("sugar.png"),"Sugar",false);
  ovenlevel.setFoods(ovenfoods);
  ovenenemies[0] = new Enemy(0,0,0,0,loadImage("fireball.png"),true,false);
  ovenenemies[1] = new Enemy(0,0,0,0,loadImage("fireball.png"),true,false);
  ovenenemies[2] = new Enemy(0,0,0,0,loadImage("fireball.png"),true,false);
  ovenenemies[3] = new Enemy(0,0,0,0,loadImage("greasemon.png"),true,true);
  ovenenemies[4] = new Enemy(0,0,0,0,loadImage("fireball.png"),true,false);
  ovenenemies[5] = new Enemy(0,0,0,0,loadImage("greasemon.png"),true,true);
  ovenenemies[6] = new Enemy(0,0,0,0,loadImage("greasemon.png"),true,true);
  ovenlevel.setEnemies(ovenenemies);
int[][] bossGrid = {{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{1,0,0,0,0,0,0,0},
                    {0,0,0,1,0,0,0,1},{1,0,0,0,0,0,0,0},{0,0,0,1,0,0,0,1},
                    {1,2,0,0,0,0,0,0},{1,1,1,1,1,1,1,1}};
  int[][] grid = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7,0,0,0,0},
{1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,7,1,1,1,1},{0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,7,0,0,0,0},
{0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0},{0,0,0,0,0,0,0,4,0,0,0,0,1,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,1,1,7,0,0,0,0,0,0,0,0},{0,0,0,4,0,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0},
{0,0,0,1,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,7,0,0,1,0,1,0,0,0},
{0,0,0,0,0,0,0,0,1,1,1,7,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,7,0,0,0,0,0,4,0,0},
{1,1,0,0,0,0,0,0,0,0,0,7,0,0,0,0,1,1,7,1},{0,0,0,0,0,0,0,0,0,0,0,7,0,0,0,0,0,0,7,0},
{0,0,0,0,0,0,0,0,0,0,0,7,1,1,1,0,0,0,7,0},{4,0,0,0,0,0,0,0,0,0,0,7,0,0,0,0,0,0,7,0},
{1,1,1,0,0,0,0,0,0,0,0,7,0,0,0,0,0,1,1,1},{0,0,2,0,0,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0},
{0,5,8,0,0,0,0,0,6,0,4,7,0,0,0,0,0,0,0,0},{0,1,1,0,7,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0},
{0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0},{0,0,0,0,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0},
{1,0,0,0,7,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1},{0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
  ovenlevel.setGrids(grid,bossGrid);
}
void loadIceLevel(){
  icehint = "To  melt the ice, get some chilli spice!";
  icesolved = "Ate the red hot chilli! Press SPACE to breath fire!";
  icelevel.setHint(icehint);
  icelevel.setSolved(icesolved);
  icelevel.setFriction(0.96);
  icefoods[6] = new Food(0,0,loadImage("chilli.png"),"RED HOT CHILLI",true);
  icefoods[5] = new Food(0,0,loadImage("beans.png"),"Kidney Beans",true); //'true' means that the food is needed to finish the level
  icefoods[4] = new Food(0,0,loadImage("pepper.png"),"Chilli Pepper",true);
  icefoods[3] = new Food(0,0,loadImage("sauce.png"),"Hot Sauce",true);
  icefoods[2] = new Food(0,0,loadImage("banana.png"),"Banana",false);
  icefoods[1] = new Food(0,0,loadImage("egg.png"),"Egg",false);
  icefoods[0] = new Food(0,0,loadImage("sugar.png"),"Sugar",false);
  icelevel.setFoods(icefoods);
  iceenemies[0] = new Enemy(0,0,0,0,loadImage("icecube.png"),true,false);
  iceenemies[1] = new Enemy(0,0,0,0,loadImage("icecube.png"),true,false);
  iceenemies[2] = new Enemy(0,0,0,0,loadImage("icelolly.png"),true,true);
  iceenemies[3] = new Enemy(0,0,0,0,loadImage("icecube.png"),true,false);
  iceenemies[4] = new Enemy(0,0,0,0,loadImage("icecube.png"),true,false);
  iceenemies[5] = new Enemy(0,0,0,0,loadImage("icelolly.png"),true,true);
  iceenemies[6] = new Enemy(0,0,0,0,loadImage("icecube.png"),true,false);
  icelevel.setEnemies(iceenemies);
  int[][] bossGrid = {{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{1,0,0,0,0,0,0,0},
                    {0,0,0,1,0,0,0,1},{1,0,0,0,0,0,0,0},{0,0,0,1,0,0,0,1},
                    {1,2,0,0,0,0,0,0},{1,1,1,1,1,1,1,1}};
  int[][] grid = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,5,0},
{0,0,2,0,1,4,0,0,0,0,0,0,0,0,0,0,1,1,1,1},
{0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0},
{1,7,1,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0},
{0,7,0,0,0,0,0,0,0,4,0,0,1,0,0,0,7,1,0,0},
{0,7,0,0,0,0,0,0,0,1,1,0,0,0,0,0,7,0,0,0},
{0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7,0,0,0},
{1,1,1,1,0,0,1,0,0,0,0,1,0,0,0,0,7,4,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,1},
{0,0,0,0,0,1,0,0,1,1,1,0,0,0,0,0,0,0,0,0},
{0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,7,1},
{0,0,0,0,0,1,7,1,0,0,0,0,0,0,0,0,0,0,7,0},
{0,0,0,0,0,0,7,0,0,0,1,7,1,1,1,0,0,0,7,0},
{4,0,0,0,0,0,7,0,0,0,0,7,0,0,0,0,0,0,7,0},
{1,1,1,0,0,0,7,0,0,0,0,7,0,0,0,0,0,1,1,1},
{0,0,0,0,0,0,7,0,0,0,0,7,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,7,4,6,0,0,7,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0},
{0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,1,0,0,0,0,0,0,4,0,0,0,0,1,1},
{0,0,1,1,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0}};
icelevel.setGrids(grid,bossGrid);
}

//Check if user presses buttons
void update(int x, int y) {
 for(int i = 0; i < states.length; i++){
   states[i] = false;
 }
switch(stateOfProgram){
  
 case stateWelcomeScreenDisplay: //Welcome screen

 if ( startPressed(startbuttonx, startbuttony, startbuttonwidth, startbuttonheight)) { //Start game
     showLevelInfo = true; 
    image(startbuttonhover,startbuttonx,startbuttony);
  } 
  else showLevelInfo = false;
  if ( startPressed(instrbuttonx, instrbuttony, startbuttonwidth, startbuttonheight)) { //Show instructions
    showLevelInfo = false;
    quitGame = false;
    showInstr = true; 
    image(instructionbuttonhover,instrbuttonx,instrbuttony);
  } 
  else{showInstr = false;}
  if(startPressed(150,500,startbuttonwidth,startbuttonheight)){ //Show hi-scores
    showHighScores = true;
    image(hiscoreshover,150,500);
  }
  else{showHighScores = false;}
  break;
  
 case stateEndGame: //Game completed
 if(startPressed(210,520,125,50)){ //Submit a high score
   saveScore = true;
   image(submithover,210,520);
 }
 else{
    saveScore = false;
 }
 case stateHighScore: //Viewing hi-scores
 if(startPressed(50,500,quitbuttonwidth,quitbuttonheight)){ //Go back
    image(backbuttonhover,50,500);
    quitGame = true;
    }
 else
   quitGame = false;
    break;
 case pauseGame: //Game paused
    startGame = false;

  if(startPressed(resumebuttonx, resumebuttony,resumebuttonwidth,resumebuttonheight)){ //Resume
    image(resumebuttonhover,resumebuttonx,resumebuttony);
   resumeGame = true;
  }
  else{resumeGame = false;}
  if(startPressed(quitbuttonx, quitbuttony, quitbuttonwidth,quitbuttonheight)){ //Quit
  image(quitbuttonhover,quitbuttonx,quitbuttony);
    startGame = false;
    resumeGame = false;
    quitGame = true;
  }
  else{quitGame = false;}
  break;
 case stateWon: //Level victory
 if(startPressed(90,240,startbuttonwidth,startbuttonheight)){ //Continue to next level
    startGame = false;
    resumeGame = false;
    showLevelInfo = true;
    image(nextlevelhover,90,240); 
 }
 else{showLevelInfo = false;}
    break;
case stateInformation: //Information on succeding level
   if(startPressed(90,480,startbuttonwidth,startbuttonheight)){ //Continue
     startGame = true;
     showLevelInfo = false;
     image(nextlevelhover,90,480);
   }
   else{startGame = false;}
   break;
 case stateGameOver: //Game lost
 if(startPressed(90,240,startbuttonwidth,startbuttonheight)){ //Start again
    startGame = true;
    image(startbuttonhover,90,240); 
}
else{startGame = false;}
if(startPressed(200,360,quitbuttonwidth,quitbuttonheight)){ //Quit
    quitGame = true;
    startGame = false;
    resumeGame = false;
    image(quitbuttonhover,200,360);
}
else{quitGame = false;}
  break; 
  case stateShowInstructions: //Viewing instructions
    if(startPressed(50,500,quitbuttonwidth,quitbuttonheight)){ //Go back
    if(instrcounter == 0){
    quitGame = true;
    }
    else{
    goforward = false;
    goback = true;
    }
    image(backbuttonhover,50,500);
    }
   else if(startPressed(400,500,quitbuttonwidth,quitbuttonheight) && instrcounter != instrimages.length-1){ //Go forward
      quitGame = false;
      showInstr = true;
      goforward = true;
      goback = false;
      image(nextbuttonhover,400,500);
    }
     break; 
}

}

boolean startPressed(int x, int y, int w, int h){
  if(mouseX >= x && mouseX<= x+w &&
     mouseY >= y && mouseY<= y+h){
       return true;
     }
     return false;
}
void draw(){  
   switch(stateOfProgram) {
   case stateWelcomeScreenDisplay:
      doStateWelcomeScreenDisplay();break;
   case stateGame:
      doStateGame();break;
   case stateBossLevel:
      doStateBoss();break;
   case pauseGame:
      doStatePaused();break;
   case stateGameOver:
      doStateGameOver();break;
   case stateWon:
      doStateWon();break;
   case stateInformation:
      doStateInformation();break;
   case stateShowInstructions: 
      doStateShowInstructions();break;
   case stateEndGame:
      doStateEndGame();break;
   case stateHighScore:
      doStateHighScores();break;  
 }
   update(mouseX,mouseY);
}

//State transitions
void mousePressed() {
  if(startGame && stateOfProgram != 1) { //Stop clicking events during level
    level = levels[levelcounter];
    loadLevel(levelcounter);
    level.startlevel();
    stateOfProgram = 1;
      levelcounter++;
  }
  else if(saveScore){saveUserScore(); saveScore = false; stateOfProgram = 0;}
  else if(showLevelInfo){stateOfProgram = 7;}
  else if(resumeGame && stateOfProgram != 1){ stateOfProgram = 1;}
  else if(quitGame){stateOfProgram = stateWelcomeScreenDisplay;}
  else if(startBossLevel && stateOfProgram != 5){ stateOfProgram = 5;}
  else if(showHighScores){stateOfProgram = 9;}
  else if(showInstr) {
    stateOfProgram = 2;
    if(goback && instrcounter>0)instrcounter--;
    else if(goforward && instrcounter != 3)instrcounter++;
}

  
  
  
}
//Method to load the high scores from a text file and display them on-screen
void doStateHighScores(){
  background(hiscores);
   String[] hiscores = loadStrings("//hiscores.txt");
   for(int i = 0; i < hiscores.length; i++){
     String[] nameandscore = hiscores[i].split(" ");
     text((i+1) + ". " + nameandscore[0],150,150+(i*40));
     text(nameandscore[1],350,150+(i*40));
     image(backbutton,50,500);

   }
}
void doStateGameOver(){
 image(gameover,10,120);
 image(startbutton,90,240);
 image(quitbutton,200,360);
 levelcounter = 0;
}
void doStateWon(){
  image(victory,10,120);
  image(nextlevel,90,240);
}
void doStateInformation(){
      if(levelcounter >2)
    stateOfProgram = 8;
    else{
 background( levelinfoimages[levelcounter]);
 image(nextlevel,90,480);
    }
}
void doStateWelcomeScreenDisplay(){
  background(bg);
  image(startbutton, startbuttonx, startbuttony);
  image(instructionbutton, instrbuttonx, instrbuttony);
  image(hiscoresbutton, 150,500);
  levelcounter = 0;
}
void keyPressed(){
  if(level!= null)level.presskey();
}

//Method allows user to type their name in if they have completed the game
void keyReleased(){
   if(stateOfProgram == 8){
      if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      username = username.substring(0,max(0,username.length()-1));
      break;
    case ' ':
      System.out.println("nothing");
    case ENTER:
    case RETURN:
      // comment out the following two lines to disable line-breaks
      saveUserScore();
      break;
    case ESC:
    case DELETE:
      break;
    default:
      if(username.length() < 10)
      username += key;
    }
  } 
   }
   else if(level!= null)level.releasekey();
}
void doStateBoss(){startGame = false; resumeGame = false; level.renderBossLevel();}
void doStatePaused(){image(pause,120,120);
image(resumebutton,180,200);
image(quitbutton,210,260);
}
void doStateGame(){level.renderlevel();}
void doStateShowInstructions(){
  background(instrimages[instrcounter]);
  image(backbutton,50,500);
  if(instrcounter != (instrimages.length-1))
  image(nextbutton,400,500);
}

//High score entry screen
void doStateEndGame(){
  background(endgame);
  textFont(biggerfont);
  text(timetospare,260,360);
  stroke(255);
  textFont(bigfont);
  text(username+(frameCount/10 % 2 == 0 ? "_" : ""), 250, 500); //Generates a blinking cursor
  levelcounter = 0;
  image(submitbutton,210,520);
}

//Saves user score in the high score file if it is in the top 5 highest scores. Uses a basic array sorting method to check this
void saveUserScore(){
  String[] hiscores = loadStrings("//hiscores.txt");
  String[] newscores = new String[5];
  String score = username + " " + timetospare;
  for(int i =0; i< hiscores.length;i++){
    String thescore = hiscores[i].split(" ")[1];
    if(timetospare >= Integer.parseInt(thescore)){
    newscores[i] = score;
    for(int j = i+1; j < hiscores.length; j++){
      newscores[j] = hiscores[j-1];
    }
    break;
    }
    else
    newscores[i] = hiscores[i];
   }
  saveStrings("hiscores.txt",newscores);
  stateOfProgram = 0;
}
/**
The boss enemy class. This also contains the Spring and Claw private classes, which are used as elements of particular boss enemies
**/

//Class for the weak 'tongue' of the mussel boss
class Spring2D {
  float vx, vy; 
  float x, y; 
  float gravity;
  float mass;
  float radius = 10;
  float stiffness;
  float damping;
  Spring2D(PVector bosspos, float m, float g, float stiffness, float damping) {
    x = bosspos.x;
    y = bosspos.y;
    mass = m;
    gravity = g;
    this.stiffness = stiffness;
    this.damping = damping;
  }
  
  //A physics method that makes the tongue flop around as the mussel moves
  void update(PVector bosspos){
    float targetX = bosspos.x;
    float targetY = bosspos.y;
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }
  
  //Display: Draw a line from the weak point (tongue tip) to the mussel to look like a flopping tongue
  void display(PVector bosspos) {
    fill(220,20,22);
    stroke(220,20,22);
    ellipse(x, y, radius*2, radius*2);
    strokeWeight(6);
    line(x, y, bosspos.x, bosspos.y);
  }
  PVector getweakpoint(){
    return new PVector(x,y);
  }
}
//Class for the 'claw' of the meatball boss 
class Claw{
  public PVector position;
  public PVector goalpos;
  public PVector centerpos;
  public PVector leftpos = new PVector();
  public PVector rightpos = new PVector();
  public PVector bosspos;
  public PVector weakpoint;
  public boolean facingRight = true;
  public PVector velocity ;
  public PImage clawimg;
  public boolean descending;
  boolean visible = true;
  Random r = new Random();
    boolean onGround = false;
    
    public Claw(PVector bosspos){
      clawimg = loadImage("claw.png");
      this.bosspos = bosspos;
      int posx = r.nextInt(500);
      position = new PVector(posx,70);
      goalpos = new PVector(r.nextInt(500),r.nextInt(150));
      velocity = new PVector(0,0);
    }
    void update(PVector giuposition){
    if(r.nextInt(100) == 50){
        goalpos.x = giuposition.x; goalpos.y = giuposition.y;
//1 in 100 chance, equates to roughly once every 4 seconds
     descending = true;
    }
    if(Math.abs(position.x-goalpos.x) < 10 && Math.abs(position.y - goalpos.y) < 10){
      goalpos = new PVector(r.nextInt(500),r.nextInt(150)+80);
    }
    else{
      PVector direction = new PVector(goalpos.x-position.x,goalpos.y-position.y);
      direction.normalize();
      direction.mult(0.5);
      velocity.add(direction);
      velocity.x *=0.9;
      velocity.y*=0.9;
      position.add(velocity);
      leftpos.x = position.x-15;
      leftpos.y = rightpos.y = position.y;
      rightpos.x = position.x+15;
    }
}

  public void descend(){
    PVector direction = new PVector();
  
  direction.x = goalpos.x - position.x ;
  direction.y = goalpos.y - position.y ;
  direction.normalize();
  direction.mult(0.75);
  velocity.add(direction);
  position.add(velocity);
  if(position.y > World.UNIT_SIZE*(World.BOSS_TALL-1.5)){
      velocity.y = -15;
      descending = false;
      goalpos = new PVector(r.nextInt(500),r.nextInt(150)+80);
    }
  }
  public void display(){
       stroke(204,179,57);
       strokeWeight(4);
       line(bosspos.x,bosspos.y-40,position.x,position.y);
       translate(-clawimg.width/2,-clawimg.height);
       image(clawimg,position.x,position.y+15);
    translate(clawimg.width/2,clawimg.height);
  }
}
class BossEnemy{
  float DELAY = 2;
  float delay = DELAY;
  boolean pursuing;
  float health;
  String name;
  final float MAX_ACCEL = 0.1f ;
  public PVector position ;
  public PVector centerpos;
  public PVector leftside, rightside, topmiddle, bottomleft, bottomright, topleft, topright, leftmiddle, rightmiddle;
  public PVector weakpoint;
  public boolean facingRight = true;
  public PVector velocity ;
    boolean onGround = false;

  PImage enemyimage;
  int fwidth;
  int fheight;
  
  float speed =1;
  int xPos;
  int yPos;
  Spring2D spring; //For mussel
  Claw claw1,claw2,claw3,claw4; //For meatball
  Claw[] claws;
  public BossEnemy(int x, int y, float health, float xVel, float yVel, PImage enemyimage){
    position = new PVector(x, y) ;
    velocity = new PVector(0, 0) ;
    this.enemyimage = enemyimage;
    this.health = health;
    fwidth = enemyimage.width;
    fheight = enemyimage.height;
    spring = new Spring2D(position,2,level.GRAVITY,0.2,0.4);
    claw1 = new Claw(position);
    claw2 = new Claw(position);
    claw3 = new Claw(position);
    claw4 = new Claw(position);
    claws = new Claw[]{claw1,claw2,claw3,claw4};
    rightside = new PVector(0,y-(fheight/2));
    leftside = new PVector(0,y-(fheight/2));
  }

  //The meatball is located at the top of screen, and its spaghetti claws randomly descend on Giuseppe
  public void updatemeatball(PVector giuposition){
   leftmiddle = new PVector(); topmiddle = new PVector(); rightmiddle = new PVector();
   bottomleft = new PVector(); bottomright = new PVector();
   topleft = new PVector(); topright = new PVector();
   centerpos = new PVector();
 
   centerpos.x = position.x;
   centerpos.y = position.y - (fheight/2);
   if(position.x < 0 || position.x > World.UNIT_SIZE * World.BOSS_WIDE)
    velocity.x = -velocity.x;
  if(velocity.x > 0)facingRight = true;
  else facingRight = false;
   if(facingRight)
   
   velocity.x += speed;
   else
   velocity.x -= speed;
   velocity.x *=0.7;
   position.add(velocity);
    for(int i = 0; i < claws.length;i++){
      if(claws[i].visible){ //Update the visible (undefeated) claws only
      if(claws[i].descending)
      claws[i].descend();
      else
      claws[i].update(giuposition);
      claws[i].display();
      }
    }
    pushMatrix();
    translate(-fwidth/2,-fheight);
    image(enemyimage,position.x,position.y);
    translate(fwidth/2,fheight);
    popMatrix();
  }
  public void updatescone(PVector giuposition, PVector giuvelocity){
     leftmiddle = new PVector(); topmiddle = new PVector(); rightmiddle = new PVector();
   bottomleft = new PVector(); bottomright = new PVector();
   topleft = new PVector(); topright = new PVector();
   centerpos = new PVector();
   
   leftmiddle.x = position.x - (fwidth/2);
   leftside = leftmiddle;
   rightmiddle.x = position.x + (fwidth/2);
   rightside = rightmiddle;
   leftmiddle.y = rightmiddle.y = position.y - (fheight/2);
   bottomleft.x = topleft.x = position.x - (fwidth/4);
   bottomright.x = topright.x = position.x + (fwidth/4);
   topleft.y = topright.y = position.y - (3*fheight/4);
   bottomleft.y = bottomright.y = position.y - (fheight/4);
   topmiddle.x = position.x;
   topmiddle.y = position.y - (fheight);
   centerpos.x = position.x;
   centerpos.y = position.y - (fheight/2);
   
  if(onGround){
    if(delay--<0){
    onGround = false;
    velocity.y = -20;
    pursuing = false;
    delay = DELAY;
    }
    else
    velocity.y = 0;
    velocity.x*=0.8;
  }
  else
    velocity.y += 0.8*level.GRAVITY;
    
  PVector direction = new PVector();
  PVector linear = new PVector();
  if(!onGround && velocity.y > 0)
  {
   //velocity.y = 0;
 // velocity.y = 10;
  direction.x = giuposition.x - position.x ;
  direction.y = giuposition.y - position.y ;
  float distance = direction.mag() ;
  float speed = velocity.mag() ;
  float prediction = distance / speed ;
  
  PVector pursue = new PVector();
  pursue.x = giuvelocity.x;
  pursue.mult(prediction) ;
  pursue.add(giuposition) ;
  
  linear.x = pursue.x - position.x;
  linear.normalize();
  linear.mult(1.5);
  velocity.add(linear);
  velocity.y +=2;
  velocity.x*=0.8;
  velocity.y*=0.9;
  pursuing = true;
  }
  if(velocity.x > 0)facingRight = true;
  else facingRight = false;
  
  if(position.y > World.UNIT_SIZE * (World.BOSS_TALL-1) && velocity.y>0){ //Had to add velocity constraint in, he kept getting stuck
   // velocity.y = 0;
    onGround = true;
  }
  
  else if(leftmiddle.x < 0 || rightmiddle.x > World.UNIT_SIZE * World.BOSS_WIDE)
    velocity.x = -velocity.x;
  
    position.add(velocity);
   
    //Position of the weak spot
    PVector weakeye;
   if(facingRight)weakeye = new PVector(position.x+(fwidth/2)+10,position.y-(3*fwidth/4));
   else weakeye = new PVector(position.x-(fwidth/2)-10,position.y-(3*fwidth/4));
    pushMatrix();
    translate(position.x,position.y);


    translate(-position.x,-position.y);
     int moveeye = -10; //How much to move the non-weak eye
    translate(-fwidth/2,-fheight);
    image(enemyimage,position.x,position.y);
    PVector eyefollow = new PVector(centerpos.x,centerpos.y);
    eyefollow.sub(giuposition);
    eyefollow.normalize();
    eyefollow.mult(10);
    eyefollow.x *= -1;
    if(facingRight){moveeye*=-1;}
    translate(fwidth/2,fheight);
    fill(220,10,10);
    stroke(0);
    strokeWeight(4);
    line(position.x + moveeye,position.y-fheight+10,position.x,position.y-fheight-10);
    line(weakeye.x,position.y-fheight+10,position.x+(moveeye*5),position.y-fheight-10);
    stroke(220,10,10);
    strokeWeight(1);
    ellipse(position.x + moveeye,position.y-(3*fwidth/4),25,25);
    ellipse(weakeye.x,weakeye.y,25,25);
    fill(0);
    ellipse(position.x + moveeye + eyefollow.x,position.y-(3*fwidth/4) - eyefollow.y,10,10);
    ellipse(weakeye.x + eyefollow.x,weakeye.y - eyefollow.y,10,10);
    popMatrix();
    weakpoint = new PVector();
    weakpoint = weakeye;

}
 public void updatemussel(PVector giuposition){
   leftmiddle = new PVector(); topmiddle = new PVector(); rightmiddle = new PVector();
   bottomleft = new PVector(); bottomright = new PVector();
   topleft = new PVector(); topright = new PVector();
   centerpos = new PVector();
   
   leftmiddle.x = position.x - (fwidth/2);
   leftside = leftmiddle;
   rightmiddle.x = position.x + (fwidth/2);
   rightside = rightmiddle;
   leftmiddle.y = rightmiddle.y = position.y - (fheight/2);
   bottomleft.x = topleft.x = position.x - (fwidth/4);
   bottomright.x = topright.x = position.x + (fwidth/4);
   topleft.y = topright.y = position.y - (3*fheight/4);
   bottomleft.y = bottomright.y = position.y - (fheight/4);
   topmiddle.x = position.x;
   topmiddle.y = position.y - (fheight);
   centerpos.x = position.x;
   centerpos.y = position.y - (fheight/2);
   
  if(position.y < 0 || position.y > World.UNIT_SIZE * World.BOSS_TALL)
    velocity.y = -velocity.y;
  else if(leftmiddle.x < 0 || rightmiddle.x > World.UNIT_SIZE * World.BOSS_WIDE)
    velocity.x = -velocity.x;
   
  if(velocity.x > 0)facingRight = true;
  else facingRight = false;
  if(facingRight) velocity.x += speed;
  else velocity.x -= speed;
  if(velocity.y > 0)velocity.y += speed;
  else velocity.y -= speed;
  velocity.y *= 0.9;
  velocity.x *=0.9;
  
    position.add(velocity);
   
    weakpoint = spring.getweakpoint(); //Position of the weak spot
    
    pushMatrix();
    translate(position.x,position.y);
     if(facingRight == false){
      scale(-1,1);
    }
    translate(-position.x,-position.y);
   
    translate(-fwidth/2,-fheight);
    image(enemyimage,position.x,position.y);
    translate(fwidth/2,fheight);
    popMatrix();
    centerpos.y +=30;
     spring.update(centerpos);
    spring.display(centerpos);
  }  
}
/**
Class for Giuseppe, the main protagonist of "Giuseppe's Kitchen Chaos"
**/
class Character{
  PVector position, velocity;
  PVector centerpos = new PVector();
  float speed = 1;
  boolean facingRight = true;
  boolean powered = false; //Has he eaten the power food?
  boolean onGround = false;
  boolean onLadder = false;
  
  //Parameters for temporary invincibility
  boolean invincible = false;
  final int FLASH_TIME =24; //How long to flash character on and off when hit
  final int INVINCIBLE_TIME = 72;
  int flashtime = FLASH_TIME;
  int invincibletime = 0;
  
  //Food currently being held, represented by an ID, or -1 if no food is held
  int item =-1;
  
  //Directional states
  final int STOP = 0;
  final int MOVING = 1;
  
  //Jumping states
  final int JUMP = 2;
  final int DOWN = 8;
  final int FALLING = 5;
  final int NONE = 6;
  
  //Action states
  final int DOING = 3;
  final int IDLE = 4;
  final int ATTACK = 7;
  
  int state = STOP;
  int jumpstate = NONE;
  int actionstate = IDLE;
  int giuheight;
  int giuwidth;
 
 //Delay for changing sprite image when moving, and time the 'attack' occurs for
  int animDelay;
  final int ANIMATION_DELAY = 5;
  final int ATTACK_DELAY = 5;
  int attackDelay = ATTACK_DELAY;
  
  int timer = 0;
  PImage[] rImage = new PImage[4]; //The running, jumping and idle images
  PImage[] climbImage = new PImage[2]; //The ladder climbing images
  PImage attackImage = new PImage(); //The level-specific attack image
  
  int indexClimb = 0;
  PImage climbImage1;
  PImage climbImage2;
  int indexR = 0;
  Character(String attackpath){
    position = new PVector(0,0);
    velocity = new PVector(0,0);
    //timer = millis();
    loadImages(attackpath);
  }
  void loadImages(String attackpath){
    for(int i = 0; i < rImage.length; i++){
      rImage[i] = loadImage("giuR" + i + ".png");
    }
    climbImage[0] = loadImage("giuclimb1.png");
    climbImage[1] = loadImage("giuclimb2.png");
    attackImage = loadImage(attackpath);
    giuheight = rImage[0].height;
    giuwidth = rImage[0].width;
  }
  
  //Update Giuseppe's state
  void stateCheck(){

    //First check if his invincibility time has ran out
    if(invincibletime-- <0){
      invincible = false;
    }
    
    if(actionstate == DOING || actionstate == ATTACK){ //drop an item or attack if powered up
    if(item != -1 && !onGround)
      itemDrop();    
    else if(powered){
      actionstate = ATTACK;
      attack();
    }
    }
  
    //Movement left and right
    if(facingRight && state !=STOP){
    velocity.x += speed;
    }
    else if(!facingRight && state != STOP){
    velocity.x -= speed;
    }  
    //friction
    if(!onGround)
    velocity.x *=level.AIRFRICTION;
    else
    velocity.x *=level.FRICTION; 
   
    //Jumping movement
    if(jumpstate == JUMP && onGround){
      sndJump.trigger(); //Play jumping sound
    velocity.y = -level.JUMPPOWER;
    onGround = false;
    }
  }
  
  //This method is used for animating the sprites when climbing a ladder
  void moveUp(){
    if(velocity.y != 0 && animDelay--<0){ //Only animate if actually moving
      animDelay = ANIMATION_DELAY;
    if(indexClimb ==1)
      indexClimb = 0;
    else
      indexClimb = 1;
    }
  }
    void moveRight(){
    if(animDelay--<0){
      animDelay = ANIMATION_DELAY;
    if(indexR <2)
      indexR++;
    else
      indexR = 1;
    }
  }
  void attack(){ //Function called when Giuseppe attacks
    if(attackDelay == ATTACK_DELAY)
        sndAttack.trigger(); //Play the attacking sound (only once)
    if(attackDelay--<0){
      actionstate = IDLE; //This is to stop him constantly being in the attack state if space bar is pressed
    }
    else{
      actionstate = ATTACK;
      PVector posi;
      PVector attacksquare;
      //CHANGE THIS, SO IF WEAKPOINT IS WITHIN RANGE OF FIRE, RATHER THAN AT END
      //Check for door to destroy it and reach the exit, and also check for enemy
      if(facingRight){
         posi = new PVector(position.x+(giuwidth/2), position.y-(3*giuheight/4));
         attacksquare = new PVector(position.x+World.UNIT_SIZE/1.5,position.y-giuheight/2);
      }
      else{
        posi = new PVector(position.x - (giuwidth/2),position.y - (3*giuheight/4));
        attacksquare = new PVector(position.x-World.UNIT_SIZE/1.5,position.y-giuheight/2);
      }
      if(level.world.squareAt(attacksquare) == World.TILE_EXIT){
        level.theexit = level.levelexit;
        level.world.setSquare(attacksquare, World.TILE_OPENEXIT); 
        }
              level.world.attackEnemy(posi, facingRight);
    }
      
  }   

  //Collision detection for enemies 
  void collision(){
     PVector centervec = new PVector(position.x, position.y-giuheight/2);
     int collided = level.world.collideEnemy(centervec);
     if(collided >0 && !invincible){
       if(collided == 1)velocity.x +=7; //Enemy hits from left
       else velocity.x -= 7; //Enemy hits from right
      sndHit.trigger();
      invincible = true; //Temporary invincibility
      invincibletime = INVINCIBLE_TIME;
      velocity.x += 7;
      level.penalties += 10;
      if(item != -1){ //Drop food character is holding
      level.world.foods[item].resetFood();
      item = -1;
      }
      
    }
   //draw a collision box around Giuseppe
    PVector topleft,topright,bottomleft,bottomright,topmiddle,middleleft,middleright;
    topleft = new PVector(); topmiddle = new PVector(); topright = new PVector();
    middleleft = new PVector(); middleright = new PVector();
    bottomleft = new PVector(); bottomright = new PVector();
    centerpos.x = position.x; centerpos.y = position.y - (giuheight/2);
    topleft.x = bottomleft.x = middleleft.x = position.x - (giuwidth/2);
    topright.x = bottomright.x = middleright.x = position.x + (giuwidth/2);
    topleft.y = topright.y = topmiddle.y = position.y - giuheight  +45;;
    middleleft.y = middleright.y = position.y - (giuheight/2);
    bottomleft.y = bottomright.y = position.y -10;
    topmiddle.x = position.x;
    
    //TODO: Change this for the boss level for more agile movement
    //This is necessary otherwise you can moonwalk inside obstacles
    if(velocity.x > 0)
      facingRight = true;
     else
      facingRight = false;
   
   //Collisions with edge of map
   // if ((bottomleft.x < 0) || (bottomright.x > level.world.UNITS_WIDE*level.world.UNIT_SIZE)) velocity.x = -velocity.x ;
    if(position.y < 0) velocity.y = -velocity.y ; 

    //Fallen off map, drop food and reset player
    if ((position.y > level.world.UNITS_TALL*level.world.UNIT_SIZE)){ 
      level.world.resetPlayer();
      level.penalties += 10;
      if(item != -1){ //Drop item
     level.world.foods[item].resetFood();
      item = -1;
      }
    }
    
    PVector[] edges = new PVector[]{bottomleft,bottomright};
    
    //Hit head on platform
    if(level.world.squareAt(topmiddle) == World.TILE_PLATFORM){
      if(velocity.y < 0)velocity.y=0;
    }
    else{
        int i;
        if(facingRight)i = 1; //Only bump off objects in direction you're facing, otherwise physics problems are caused
        else i = 0;
        if(level.world.squareAt(edges[i]) == World.TILE_PLATFORM || level.world.squareAt(edges[i]) == World.TILE_POT || level.world.squareAt(edges[i]) == World.TILE_EXIT){
         velocity.x = -velocity.x;
        }
       
    }
    position.add(velocity);
    
    //Ladder physics
    onLadder = false;
    
    if(level.world.squareAt(position) == World.TILE_PLATFORM || level.world.squareAt(position) == World.TILE_EXIT){
      onGround = true;
      position.y = level.world.squareTop(position); //Helper method to position Giuseppe on top of the platform
      velocity.y = 0;
    }
    //This bit helps position Giuseppe when he's at the top of a ladder
    else if(level.world.squareAt(position) == World.TILE_LADDER && level.world.squareAt(centerpos) == World.TILE_EMPTY && jumpstate != DOWN){
      onGround = true;
      position.y = level.world.squareTop(position);
      if(jumpstate == DOWN){
        velocity.y += speed;
      }
    }
    else if(level.world.squareAt(position) == World.TILE_LADDER){
      onLadder = true;
       if(jumpstate == JUMP){
      velocity.x = 0;
      velocity.y -= speed;
       }
    if(jumpstate == DOWN){
      velocity.y += speed;
      velocity.x = 0;
    }
    if(jumpstate == NONE){
      velocity.y = 0;
    }
    //Ladder friction
    velocity.y *=0.9;
    velocity.x*=0.9;
    }  
    //Do a random jump off the top of the pot
    else if(level.world.squareAt(position) == World.TILE_POT){ 
    velocity.y = -15 ;
    velocity.x = random(-20,20);
    }
    //Collision with the open exit, move to boss level
    else if(level.world.squareAt(topmiddle) == World.TILE_OPENEXIT){ 
      stateOfProgram = stateBossLevel;
      level.world.loadBossLevel(); //Load the boss level ONCE
    }
    else{
      onGround = false;
      velocity.y += level.GRAVITY;
    }
   
  }
  
  //Method to pick up an item
  void itemPickup(){
    PVector rightside = new PVector();
    PVector leftside = new PVector();
    rightside.x = position.x + (giuwidth/2);
    leftside.x = position.x - (giuwidth/2);
    rightside.y = leftside.y = position.y - (giuheight/4);
      if(item == -1){ //Only if not currently carrying an item
      item = level.world.removeItem(rightside);
      if(item == -1)
      item = level.world.removeItem(leftside);
    }
  }
  
  //Method to drop an item
  void itemDrop(){
    level.world.foods[item].drop(position);
    item = -1;
  } 
    
  //Now render Giuseppe onscreen
  void draw(){
    //If he's invincible, flash his image on and off 
    if(invincible && flashtime--<0){
      flashtime = FLASH_TIME;
      return;
    }
    else if(invincible && flashtime--<12){
      return;
    }
    
    //Pushing and translating lets Giuseppe get rendered in the correct position
    pushMatrix();
    translate(position.x,position.y);
    if(facingRight == false){
      scale(-1,1);
    }
    translate(-position.x,-position.y);
    
    //Draw character from bottom central position
    translate(-giuwidth/2,-giuheight);
    
    if(abs(velocity.x) == 0)
    state = STOP;
    
    if(onLadder == true){
       moveUp();
       image(climbImage[indexClimb],position.x,position.y);
    }
    else if(actionstate == ATTACK)
      image(attackImage,position.x,position.y);
    else if(onGround == false)
      image(rImage[3],position.x,position.y);
    else if(state == STOP)
      image(rImage[0],position.x,position.y);
    else{
      moveRight();
    image(rImage[indexR],position.x,position.y);
    flashtime = FLASH_TIME;
    }
    popMatrix();
  }
}
/**
Class representing a generic enemy of the main level
**/
class Enemy{
  public PVector position ;
  public PVector leftside;
  public PVector rightside;
  public boolean facingRight = true;
  public boolean onGround;
  public boolean visible = true;
  // Kinematic Data
  public PVector velocity ;
  public float rotation ;
  // Accel is calculated at each integration
  private PVector linear ;
  PImage enemyimage;
  boolean intelligent; //Does the enemy have (basic) AI?
  int fwidth;
  int fheight;
  float speed =0.6;
  int xPos;
  int yPos;
  
  public Enemy(int x, int y, float xVel, float yVel, PImage enemyimage, boolean rightFacing, boolean intelligent){
    position = new PVector(x, y) ;
    velocity = new PVector(2, 0) ;
    this.facingRight = rightFacing;
    this.enemyimage = enemyimage;
    this.intelligent = intelligent;
    linear = new PVector(0, 0) ;
    fwidth = enemyimage.width;
    fheight = enemyimage.height;
    rightside = new PVector(0,y-(3*fheight/4));
    leftside = new PVector(0,y-(3*fheight/4));
  }
  
 public void update(PVector giuposition){
   PVector centerpos,toppos;
   centerpos = new PVector();
   toppos = new PVector();
  
  PVector linear = new PVector();
  if(position.x < 0 || position.x > (World.UNITS_WIDE * World.UNIT_SIZE))
   velocity.x = -velocity.x;
   
   PVector rightpos = new PVector(position.x+20,position.y);
   PVector leftpos = new PVector(position.x-20,position.y);
   //Stop falling off platform
  if(facingRight && onGround && level.world.squareAt(rightpos) == World.TILE_EMPTY){ 
      facingRight = false;
      velocity.x = -velocity.x;
    }
  else if(!facingRight && onGround && level.world.squareAt(leftpos) == World.TILE_EMPTY){
      facingRight = true;
      velocity.x = -velocity.x;
  }
  //Pursue Giuseppe
  else if(intelligent && level.world.distance(giuposition,position) < 200 && !level.giu.invincible){ //Stops enemy sticking around you when you get higt
    linear.x = giuposition.x - position.x ;
    linear.y = giuposition.y - position.y ;
    linear.normalize();
    linear.mult(0.7);
    velocity.x +=(linear.x);
  }
  if(velocity.x > 0)facingRight = true;
  else facingRight = false;
  
  if(facingRight) velocity.x += speed;
  else velocity.x -= speed;
  
  velocity.x *=0.9;
  
     if(level.world.squareAt(position) == World.TILE_PLATFORM || level.world.squareAt(position) == World.TILE_LADDER){
      position.y = level.world.squareTop(position); //Positions enemy on top of tile
      velocity.y = 0;
      onGround = true;
    }
    else{
      velocity.y += level.GRAVITY; //Enemy drops into map on initialisation
      onGround = false;
    }
    
    position.add(velocity);
    rightside.x = position.x + fwidth/2;
    rightside.y = leftside.y = position.y - fheight/2;
    leftside.x = position.x - fwidth/2;
    pushMatrix();
    translate(position.x,position.y);
     if(facingRight == false){
      scale(-1,1);
    }
    translate(-position.x,-position.y);
     translate(-fwidth/2,-fheight);
     image(enemyimage,position.x,position.y);
     translate(fwidth/2,fheight);
     popMatrix();
  }  
}
/**
Class representing a food in the level
**/
class Food{
PVector position, centerpos, toppos, velocity;
int xPos;
int yPos;
int fwidth;
int fheight;
boolean onGround = false;
boolean visible = true;
boolean dropped = false;
boolean correct; //Is the food required to complete the level?
PImage foodImage; //.png image of the food
String description;
Food(int xPos, int yPos, PImage foodImage, String description, boolean correct){
  position = new PVector(xPos, yPos);  
  velocity = new PVector(0,0);
  this.xPos = xPos; //Starting positions, used to reset if dropped off the map
  this.yPos = yPos;
  this.correct = correct; 
  this.foodImage = foodImage;
  fwidth = foodImage.width;
  fheight = foodImage.height;
  centerpos = new PVector(xPos,yPos - (fheight/2));
  toppos = new PVector(xPos, yPos - fheight);
  this.description = description;
}
void update(){
  if (position.y > World.UNITS_TALL*World.UNIT_SIZE){ //Reset food if it is dropped off the map
   resetFood();
   }
    centerpos.x = position.x;
    centerpos.y = position.y - (fheight/2);
    toppos.x = position.x;
    toppos.y = position.y - (fheight);
  if(level.world.squareAt(position) == World.TILE_PLATFORM){ //Food acts like player, in that it can only rest on a tile
      position.y = level.world.squareTop(position);
      velocity.y = 0;
      onGround = true;
    }
  else if(level.world.squareAt(centerpos) == World.TILE_POT){ //Food has gone in the cooking pot
      if(visible && !correct)level.penalties +=10; //Updates penalty only once
      visible = false;
      if(correct){
        dropped = true; //This food has now been dropped
        sndRight.trigger(); //Trigger the 'correct' sound
      }
      else{
        sndWrong.trigger(); //Trigger the 'wrong' sound
      } //Show food as 'dropped' if it was supposed to be dropped. Update counter in world
    }
    else{
      velocity.y += level.GRAVITY;
      onGround = false;
    }
    
    position.add(velocity);
     translate(-fwidth/2,-fheight);
     if(visible)
     image(foodImage,position.x,position.y);
     translate(fwidth/2,fheight);
}  
void resetFood(){ //called when dropped off map, or when character is attacked while holding
    velocity.x = 0; 
    velocity.y = 0;
    position.x = xPos; 
    position.y = yPos;
}
void drop(PVector characterpos){ //Drop the food, descends from character's current position
      position.x = characterpos.x;
      position.y = characterpos.y+50;
}
}
/**
This class represents a game level, including the main part of the level and the boss of that level
**/
class GameLevel{
boolean isRunning; //Is level in progress?
float GRAVITY = 0.6;
float FRICTION = 0.9;
float AIRFRICTION = 0.9;
float JUMPPOWER = 13;
int LEVEL_TIME = 300;
int penalties = 0; //Time penalties for being hit, dropping wrong food etc
float offsetX; //Camera offset within the level
float offsetY;

boolean exitopen = false; //Is the exit open?

Character giu; //Giueseppe, the level character
World world; //The 'world' of the level, the tile grid and methods associated

String texthint; //Each level has a 'hint' on how to solve it
String textsolved; //The message once the food has been craeted and eaten
Food[] foods; //The foods in the level
Enemy[] enemies; //Enemies in the level
int[][] grid; //Main level grid
int[][] bossGrid; //Boss level grid

PImage back, tile, pot, ladder, levelexit, blockedexit, theexit, powerfood; //Level-specific images
String giuattackpath; //Attack image for Giuseppe character
String attacksound; //Sound played when Giuseppe attacks
String bossenemypath; //Boss image of level
String bossname; //Name of the boss

boolean[] keys = new boolean[526];

GameLevel(String back, String tile, String pot, String ladder, String levelexit, String blockedexit, String powerfood, String giuattack, String attacksound, String bosspath, String bossname){
  this.back = loadImage(back);
  this.tile = loadImage(tile);
  this.pot = loadImage(pot);
  this.ladder = loadImage(ladder);
  this.levelexit = loadImage(levelexit);
  this.blockedexit = loadImage(blockedexit);
  this.powerfood = loadImage(powerfood);
  this.giuattackpath = giuattack;
  this.attacksound = attacksound;
  this.bossenemypath = bosspath;
  this.bossname = bossname;
}
//Setter methods for the hint and solved messages, the food and enemy arrays, and the world grids
void setJumpPower(float jumppower){
  this.JUMPPOWER = jumppower;
}
void setGravity(float gravity){
  this.GRAVITY = gravity;
}
void setFriction(float friction){
  this.FRICTION = friction;
}
void setAirFriction(float airfriction){
  this.AIRFRICTION = airfriction;
}
void setHint(String texthint){
  this.texthint = texthint;
}
void setSolved(String textsolved){
 this.textsolved = textsolved;
}
void setFoods(Food[] foods){
  this.foods = foods;
}
void setEnemies(Enemy[] enemies){
  this.enemies = enemies;
}
void setGrids(int[][] grid, int[][] bossGrid){
  this.grid = grid;
  this.bossGrid = bossGrid;
}

//Method called to initialise the level
void startlevel(){
  penalties = 0;
  sndAttack =  minim.loadSample(attacksound,buffersize); //Load level-specific attack sound
  theexit = blockedexit;
  bigfont = createFont("ITCKrist.TTF",24); //Set a new font
  textFont(bigfont);
  world = new World(foods,enemies,grid,bossGrid,bossenemypath,bossname); //Initialise the level world
  giu = new Character(giuattackpath); //Initialise the character
  world.load();
  isRunning = true;
  frameRate(24); //How often is the draw method called?
}

//The method that updates the 'camera' position and makes the game scroll
void updateLevelPos(){
  int rightEdge = world.UNITS_WIDE*world.UNIT_SIZE - MY_WIDTH; //x position of the right edge of the screen
  int topEdge = world.UNITS_TALL*world.UNIT_SIZE - MY_HEIGHT; //y position of the top edge of the screen

   offsetX = giu.position.x - (MY_WIDTH/2); //Offset of character within the level
   offsetY = giu.position.y - (MY_HEIGHT/2);
   if(offsetX < 0)offsetX = 0; //Stop scrolling when character approaches left or bottom of level
   if(offsetY < 0)offsetY = 0;
   
   if(offsetX > rightEdge)offsetX = rightEdge; //Stop scrolling when character approaches top or right of level
   if(offsetY > topEdge)offsetY = topEdge;  
}

//KEY INPUT METHODS
void releasekey(){
  if(key == ' '){
    giu.actionstate = giu.IDLE;
    giu.attackDelay = giu.ATTACK_DELAY;
  }
  keys[keyCode] = false;
}
void presskey(){
  if( key == ' '){
    giu.actionstate = giu.DOING;
  }
   if( key == 'p' || key == 'P'){ //Updates state of program when paused and resumed
    if(stateOfProgram == pauseGame)stateOfProgram = stateGame;
    else if(stateOfProgram == stateGame) stateOfProgram = pauseGame;    
  }
  keys[keyCode] = true;
}
//Update character state when pressing movement keys
void checkKeys(){
    if (keys[RIGHT]) {
      giu.facingRight = true;
      giu.state = giu.MOVING;
    }  
    if (keys[LEFT]) {
      giu.facingRight = false;
      giu.state = giu.MOVING;
    } 
    if (keys[UP]) {
       giu.jumpstate = giu.JUMP;
    }
    else if(!keys[UP] && giu.velocity.y<0){
      giu.velocity.y*=0.7; //This allows the player to make a shorter jump by pressing the jump key for a shorter time
      giu.jumpstate = giu.NONE;
    }
    else if (keys[DOWN]) {
      giu.jumpstate = giu.DOWN;
    }
    else{
      giu.jumpstate = giu.NONE; //No vertical movement attempted
    }
    if(!keys[LEFT] && !keys[RIGHT] && !keys[UP] && !keys[DOWN]){
    giu.state = giu.STOP;
    giu.jumpstate = giu.NONE;
  }
 
}

//TODO: Abstract some of this stuff into other methods. Maybe just have one loop?
//Boss level loop
void renderBossLevel(){
  
  int time = millis()/1000;
  background(back);
  checkKeys();
pushMatrix();
  world.renderBossLevel();
  giu.stateCheck();
  world.moveBoss(giu.position);
  world.checkBoss();
  giu.collision();
  giu.draw();
 popMatrix();
  textFont(bigfont);
  fill(155,0,0);
  text("Time left: " + world.leveltime,10, 30);
  text(bossname,10,70);
  noFill();
  stroke(200);
  strokeWeight(2);
  text("Health: ",10,120);
  rect(100,100,100,20);
  fill(200,0,0);
  rect(100,100,world.bossenemy.health*4,20);
  world.leveltime = LEVEL_TIME - (time-world.timer) - penalties;
  if(world.leveltime <= 0)
  stateOfProgram = stateGameOver;
 } 

//Main level loop
void renderlevel(){
  int time = millis()/1000;
  background(back);
  checkKeys();
pushMatrix();
  translate(-offsetX,-offsetY);
  world.render();
  world.checkCompleteness();
  updateLevelPos(); //Update state
  giu.stateCheck(); //Move character
  world.moveEnemies(giu.position); //Move enemies
  giu.collision(); //Collision detection
  giu.itemPickup(); //Update inventory
  giu.draw();
  popMatrix();
  textFont(bigfont);
  fill(155,0,0);
  text("Time left: " + world.leveltime + "  Ingredients left: " + (world.correctcounter-world.foodsdropped),10, 30);
  scale(0.75,0.75);
   if(!giu.powered)
   text(texthint,10,80);
   else
   text(textsolved,10,80);
   if(giu.item != -1){
   text("Holding: ",10,140); 
    scale(1.33,1.33);
    image(world.foods[giu.item].foodImage,100,75); 
    scale(0.75,0.75);
    text(world.foods[giu.item].description,190,140);
   }
   scale(1.33,1.33);

  world.leveltime = LEVEL_TIME - (time-world.timer) - penalties;
  if(world.leveltime <= 0)
  stateOfProgram = stateGameOver;
}
}
/**
The game world. This contains all state information within a level, and all the methods 
that manipulate the world in some way, such as attacking, resetting, positioning of enemies etc
**/

class World{
static final int TILE_EMPTY = 0;
static final int TILE_PLATFORM = 1;
static final int TILE_START = 2;
static final int TILE_FOOD = 3;
static final int TILE_ENEMY = 4;
static final int TILE_EXIT = 5;
static final int TILE_OPENEXIT = 9;
static final int TILE_POT = 6;
static final int TILE_LADDER = 7;
static final int TILE_POWER = 8;
static final int UNITS_TALL = 25; //Height of level in squares
static final int UNITS_WIDE = 20; //Width of level in squares
static final int UNIT_SIZE = 70; //Square size
static final int BOSS_WIDE = 8;
static final int BOSS_TALL = 8;
int timer;
int leveltime;


int foodsdropped = 0;
boolean allFoodsDropped = false;
ArrayList possibleFoodPos;
Random randomy;
int[][] foodPositions = new int[3][3];
PImage[] foodImage = new PImage[3];
PVector powerfoodpos;
Food[] foods;
Food powerfood;
String bossenemypath;
String bossname;
BossEnemy bossenemy;
Enemy[] enemies;
float startX;
float startY;
Character giu;
int[][] grid;
int[][] bossGrid;
int correctcounter = 0;

public World(Food[] foods, Enemy[] enemies, int[][] grid, int[][] bossGrid, String bossenemypath, String bossname){
  this.bossname = bossname;
  this.bossenemypath = bossenemypath;
  //The food array contains all the foods in the level and the 'power food' at the end of the array
  powerfood = foods[foods.length-1];
  powerfood.position.x = 0;
  powerfood.position.y = 0;
  for(int i = 0; i < foods.length-1; i++){
    if(foods[i].correct)
    correctcounter++; //Count how many foods are required to complete the level
    foods[i].dropped = false;
    foods[i].visible = true;
  }
  this.foods = foods;
  for(int i = 0; i < enemies.length; i++){
    enemies[i].visible = true;
  }
  this.enemies = enemies;
  this.grid = grid;
  this.bossGrid = bossGrid;
}

//Initialise everything
void load(){
  if(music != null)
  music.close();
   music = minim.loadFile("PinballSpring.mp3", 1024);
  music.loop();
 giu = level.giu;
 possibleFoodPos = new ArrayList(100);
 timer = millis()/1000;
 int foodcounter = 0;
 int enemycounter = 0;
 for(int i = 0; i < 20; i++){
    for(int j = 0; j < 25; j++){
    if(grid[j][i] == 2){ //Initial character position
         startX = giu.position.x = (i*UNIT_SIZE + giu.giuwidth); //Save for later resetting
         startY = giu.position.y = j*UNIT_SIZE;
       }
       //This randomises the positions of the foods in the level. Potential positions (empty square with a platform underneath) are stored in the possibleFoodPos array list
     else if(grid[j][i] == 0 && j!=24 && grid[j+1][i] == 1){
         possibleFoodPos.add(new PVector(i,j));
         PVector pos = (PVector)possibleFoodPos.get(foodcounter);
         foodcounter++;
       }
       else if(grid[j][i] == 8){ //Store the position of the power food
         powerfoodpos = new PVector(i,j); 
       }
       else if(grid[j][i] == 4){ //An enemy position
         enemies[enemycounter].position.x = enemies[enemycounter].xPos= (i*UNIT_SIZE) + enemies[enemycounter].fwidth;
         enemies[enemycounter].position.y = enemies[enemycounter].yPos= (j*UNIT_SIZE);
         enemycounter++;
    }
    }
  }
 possibleFoodPos.trimToSize();
 for(int i = 0; i < foods.length-1; i++){
 int rand = (int)random(possibleFoodPos.size());
 PVector pos = (PVector)possibleFoodPos.get(rand);
 possibleFoodPos.remove(possibleFoodPos.get(rand));
 foods[i].position.x = foods[i].xPos = ((int)pos.x*UNIT_SIZE) + foods[i].fwidth;
 foods[i].position.y = foods[i].yPos = ((int)pos.y*UNIT_SIZE); //Position the foods randomly
 }
}

int removeItem(PVector playerpos){
 int xCoord = (int)playerpos.x*2 / UNIT_SIZE; //Gotta multiply stuff by 2 for more precision (if items are on same tile, it divides the tile into two separate bits)
 int yCoord = (int)playerpos.y*2 / UNIT_SIZE;
 for(int i = 0; i < foods.length; i++){ 
   if((int)foods[i].centerpos.y*2/UNIT_SIZE == yCoord  && (int)foods[i].centerpos.x*2/UNIT_SIZE == xCoord && foods[i].onGround && foods[i].visible){ //Has to be visible and on ground, or player keeps picking up dropped item
     if(i == foods.length-1){ //Has player picked up the power food?
       powerfood.visible = false; //Remove it
       giu.powered = true; //Give Giuseppe the attack power
     }
     else{
     sndFood.trigger();
     foods[i].position = new PVector(0,0); //TEMP solution, maybe set to visible = false?
     return i; //Return ID of the food picked up
     }
 } }
 return -1; //If no food picked up, just return -1
}

//Reset player within the world    
void resetPlayer(){
  if(stateOfProgram == stateBossLevel)stateOfProgram =stateGame;
  giu.position.x = startX;
  giu.position.y = startY;
}
  
//Helper method to position character, enemy or food on top of the platform
float squareTop(PVector playerpos){
 int playerY = int(playerpos.y); 
 playerY = playerY / UNIT_SIZE;
 return float(playerY*UNIT_SIZE);
}

//Method which returns whatever happens to be on that world square. Used for both main level and boss level, by checking the state
int squareAt(PVector location){
  int levelwide, leveltall;  
  if(stateOfProgram != stateBossLevel){levelwide = UNITS_WIDE; leveltall = UNITS_TALL;}
  else{levelwide = BOSS_WIDE; leveltall = BOSS_TALL;}

  float levelx = location.x/UNIT_SIZE;
  float levely = location.y/UNIT_SIZE;
  if(levelx <= 0 || levely <= 0|| levelx >=levelwide)
  return TILE_PLATFORM;
  if(levely >= leveltall)
  return TILE_EMPTY;
  if(stateOfProgram != stateBossLevel)
  return grid[int(levely)][int(levelx)];
  else
  return bossGrid[int(levely)][int(levelx)];  
}

//Helper method, returns distance between two vectors
int distance(PVector location1, PVector location2){
  float x = pow(location2.x - location1.x,2.0);
  float y = pow(location2.y - location1.y,2.0);
  return (int)sqrt(x+y);
}
  
//Set the square at a certain location
void setSquare(PVector location, int type){
  float levelx = location.x/UNIT_SIZE;
  float levely = location.y/UNIT_SIZE;
  grid[int(levely)][int(levelx)] = type;
}

//Method which checks whether all the correct foods have been dropped.
//If they have, place the power food in the level.
void checkCompleteness(){
  if(!allFoodsDropped){ //Don't do the rest if it's alread been confirmed
  if(foodsdropped == correctcounter){
  allFoodsDropped = true;
  powerfood.position.x = powerfood.xPos = (int)(powerfoodpos.x*UNIT_SIZE); //+ foods[6].fwidth;
  powerfood.position.y = powerfood.yPos = (int)(powerfoodpos.y*UNIT_SIZE);
  }
  }
}
//Collision detection method between two position vectors
  boolean collision(PVector positiona, PVector positionb){
    float Xa = positiona.x;
    float Xb = positionb.x;
    float Ya = positiona.y;
    float Yb = positionb.y;
    if(Math.abs(Xa-Xb) < (UNIT_SIZE/3) && Math.abs(Ya-Yb) < (UNIT_SIZE/3))
    return true;
    return false;
  }
  
  //Check if Giuseppe has collided with an enemy
  int collideEnemy(PVector giuposition){
     for(int l = 0; l < enemies.length; l++){
       PVector enemypos = new PVector(enemies[l].position.x,enemies[l].position.y - enemies[l].fheight/2);
       if(collision(giuposition,enemypos) && enemies[l].facingRight){
       //enemies[l].velocity.x = -enemies[l].velocity.x; This sometimes makes the enemy fall off their platform
       return 1; //Return this if enemy hits from left
       }
       else if(collision(giuposition,enemypos) && !enemies[l].facingRight){
      // enemies[l].velocity.x = -enemies[l].velocity.x;  This sometimes makes the enemy fall off their platform
       return 2; //Return if enemy hits from right
       }
     }
     return 0; //Return if no collision
  }
  
  //This method checks if an enemy is contacted by the attack power of Giuseppe.
  //xmin and xmax represent the attack range, and y is the attack height
  boolean enemyhit(PVector enemypos, float xmin, float xmax, float y){
   if(Math.abs(enemypos.y - y) < (UNIT_SIZE/2) && (enemypos.x >= xmin && enemypos.x <= xmax))
     return true;
   else
     return false;
  }
  
  //Launches an attack, and checks if it hit anything
  void attackEnemy(PVector attackposition, boolean rightFacing){
  float attackstartx, attackendx;
     if(rightFacing){attackendx = attackposition.x + UNIT_SIZE/2;attackstartx = attackposition.x;} //If facing right, attack extends rightwards
     else {attackendx = attackposition.x; attackstartx = attackposition.x - UNIT_SIZE/2;} //Otherwise it extends to the left
     float attacky = attackposition.y;
     
     if(stateOfProgram != stateBossLevel) //If we're in the main level
  for(int l = 0; l < enemies.length; l++){ 
      if(enemyhit(enemies[l].leftside,attackstartx,attackendx,attacky) || enemyhit(enemies[l].rightside,attackstartx,attackendx,attacky)){
        enemies[l].visible = false; //Destroy the enemy
        enemies[l].position = new PVector(0,0); 
        level.penalties -=10; 
            }
  }
  //Otherwise, hurt the boss
  //The last meatball boss is killed in a different way, by defeating each of its claws in turn. Therefore check if the boss is the meatball
  else if(bossenemypath == "meatball.png"){ //Bad hack, but it works. 
      int clawdefeatedcounter = 0;
      int health = 0;
      for(int i = 0; i < bossenemy.claws.length;i++){
        
      if(enemyhit(bossenemy.claws[i].leftpos,attackstartx,attackendx,attacky) || enemyhit(bossenemy.claws[i].rightpos,attackstartx,attackendx,attacky)){
        bossenemy.claws[i].visible = false; 
        bossenemy.claws[i].position = new PVector(0,0);
      }
      if(!bossenemy.claws[i].visible)
         clawdefeatedcounter++;
      else
         health+=6;
      }
      bossenemy.health = health;
      if(clawdefeatedcounter == 4){
        timetospare+= leveltime;
        stateOfProgram = stateWon; //If all four claws have been defeated
        music.close();
        music = minim.loadFile("victory.mp3", 1024); //Play a victory fanfare
        music.play();
      }
  }
  else if(enemyhit(bossenemy.weakpoint, attackstartx,attackendx,attacky))
      if(bossenemy.health--<= 0){
        stateOfProgram = stateWon; //If the boss enemy's health runs out.
        timetospare += leveltime; //Add remaining time
        music.close();
        music = minim.loadFile("victory.mp3", 1024); //Play a victory fanfare
        music.play();
      }
    }
    
  //Initialise the boss level
  void loadBossLevel(){
  music.close();
  music = minim.loadFile("BossLevelMusic.mp3", 1024);
  music.loop();
    for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
       if(bossGrid[j][i] == World.TILE_START){
        giu.position.x = (i*UNIT_SIZE + giu.giuwidth); //Save for later resetting
         giu.position.y = j*UNIT_SIZE;
       }       
    }
   }
 bossenemy = new BossEnemy((World.BOSS_WIDE * World.UNIT_SIZE)/2 + 100,UNIT_SIZE,25,0.0,0.0,loadImage(bossenemypath));

  }
  //Render the boss level
  void renderBossLevel(){
   for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
       if(bossGrid[j][i] == TILE_PLATFORM)
        image(level.tile,i*UNIT_SIZE,(j)*UNIT_SIZE);
    }
   }
  }

  //Check for a collision between the boss and the character. If a collision occurs, reset the player in the main level
  void checkBoss(){
    //Again, the meatball enemy has four separate collision points, rather than one large mass
    if(bossenemypath == "meatball.png"){
      for(int i = 0; i < bossenemy.claws.length;i++){
      if(collision(giu.centerpos,bossenemy.claws[i].position) && bossenemy.claws[i].visible){
         music.close();
       music = minim.loadFile("PinballSpring.mp3", 1024); //Play level music again
      music.loop();
      resetPlayer();
      }
      }
    }
    else
    //The other two bosses are large masses, and an intersection with them and Giuseppe is checked for at each of the boss's edges
    if(collision(giu.centerpos, bossenemy.leftside) || collision(giu.centerpos, bossenemy.rightside) || collision(giu.centerpos, bossenemy.topmiddle) || collision(giu.centerpos,bossenemy.position)
    || collision(giu.centerpos, bossenemy.bottomleft) || collision(giu.centerpos, bossenemy.bottomright) || collision(giu.centerpos, bossenemy.topleft) || collision(giu.centerpos, bossenemy.topright))
    {
       music.close();
       music = minim.loadFile("PinballSpring.mp3", 1024); //Play level music again
      music.loop();
      resetPlayer();
    }  
  }
  
  void moveBoss(PVector giupos){
    //Each boss has its own specific movement function. Check which boss is loaded according to the filepath. Crappy hack, but effective all the same
    if(bossenemypath=="scone.png")
    bossenemy.updatescone(giupos,giu.velocity);
    else if(bossenemypath=="meatball.png")
    bossenemy.updatemeatball(giupos);
    else if(bossenemypath=="mussel.png")
    bossenemy.updatemussel(giupos);
}

  //Render the normal level
  void render(){
   int foodcounter = 0;
   for(int i = 0; i < 20; i++){
    for(int j = 0; j < 25; j++){
      if(grid[j][i] == TILE_PLATFORM)     
         image(level.tile,i*UNIT_SIZE,(j)*UNIT_SIZE); 
    else if(grid[j][i] == 6)
         image(level.pot,i*UNIT_SIZE,j*UNIT_SIZE); 
    else if(grid[j][i] == 5 || grid[j][i] == 9)
         image(level.theexit,i*UNIT_SIZE,j*UNIT_SIZE);
    else if(grid[j][i] == 7)
         image(level.ladder,i*UNIT_SIZE,j*UNIT_SIZE);
    }   
 }
   foodsdropped = 0;
   for(int k = 0; k < foods.length; k++){
     if(foods[k].dropped)
     foodsdropped++;
     else
     foods[k].update();      //Update number of foods dropped
  }

}
//Move all the enemies (if they are visible)
public void moveEnemies(PVector giuposition){
    for(int l = 0; l < enemies.length; l++){
      if(enemies[l].visible)enemies[l].update(giuposition);
  }
}
}


