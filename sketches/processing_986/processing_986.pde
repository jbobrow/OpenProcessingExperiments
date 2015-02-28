
/*

The Automataic Gardner
By Leander Harding
lharding@gmail.com
http://leander.fremde.org

Code based on the Conway's Game of Life example by Mike Davis
(http://www.processing.org/learning/topics/conway.html)

Released under GNU GPL v2.

*/

int sx, sy; 
int s = 8;
int[][] world;
int[][] update;
int[][] freshness;
Player player;
int frames = 1;
int change = 0;
int score = 0;
final int MAX_SEEDS = 32;
final int MAX_FRESH = 128;
int seeds = MAX_SEEDS;
boolean showScore = true;

class Player {
  int x;
  int y;
  int facing;
  int pressed;
  boolean uk, dk, lk, rk;
  
  public Player(int nx, int ny) {
    x = nx;
    y = ny;
    facing = LEFT;
    pressed = -1;
    uk = dk = lk = rk = false;
  }
  
  public void draw() {
    fill(255, 0, 0, 216);
    strokeWeight(0);
    rect(x*s-s, y*s-s, s*3, s*3);
    
    int xoff = 0;
    int yoff = 0;
    
    xoff = getXFacing()*s*3;
    yoff = getYFacing()*s*3;
    
    rect(x*s+xoff, y*s+yoff, s, s);
    
    //draw seeds indicator
    for(int i=0; i<seeds; i++) {
      if(i>=MAX_SEEDS-MAX_SEEDS/4)
        fill(100, 100, 255);
      else
        fill(0, 192, 0);
        
      rect(i*2*s+s/2, s/2, s, s);
    }
  }
  
  public void update() {
    if(lk && !cell(x-1, y)) {
      x--;
      facing = LEFT;
    }
    
    if(rk && !cell(x+1, y)) {
      x++;
      facing = RIGHT;
    }
    
    if(uk && !cell(x, y-1)) {
      y--;
      facing = UP;
    }
    
    if(dk && !cell(x, y+1)) {
      y++;
      facing = DOWN;
    }
    
    if(y<4) y=4;
    if(y>sy-6) y=sy-6;
    if(x<4) x=4;
    if(x>sx-6) x=sx-6;
  }
  
  int getXFacing() {
    switch(facing) {
      case LEFT:
        return -1;
      case RIGHT:
        return 1;
      default:
        return 0;
    }
  }

  int getYFacing() {
    switch(facing) {
      case UP:
        return -1;
      case DOWN:
        return 1;
      default:
        return 0;
    }
  }
  
  public void dirPressed(int dir) {
    switch(dir) {
      case LEFT:
        lk = true;
      break;
      case RIGHT:
        rk = true;
      break;
      case UP:
        uk = true;
      break;
      case DOWN:
        dk = true;
      break;  
    }
    
    facing = dir;
  }
  
  public void dirReleased(int dir) {
    switch(dir) {
      case LEFT:
        lk = false;
      break;
      case RIGHT:
        rk = false;
      break;
      case UP:
        uk = false;
      break;
      case DOWN:
        dk = false;
      break;  
    }
  }
  
  public void keyPress(int key) {
     if(key == ' ') {
       if(seeds>0) {
         seeds--;
         update[x+getXFacing()*3-1][y+getYFacing()*3] = 1;
         update[x+getXFacing()*3+1][y+getYFacing()*3] = 1;
         update[x+getXFacing()*3][y+getYFacing()*3-1] = 1;
         update[x+getXFacing()*3][y+getYFacing()*3+1] = 1;
       }
       else
         endSeason();
     }
  } 
}

boolean cell(int x, int y) {
  return world[x][y] != 0;
}

void endSeason() {
  showScore = true;
  score = change;
  change = 0;
  seeds = MAX_SEEDS;
  
  for(int x=0; x<sx; x++) {
    for(int y=0; y<sx; y++) {
      freshness[x][y] = MAX_FRESH;
    }
  }
}
 
void setup() 
{ 
  size(512, 512, P2D);
  noSmooth();
  frameRate(15);
  sx = width/s;
  sy = height/s;
  world = new int[sx][sy]; 
  update = new int[sx][sy]; 
  freshness = new int[sx][sy]; 
  
  textFont(loadFont("font.vlw"), 32);
  
  for(int x=0; x<sx; x++)
    for(int y=0; y<sy; y++)
      freshness[x][y] = MAX_FRESH;
  
  player = new Player(sx/2, sy/2);
} 
 
void draw() 
{ 
  background(0); 
  
  if(showScore) {
    fill(255);
    textAlign(CENTER);
    text( "changes: " + score +
          "\npress 's' for next season", sx*s/2, sy*s/2);
    return;
  }
  
  // Drawing and update cycle 
  for (int x = 0; x < sx; x=x+1) { 
    for (int y = 0; y < sy; y=y+1) { 
      if ((update[x][y] == 1) || (update[x][y] == 0 && world[x][y] == 1)) 
      { 
        world[x][y] = 1;
        
        if(update[x][y] == 1)
          fill(128, 255, 128);
        else
          fill(0, 128, 0);  
          
        strokeWeight(1); 
      } 
      else {
        fill(MAX_FRESH-freshness[x][y]);
        strokeWeight(0);
      }
      
      rect(x*s, y*s, s, s);
      
      if (update[x][y] == -1) 
      { 
        world[x][y] = 0; 
      } 
      update[x][y] = 0; 
    } 
  } 
  
  frames++;
  
  //if(frames%2 == 0)
    player.update();
  
  player.draw();
  
  
  // Birth and death cycle 
  for (int x = 1; x < sx-1; x=x+1) { 
    for (int y = 1; y < sy-1; y=y+1) {
      if(seeds <= MAX_SEEDS-MAX_SEEDS/4) {
        if(freshness[x][y] > 0) {
  
          int count = neighbors(x, y); 
          if (count == 3 && world[x][y] == 0) 
          { 
            update[x][y] = 1;
            freshness[x][y] --; //-= MAX_FRESH/16;
            change++;
          } 
          if ((count < 2 || count > 3) && world[x][y] == 1) 
          { 
            update[x][y] = -1;
            freshness[x][y] --; //-= MAX_FRESH/16; 
            change++;
          }
        }
        else {
          if(world[x][y] == 1) {
             update[x][y] = -1;
             change++;
          }
        }
        
        //if(freshness[x][y] < MAX_FRESH)
        //  freshness[x][y]++;
      }
      else {
        update[x][y] = world[x][y];
      }
    } 
  } 
} 
 
// Count the number of adjacent cells 'on' 
int neighbors(int x, int y) 
{ 
  return  world[x-1][y-1] +  world[x][y-1] + world[x+1][y-1] +
          world[x-1][y]                       + world[x+1][y] +
          world[x-1][y+1] +  world[x][y+1] + world[x+1][y+1];
} 

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
      player.dirPressed(keyCode);
    } 
  }
  else if(key == 's') {
    showScore = false;
  }
  else {
    player.keyPress(key);
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
      player.dirReleased(keyCode);
    } 
  }
}

