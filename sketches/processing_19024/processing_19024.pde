
// Modified version of Conway's Game of Life
// from http://processing.org/learning/topics/conway.html
// Jacob Haip 2011
int sx, sy, zoom; 
int[][][] world;
boolean run;
// Logo pattern that is pasted into the world at the start.
// Remove if you don't want to see it.
int[][] pattern = {
{0,0,0,1,0,0,0,1,1,1,1},
{0,0,0,1,0,0,0,1,0,0,1},
{0,0,0,1,0,0,0,1,0,0,1},
{1,1,1,1,1,1,1,1,1,1,1},
{1,0,0,1,0,0,0,1,0,0,0},
{1,0,0,1,0,0,0,1,0,0,0},
{1,1,1,1,0,0,0,1,0,0,0}};
 
void setup() 
{ 
  zoom = 3;
  sx = int(640/zoom);
  sy = int(480/zoom);
  world = new int[sx][sy][2]; 
  run = false;
  size(sx*zoom, sy*zoom, P2D);
  frameRate(20); 
  
  // The following Code is for placeing the beginning pattern.
  // Remove if you don't want it to see it
  int placeX = int(sx/2)-3;
  int placeY = int(sy/2)-5;
  for ( int x = 0; x < pattern[0].length; x++ ) {
    for ( int y = 0; y < pattern.length; y++ ) {
        world[placeX+x][placeY+y][1] = pattern[y][x];
    }
  }
  // End of unnecessary code
  
  noStroke();
  fill(200);
} 
 
void draw() 
{ 
  //when running: black background, if not: dark gray
  background(50*int(!run)); 
  scale(zoom);
  
  // Drawing and update cycle 
  for (int x = 0; x < sx; x++) { 
    for (int y = 0; y < sy; y++) { 
      if (world[x][y][1] == 1) { 
        world[x][y][0] = 1; 
        rect(x,y,1,1); 
      } 
      else { 
        world[x][y][0] = 0; 
      } 
    } 
  } 
  // Birth and death cycle 
  if ( run ) {
    for (int x = 0; x < sx; x=x+1) { 
      for (int y = 0; y < sy; y=y+1) { 
        int count = neighbors(x, y); 
        if (world[x][y][0] == 0) {
          if (count == 3) {
            world[x][y][1] = 1;
          }
        }
        else if (count < 2 || count > 3) {
          world[x][y][1] = 0;
        }
      } 
    } 
  }
} 
 
// Count the number of adjacent cells 'on' 
int neighbors(int x, int y) 
{ 
  return world[(x + 1) % sx][y][0] + 
         world[x][(y + 1) % sy][0] + 
         world[(x + sx - 1) % sx][y][0] + 
         world[x][(y + sy - 1) % sy][0] + 
         world[(x + 1) % sx][(y + 1) % sy][0] + 
         world[(x + sx - 1) % sx][(y + 1) % sy][0] + 
         world[(x + sx - 1) % sx][(y + sy - 1) % sy][0] + 
         world[(x + 1) % sx][(y + sy - 1) % sy][0]; 
} 
void keyPressed() {
  if ( key == 'c' ) {
    //clear the world
    world = new int[sx][sy][2];
    run = false;
  }
  else {
    // paused/play life
    run = !run;
  }
  //live blocks are gray when life is paused
  if ( run ) { fill(255); } else { fill(200); }
}
void mousePressed() {
  //switch on/off
  world[int(mouseX/zoom)][int(mouseY/zoom)][1] ^= 1;
}

