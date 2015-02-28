
//credits
//created by kim lister
//dragon image from Antonella Nigro, Wikimedia Commons
//snowman image from Zeus Box, Wikimedia Commons

//declare images
PImage firemon_image;
PImage icemon_image;
PImage grass_image;
PImage water_image;
PImage fire_image;
PImage ice_image;
PImage dirt_image;
PImage steam_image;

//declare monsters
Monster fire_monster;
Monster ice_monster;

//declare grid
Tile[][] game_grid;

//declare timer
int timer;
int TIMER_MAX=150;

//declare game state
int state;

//declare grid dimensions
int grid_w;
int grid_h;

//declare moves
int fire_choice;
int ice_choice;

void setup() {
  frameRate(30);
  size(1000, 600);
  init_game();
}

void draw() {
  background(0);
  timer++;
  
  switch(state) {
    case 0: update_choose();
            break;
    case 1: update_action();
            break;
    case 2: update_over();
            break;
    //case default: state = 0;
    //              timer = -1;
  }
  
}
void display_health() {
  textSize(18);
  fill(0);
  // display ice health in top left
  textAlign(LEFT, TOP);
  text("" + ice_monster.health, 0, 0, grid_w*100, grid_h*100);
  textAlign(RIGHT, TOP);
  // display fire health in top right
  text("" + fire_monster.health, 0, 0, grid_w*100, grid_h*100);
  // TAKE THIS OUT LATER
  textAlign(RIGHT,TOP);
  // Timer Display
  text("" + ((TIMER_MAX-timer)/10), 0,grid_h*5,grid_w*100, grid_h*110);
}
void init_game() {
  
  firemon_image = loadImage("firemon.png");
  icemon_image = loadImage("icemon.png");
  grass_image = loadImage("grass.png");
  water_image = loadImage("water.png");
  fire_image = loadImage("fire.png");
  ice_image = loadImage("ice.png");
  dirt_image = loadImage("dirt.png");
  steam_image = loadImage("steam.png");
  
  //place monsters
  fire_monster = new Monster(6, 2, 1, firemon_image);
  ice_monster = new Monster(3, 3, -1, icemon_image);
  
  //EDIT: grid dimensions
  grid_w = 10;
  grid_h = 6;
  game_grid = new Tile[grid_w][grid_h];
  for(int a=0; a<grid_w; a++) {
    for(int b=0; b<grid_h; b++) {
      game_grid[a][b] = new Tile(int(random(2)), false);
    }
  }
  
  //this will record which move players choose
  fire_choice = 0;
  ice_choice = 0;
  
  //music.loop();
  
  state = 0;
  
  //in draw(), the timer gets incremented first,
  //so when you reset it use -1, not 0
  timer = -1;
}
class Monster {
  
  int xco;
  int yco;
  
  int type;
  
  int health;
  
  PImage sprite;
  
  Monster(int x, int y, int t, PImage img) {
    xco = x;
    yco = y;
    
    type = t;
    
    health = 10;
    
    sprite = img;
  }
  

  void move(int x, int y) {
    xco = x;
    yco = y;
  }
  
  void display() {
    image(sprite, 100*xco, 100*yco);
  }
}
// beam attack (down/S)
// moderate damage to everything on the same row/col
void beam(int type, int x, int y) {
  for(int a=0; a<grid_w; a++) {
    for(int b=0; b<grid_h; b++) {
      if(a==x || b==y) {
        game_grid[a][b].temp(type*3);
      }
    }
  }
}

// blast attack (up/W)
// moderate damage to everything in a 2-square radius
void blast(int type, int x, int y) {
  for(int a=0; a<grid_w; a++) {
    for(int b=0; b<grid_h; b++) {
      if((abs(a-x)<2) && (abs(b-y)<2)) {
        game_grid[a][b].temp(type*4);
      }
    }
  }
}

// meteor attack (right/D)
// high damage to a small number of randomly selected tiles
void meteor(int type, int x, int y) {
  for(int i=0; i<8; i++) {
    int a = int(random(grid_w));
    int b = int(random(grid_h));
    game_grid[a][b].temp(type*6);
  }
}

// wave attack (left/A)
// low damage to a large area (radius 4)
void wave(int type, int x, int y) {
  for(int a=0; a<grid_w; a++) {
    for(int b=0; b<grid_h; b++) {
      if((abs(a-x)<4) && (abs(b-y)<4)) {
        game_grid[a][b].temp(type*2);
      }
    }
  }
}
class Tile {
  boolean obscured;
  
  int type;
  //0 = grass
  //1 = water
  //2 = fire
  //3 = ice
  //4 = dirt
  
  //has it just been hit by ice/fire?
  int effect;
  
  //ranges from -5 (cold) to 5 (hot)
  int heat;
  
  Tile(int t, boolean o) {
    type = t;
    obscured = o;
    effect = 0;
    heat = 0;
  }
  
  void temp(int change) {
    heat += change;
    if(change>0) effect+=2;
    else effect++;
    /* Change effect value based on attack type;
     * will be checked cumulatively.
     * Fire -> +1
     * Ice  -> +2
     * Fire attack only: total 1
     * Ice attack only: total 2
     * Fire and ice attacks: total 3
     */
  }
}

void display_grid() {
  for(int a=0; a<grid_w; a++) {
    for(int b=0; b<grid_h; b++) {
      int terrain = game_grid[a][b].type;
      int e = game_grid[a][b].effect;
      // if unaffected, display terraain
      if(e==0) {
        switch(terrain) {
          case 0: image(grass_image, 100*a, 100*b);
                  break;
          case 1: image(water_image, 100*a, 100*b);
                  break;
          case 2: image(fire_image, 100*a, 100*b);
                  break;
          case 3: image(ice_image, 100*a, 100*b);
                  break;
          case 4: image(dirt_image, 100*a, 100*b);
                  break;
        }
      } else if(e==1) { // only water attack
        fill(100, 100, 200);
        rect(100*a, 100*b, 100, 100);
      } else if(e==2) { // only fire attack
        fill(200, 100, 100);
        rect(100*a, 100*b, 100, 100);
      } else { // attacks from both elements
        fill(200);
        rect(100*a, 100*b, 100, 100);
      }
      
      if(game_grid[a][b].obscured) {
        image(steam_image, 100*a, 100*b);
      }
    }
  }
}
void update_action() {
  if(timer==0) {
    // each monster attacks, signaling type and location
    switch(fire_choice) {
      case 0: //
              break;
      case 1: blast(1, fire_monster.xco, fire_monster.yco); // up/W
              break;
      case 2: beam(1, fire_monster.xco, fire_monster.yco); // down/S
              break;
      case 3: wave(1, fire_monster.xco, fire_monster.yco); // left/A
              break;
      case 4: meteor(1, fire_monster.xco, fire_monster.yco); // right/D
              break;
    }
    
    switch(ice_choice) {
      case 0: //
              break;
      case 1: blast(-1, ice_monster.xco, ice_monster.yco); // up/W
              break;
      case 2: beam(-1, ice_monster.xco, ice_monster.yco); // down/S
              break;
      case 3: wave(-1, ice_monster.xco, ice_monster.yco); // left/A
              break;
      case 4: meteor(-1, ice_monster.xco, ice_monster.yco); // right/D
              break;
    }
    
    fire_choice = 0;
    ice_choice = 0;
  }
  
  display_grid();
  
  fire_monster.display();
  ice_monster.display();
  
  display_health();

  textSize(18);
  fill(255);
  textAlign(CENTER, TOP);
  text("make a move", 0, 0, grid_w*100, grid_h*100);
  
  if(keyPressed) {
    if(key == CODED) {
      if(keyCode == UP) {
        fire_choice = 1;
      }else if(keyCode == DOWN) {
        fire_choice = 2;
      } else if(keyCode == LEFT) {
        fire_choice = 3;
      } else if(keyCode == RIGHT) {
        fire_choice = 4;
      }
    }
    
    if(true) {
      if(key == 'W' || key == 'w') {
        ice_choice = 1;
      } else if(key == 'S' || key == 's') {
        ice_choice = 2;
      } else if(key == 'A' || key == 'a') {
        ice_choice = 3;
      } else if(key == 'D' || key == 'd') {
        ice_choice = 4;
      }
    }
  }
  
  // after enough time has passed
  if(timer>TIMER_MAX) {
    // iterate over the grid
    for(int a=0; a<grid_w; a++) {
      for(int b=0; b<grid_h; b++) {
        // for each tile, check/fix heat values
        int terrain = game_grid[a][b].type;
        if(game_grid[a][b].heat > 5) game_grid[a][b].heat = 5;
        if(game_grid[a][b].heat < -5) game_grid[a][b].heat = -5;
        int h = game_grid[a][b].heat;
        
        switch(terrain) {
            case 0: if(h>2) game_grid[a][b].type = 2;
                    if(h<-2) game_grid[a][b].type = 3;
                    break;
            case 1: if(h>2) game_grid[a][b].type = 4;
                    if(h<-2) game_grid[a][b].type = 3;
                    break;
            case 2: if(h<3) game_grid[a][b].type = 4;
                    break;
            case 3: if(h>-3) game_grid[a][b].type = 1;
                    break;
            case 4: if(h<2 && h>-2) game_grid[a][b].type = 0;
                    break;
        }
        
        game_grid[a][b].effect = 0;
      }
    }
    
    // move monsters
    switch(fire_choice) {
      case 0: //
              break;
      case 1: if(fire_monster.yco > 0) fire_monster.yco--;
              break;
      case 2: if(fire_monster.yco < grid_h-1) fire_monster.yco++;
              break;
      case 3: if(fire_monster.xco > 0) fire_monster.xco--;
              break;
      case 4: if(fire_monster.xco < grid_w-1) fire_monster.xco++;
              break;
    }
    
    switch(ice_choice) {
      case 0: //
              break;
      case 1: if(ice_monster.yco > 0) ice_monster.yco--;
              break;
      case 2: if(ice_monster.yco < grid_h-1) ice_monster.yco++;
              break;
      case 3: if(ice_monster.xco > 0) ice_monster.xco--;
              break;
      case 4: if(ice_monster.xco < grid_w-1) ice_monster.xco++;
              break;
    }
    
    // reset choices
    fire_choice = 0;
    ice_choice = 0;
    
    // change each monster's health based on the heat value of their location
    int fire_temp = game_grid[fire_monster.xco][fire_monster.yco].heat;
    int ice_temp = game_grid[ice_monster.xco][ice_monster.yco].heat;
    
    fire_monster.health += fire_temp;
    ice_monster.health -= ice_temp;
    
    // check for game over
    if(fire_monster.health < 1 || ice_monster.health < 1) state = 2;
    else state = 0;
    
    timer = -1;
  }
}
void update_choose() {
  display_grid();
  
  fire_monster.display();
  ice_monster.display();
  
  display_health();
  
  textSize(18);
  fill(255);
  textAlign(CENTER, TOP);
  text("choose an attack", 0, 0, grid_w*100, grid_h*100);  

  if(keyPressed) {
    if(key == CODED && fire_choice==0) {
      if(keyCode == UP) {
        fire_choice = 1;
      }else if(keyCode == DOWN) {
        fire_choice = 2;
      } else if(keyCode == LEFT) {
        fire_choice = 3;
      } else if(keyCode == RIGHT) {
        fire_choice = 4;
      }
    }
    
    if(ice_choice==0) {
      if(key == 'W' || key == 'w') {
        ice_choice = 1;
      } else if(key == 'S' || key == 's') {
        ice_choice = 2;
      } else if(key == 'A' || key == 'a') {
        ice_choice = 3;
      } else if(key == 'D' || key == 'd') {
        ice_choice = 4;
      }
    }
  }
  
  if((fire_choice!=0 && ice_choice!=0) || timer>TIMER_MAX) {
    timer = -1;
    state = 1;
  }
  
}
void update_over() {
  display_grid();
  
  fire_monster.display();
  ice_monster.display();
  
  display_health();
  
  if(timer>TIMER_MAX) {
    init_game();
  }
}


