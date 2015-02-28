
/*
 * pfcave.pde 0.1
 * 2009 philipp friedrich, contact@philippfriedrich.com
 *
 * non elegant palmos sfcave rewrite
 *
 */


/********************************************************/
/* config variables                                     */
/********************************************************/
int cfg_width = 940;
int cfg_height = 450;
int cfg_maxchange = 5;
float cfg_space_mod = 0.9994;
int cfg_playersize = 5;
float cfg_gravity = 1.0002;


/********************************************************/
/* game variables                                       */
/********************************************************/
float dir = 1;  // current direction of the player (gravity vs pushing)
long score = 0;
long maxscore = 0;
int push = 0; // increases when player presses space, works vs. gravity
int mode = 1; // game mode, 1=running, 0=lost, -1=lost and score printed
float cur_space = 450;  // space to play
float factor = 0.5;     // how far the cave can move max in the y axis for one x step

// the cave borders
int[] ylinetop = new int[cfg_width];
int[] ylinebottom = new int[cfg_width];

// the player (snake)
float[] yplayer = new float[cfg_width/2];

PFont myFont;


/********************************************************/
/* init/reset all variables                             */
/********************************************************/
void initcave() {
  
  // game variables
  score = 0;
  dir = 1;
  push = 0;
  cur_space = 400;
  
  // cave architecture
  for(int i = 0; i < width; i++) {
    ylinetop[i] = height/2-int(cur_space)/2;
    ylinebottom[i] = ylinetop[i]+int(cur_space);
  }

  // player data
  for(int i = 0; i < width/2; i++) {
    yplayer[i] = height/2;
  }
}


/********************************************************/
/* draw current frame                                   */
/********************************************************/
void drawframe () {
  background(51);
   
  // draw cave
  stroke(200);
  for(int i=1; i<width; i++) {    
    line(i, 0, i, ylinetop[i]);
    line(i, ylinebottom[i], i, height);
  }
  
  // draw player
  stroke(255);
  for(int i=1; i<width/2; i++) {    
    line(i-1, int(yplayer[i-1]), i, int(yplayer[i]) );
  }  
  
  // draw fancy explosion when lost
  if (mode < 1) {
    stroke(255,0,0);
    fill(255,0,0);
    ellipse(width/2, yplayer[width/2 - 1], 50, 50);
  }
  
}


/********************************************************/
/* setup()                                              */
/********************************************************/
void setup() 
{
  // i didnt use the global cfg_width
  size(cfg_width, cfg_height); 
  initcave();
  frameRate(50);
  myFont = loadFont("SansSerif-12.vlw");
  textFont(myFont);
}


/********************************************************/
/* display score                                        */
/********************************************************/
void drawscore()
{
  stroke(0);
  fill(0);
  text("max score: " + int(maxscore/10) + "  score: " + int(score/10), 1, 12); 
  
  // when lost tell the player how to restart
  if (mode == -1) {
    text("you failed. press RETURN to restart.", 1, 26);
  }
}

/********************************************************/
/* main looping routine                                 */
/********************************************************/
void draw() 
{
 
 // game is on
 if (mode == 1) {
   
  // Shift cave
  for(int i = 1; i < width; i++) {
    ylinetop[i-1] = ylinetop[i];
    ylinebottom[i-1] = ylinebottom[i];
  }
  
  // shift player
  for(int i = 1; i < width/2; i++) {
    yplayer[i-1] = yplayer[i];
  }
 
  // generate new cavepart
  ylinetop[width-1] =
    constrain( int( random(-cfg_maxchange, cfg_maxchange) + factor)
                 + ylinetop[width-1]
              , 0, height-int(cur_space+1));
              
  ylinebottom[width-1] = ylinetop[width-1] + int(cur_space);
  
  
  // calculate direction, gravity
  dir = pow(cfg_gravity, dir) * dir;
  
  // new value for player position
  yplayer[width/2-1] = constrain(yplayer[width/2- 2] * dir, 1, height-2);
  
  
  // detect collision, end of game
  if (yplayer[width/2-1] < ylinetop[width/2] ||
      yplayer[width/2-1] > ylinebottom[width/2]) {
    mode = 0;
  }

  // make playable space tighter
  cur_space *= cfg_space_mod;
  
  // count score
  score += 1;
  
  // keep cave funny, this is adding a up or down direction to the randomness
  if (ylinetop[width-1] < 2 || ylinebottom[width-1] > height-2) {
    factor *= -1; 
  }
    
 } else {  // collision detected
   if (mode == 0) {
     // save new max score
     maxscore = maxscore > score ? maxscore : score;
   
     mode = -1;
   }
 }
 
 drawframe();
 drawscore();
  
}


/********************************************************/
/* handle keyboard input                                */
/********************************************************/
void keyPressed() {
  
  // if game is running and space is pressed "push" snake up
  if (mode == 1 && key == ' ') {
    dir *= 0.997;
  }

  // game ended and enter or return starts a new one
  if (mode == -1 && (keyCode == ENTER || keyCode == RETURN)) {
    mode = 1;
    initcave();
  }

}

