
int stage = 0;         // controls the stage of the game
int bit = 3;           // size of the blocks, used for position
color c;               // color of blocks
int BI = 0;            // number of block instances
int platNum = 6;       // number of platforms
int colNum = 6;        // size of color array
int parasNum = 4;      // number of parameters
int conNum = 5;        // number of conveyors
int dirNum = 2;        // number of direction strings
int butNum = 6;        // number of buttons
int scoreNum = 5;      // number of scores tracked
int timerVal = 30;     // game timer
int timerCheck = 0;    // check to decrement timer
int timer = 100;       // timer for block spawning
boolean timed = true;  // timed mode
int score = 0;         // score
boolean HS = false;    // sets high score list once
int spawn = 0;         // type of spawn
int d = 0;             // variable for randDir()
int i,j,k;             // iterator variables



// int array for high scores timed and unlimited

int[] scores = new int[scoreNum];

int[] scores2 = new int[scoreNum];

// string array for right left conveyors

String[] direction = new String[dirNum];

// block spawn array

int[] paras = new int[parasNum];

// color array for blocks

color[] colors = new color[colNum];

// class block array
  
Block[] blocks = new Block[BI];      // block array, starts at size 0, uses append()

// class platform array

Platform[] platforms = new Platform[platNum];

// class conveyor array

Conveyor[] conveyors = new Conveyor[conNum];

// class button array

Button[] buttons = new Button[butNum];



void setup(){
  
  frameRate(20);
  size(600,600);
  colorMode(HSB,360,100,100);            // brighter, better colors
  textAlign(CENTER,CENTER);
  
  for(i=0;i<colNum;i++){
    colors[i] = color(i*60,99,99);       // new block color, limits to 6 pure colors
  }
  
  // score array
  
  for(i=0;i<scoreNum;i++){
    scores[i] = 0;
    scores2[i] = 0;
  }
  
  i = 625;
  
  // direction array
  
  direction[0] = "RIGHT";
  direction[1] = "LEFT";
  
  // spawn array vals
  
  paras[0] = 43;
  paras[1] = 88;
  paras[2] = 111;
  paras[3] = 156;
  
  // place platforms
  
  platforms[0] = new Platform(1*bit,175*bit,29*bit,colors[0]);
  platforms[1] = new Platform(34*bit,175*bit,29*bit,colors[1]);
  platforms[2] = new Platform(68*bit,175*bit,29*bit,colors[2]);
  platforms[3] = new Platform(102*bit,175*bit,29*bit,colors[3]);
  platforms[4] = new Platform(136*bit,175*bit,29*bit,colors[4]);
  platforms[5] = new Platform(170*bit,175*bit,29*bit,colors[5]);
  
  // place conveyors
  
  conveyors[0] = new Conveyor(16*bit,125*bit,32*bit);
  conveyors[1] = new Conveyor(83*bit,125*bit,33*bit);
  conveyors[2] = new Conveyor(151*bit,125*bit,33*bit);
  conveyors[3] = new Conveyor(33*bit,75*bit,65*bit);
  conveyors[4] = new Conveyor(101*bit,75*bit,66*bit);
  
  // create buttons
  
  buttons[0] = new Button(300,175,245,40,"TIMED",2);
  buttons[1] = new Button(300,275,245,40,"UNLIMITED",4);
  buttons[2] = new Button(300,375,245,40,"HIGH SCORES",5);
  buttons[3] = new Button(300,475,245,40,"INSTRUCTIONS",6);
  buttons[4] = new Button(300,550,190,40,"BACK",1);
  buttons[5] = new Button(300,425,190,40,"MENU",7);
}



void draw(){
  if(stage == 0){                             // start screen
    if(i>225){
      i-=5;
    }
    noStroke();
    fill(0);
    rect(0,0,600,600);
    textSize(50);
    fill(359);
    text("SIFTING SANDS", 300, i);
    
    textSize(32);
    text("PRESS SPACE",300,i+150);
    
    if(keyPressed == true && key == ' '){
      stage = 1;
    }
    
  } else if(stage == 1){
    
    noStroke();
    fill(0);
    rect(0,0,600,600);
    textSize(50);
    fill(359);
    text("SIFTING SANDS", 300, 75);
    timed = true;
    
    for(i=0;i<butNum-2;i++){
      buttons[i].draw();
    }
    
  } else if(stage == 2){                      // playing the game
    
    noStroke();
    fill(0);
    rect(0,0,600,600);
    textSize(20);
    fill(359);
    text("Score: " + score, 540,25);
    
    if(timed == true){
      text("Time: " + timerVal,50,25);
      if(timerVal == 0){
        stage = 3;
      }
      if(timerCheck++==20){
        timerCheck = 0;
        timerVal -= 1;
      }
    }
    
    if(keyPressed == true && key == ' '){
      stage = 3;
    }
    
    if(timer++>=100){                         // change the spawn location and color
      timer = 1;
      spawn = int(random(8));
    }
    if(timer%5==0){
      makeBlock();
    }
    
    for(i=0;i<BI;i++){                        // for each object in the array, call methods  
      
      if(blocks[i].stable == false){  
        blocks[i].update();                   // movement update
      }
      
      blocks[i].draw();
    }
    
    for(i=0;i<platNum;i++){
      platforms[i].draw();
    }
    
    for(i=0;i<conNum;i++){
      conveyors[i].draw();
    }
    
  } else if(stage == 3){                      // game over screen
  
    noStroke();
    fill(0);
    rect(0,0,600,600);
    textSize(50);
    fill(359);
    text("GAME OVER", 300, 200);
    textSize(32);
    text("Score: " + score, 300, 300);
    
    if(HS == false){
      HS = true;
      if(timed == true){
        for(i=0;i<scoreNum;i++){
          if(score > scores[i]){
            if(i == scoreNum - 1){
              scores[i] = score;
              i = scoreNum;
            } else{
              for(k=scoreNum-1;k>i;k--){
                scores[k] = scores[k-1];
              }
              scores[i] = score;
              break;
            }
          }
        }
      } else {
        for(i=0;i<scoreNum;i++){
          if(score > scores2[i]){
            if(i == scoreNum - 1){
              scores2[i] = score;
              i = scoreNum;
            } else{
              for(k=scoreNum-1;k>i;k--){
                scores2[k] = scores2[k-1];
              }
              scores2[i] = score;
              break;
            }
          }
        }
      }
    }
    
    buttons[5].draw();
    
  } else if(stage == 4){                      // set unlimited mode
    
    timed = false;
    stage = 2;
    
  } else if(stage == 5){                      // high scores
    
    noStroke();
    fill(0);
    rect(0,0,600,600);
    textSize(50);
    fill(359);
    text("HIGH SCORES", 300, 75);
    
    textSize(32);
    text("TIMED",150,200);
    text("UNLIMITED",450,200);
    
    textAlign(LEFT,CENTER);
    
    text("1.  " + scores[0],120,250);
    text("2.  " + scores[1],120,300);
    text("3.  " + scores[2],120,350);
    text("4.  " + scores[3],120,400);
    text("5.  " + scores[4],120,450);
    
    text("1.  " + scores2[0],410,250);
    text("2.  " + scores2[1],410,300);
    text("3.  " + scores2[2],410,350);
    text("4.  " + scores2[3],410,400);
    text("5.  " + scores2[4],410,450);
    
    textAlign(CENTER,CENTER);
    
    buttons[4].draw();
    
  } else if(stage == 6){                      // instructions
    
    noStroke();
    fill(0);
    rect(0,0,600,600);
    textSize(50);
    fill(359);
    text("INSTRUCTIONS", 300, 75);
    
    textSize(25);
    
    text("Earn points by placing blocks on the\nplatform of corresponding color",300,165);
    text("Lose points from incorrectly placed blocks",300,225);
    text("Change the direction of a conveyor by clicking it",300,285);
    text("Press SPACE while playing to quit to the menu",300,345);
    text("TIMED has a time limit of 30 seconds",300,405);
    text("UNLIMITED has no time limit, though there is\na maximum possible score",300,465);
    
    buttons[4].draw();
    
  } else if(stage == 7){                      // reset level and go to menu
    
    timerVal = 30;
    timerCheck = 0;
    timer = 100;
    score = 0;
    HS = false;
    spawn = int(random(8));
    
    for(i=0;i<conNum;i++){
      conveyors[i].dir = randDir();
    }
    
    while(BI != 0){
      BI-=1;
      blocks = shorten(blocks);
    }
    
    BI = 0;
    stage = 1;
    
  }
}

void mouseClicked(){            // change conveyor direction
  if(stage == 1){
    
  }else if(stage == 2){
    for(i=0;i<conNum;i++){
      if(mouseX >= conveyors[i].X && mouseX <= conveyors[i].X + conveyors[i].S){
        if(mouseY >= conveyors[i].Y && mouseY <= conveyors[i].Y + 15){
          conveyors[i].dir *= -1;
        }
      }
    }
  }
}



//         //
// CLASSES //
//         //

// class block

class Block {
  int X;                              // x position
  int Y;                              // y position
  color C;                            // color of block
  boolean stable = false;             // bool to limit collision check
  int NB = 100000;                    // stores collision data
  int dir;                            // stores direction data
  int ID;
  color RpC;                          // color of platform it is on
  int test;                           // ID of block on top of
  boolean conveyed = false;           // on conveyor
  
  Block(int x, int y, color shade, int num){
    X = x;
    Y = y;
    C = shade;
    ID = num;
  }
  
  void update(){
    
    if(Y==height-bit){                // if off screen, render block stable and off screen
        stable = true;
        X = -bit;
        Y = 0;
    }
      
    if(stable == false){
      
      for(k=0;k<conNum;k++){
        if(Y+bit == conveyors[k].Y){
          if(X >= conveyors[k].X && X <= conveyors[k].X + conveyors[k].S-bit){
            conveyed = true;
          }
        } else {
          conveyed = false;
        }
        if(conveyed == true){
          X += conveyors[k].dir*bit;
          Y -= bit;
        }
      }
        
      for(k=0;k<platNum;k++){          // if colliding with a platform, stop falling
        if(Y+bit == platforms[k].Y){
          if(X >= platforms[k].X && X <= (platforms[k].X + platforms[k].size - bit)){
            stable = true;
            RpC = platforms[k].platColor;
            if(C == RpC){
              score++;
              C = color(359);
            } else{
              score--;
              C = color(120);
              if(score < 0){
                score = 0;
              }
            }
          }
        }
      }
      
      for(j=0;j<BI;j++){               // checks to see if block is on top of another block
      
        if(ID != j && X == blocks[j].X && Y == blocks[j].Y){    // moves blocks that occupy the exact same space
          blocks[j].Y -= bit;
          blocks[j].stable = false;
        }
        
        if(blocks[j].stable == true){
          if((blocks[j].X+bit) == X && blocks[j].Y == Y){
            NB += 10000;
          }
          if((blocks[j].X+bit) == X && (blocks[j].Y-bit) == Y){
            NB += 1000;
          }
          if(blocks[j].X == X && (blocks[j].Y-bit) == Y){
            NB += 100;
            test = blocks[j].ID;
          }
          if((blocks[j].X-bit) == X && (blocks[j].Y-bit) == Y){
            NB += 10;
          }
          if((blocks[j].X-bit) == X && blocks[j].Y == Y){
            NB += 1;
          }
        }
      }
    }
    
    if(NB>=100100){
      switch(NB) {                    // checks the collision situation
        
        case 100100:                  // case unstable collision
          dir = randDir();
          X += dir * bit;             // move to left or right
          NB = 100000;
          break;
          
        case 101100:                  // case could be stable R
          X += bit;
          NB = 100000;
          break;
          
        case 100110:                  // case could be stable L
          X -= bit;
          NB = 100000;
          break;
          
        case 101110:                  // stable cases
        case 111110:
        case 101111:
        case 111111:
          stable = true;
          RpC = blocks[test].RpC;
          if(C == RpC){
            score++;
            C = color(359);
          } else{
            score--;
            if(score < 0){
              score = 0;
            }
            C = color(120);
          }
          NB = 100000;
          break;
        
        case 110100:  
        case 111100:                  // case slope R
          X +=bit;
          NB = 100000;
          break;
        
        case 100101:  
        case 100111:                  // case slope L
          X -= bit;
          NB = 100000;
          break;
      }
    }
    
    if(stable==false){       // if it isn't immobilised
      Y += bit;
      NB=100000;
    }    
  }
  
  void draw(){
    noStroke();
    fill(C);                                  // draw block at updated position
    rect(X,Y,bit,bit);
  }
}

// class platform

class Platform {
  int X;                   // x pos
  int Y;                   // y pos
  int size;                // length of platform
  color platColor;         // color of platform
  
  Platform(int x, int y, int s, color COLOR){
    X = x;
    Y = y;
    size = s;
    platColor = COLOR;
  }
  
  void draw(){
    noStroke();
    fill(platColor);
    rect(X,Y,size,5);
  }
}

// class conveyors

class Conveyor {
  int X;
  int Y;
  int S;
  int dir;
  
  Conveyor(int x, int y, int size){
    X = x;
    Y = y;
    S = size;
    dir = randDir();
  }
  
  void draw(){
    stroke(359);
    
    if(dir==-1){
      fill(colors[4]);
      dirNum = 1;
    } else {
      fill(colors[0]);
      dirNum = 0;
    }
    
    rect(X,Y,S,15);
    noStroke();
    fill(359);
    textSize(10);
    text(direction[dirNum],S/2+X,Y+7);
  }
}

// class buttons

class Button {
  int X;      // x position of button
  int Y;      // y position of button
  int L;      // length of button
  int H;      // height of button
  String T;   // button text
  int SJ;     // stage jump when clicked
  
  Button(int x, int y, int l, int h, String t, int sj){
    X = x;
    Y = y;
    L = l;
    H = h;
    T = t;
    SJ = sj;
  }
  
  void draw(){
    textSize(32);
    fill(150);
    noStroke();
    rect(X-L/2,Y-H/2,L,H);
    fill(359);
    text(T,X,Y);
    
    if(mouseX >= X-L/2 && mouseX <= X+L/2){
      if(mouseY >= Y-H/2 && mouseY <= Y+H/2){
        textSize(32);
        fill(359);
        noStroke();
        rect(X-L/2,Y-H/2,L,H);
        fill(0);
        text(T,X,Y);
        if(mousePressed == true){
          stage = SJ;
        }
      } else {
        textSize(32);
        fill(150);
        noStroke();
        rect(X-L/2,Y-H/2,L,H);
        fill(359);
        text(T,X,Y);
      }
    }
  }
}
  
  
//                  //
// HELPER FUNCTIONS //
//                  //

// block spawner

void makeBlock(){
  switch(spawn) {
    
    case 0:
      int Xmin = paras[0];
      int Xmax = paras[1];
      c = colors[0];
      break;
      
    case 1:
      int Xmin = paras[0];
      int Xmax = paras[1];
      c = colors[1];
      break;
      
    case 2:
      int Xmin = paras[0];
      int Xmax = paras[1];
      c = colors[2];
      break;
      
    case 3:
      int Xmin = paras[0];
      int Xmax = paras[1];
      c = colors[3];
      break;
      
    case 4:
      int Xmin = paras[2];
      int Xmax = paras[3];
      c = colors[2];
      break;
      
    case 5:
      int Xmin = paras[2];
      int Xmax = paras[3];
      c = colors[3];
      break;
      
    case 6:
      int Xmin = paras[2];
      int Xmax = paras[3];
      c = colors[4];
      break;
      
    case 7:
      int Xmin = paras[2];
      int Xmax = paras[3];
      c = colors[5];
      break;
  }
      
  BI++;                                                              // keep track of block numbers
  blocks = (Block[])append(blocks, new Block(int(random(Xmin*bit,Xmax*bit)/bit)*bit,-bit,c,BI-1));  // add new object to array
}

// random direction

int randDir(){            // generates either a 1 or -1
  d = int(random(-2,2));  // assigns -1, 0, or 1 to d
  while(d==0){               // if d is 0, "reroll" cast, we want 1 or -1
    d = int(random(-2,2));
  }
  return d;             // return 1 or -1
}


