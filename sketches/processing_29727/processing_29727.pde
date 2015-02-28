
/*
Original Game of Life by Conaway.
This version was created by Stewart Bracken.
http://stewart.bracken.bz

Press Space to toggle life on and off .
Click to create or destroy a cell.
Change frameRate() in setup() to speed up or slow down life.
*/



//USER INPUT VARIABLES, set width and height to be the same
//set cell size for the size of each cell (wowzer, so logical).
int WIDTH = 500;
int HEIGHT = 500;
int cellSize = 10;

//Program Vars
int[][][] world;
int lifeSize = WIDTH/cellSize;
boolean isOn = false;
int toggler = 1;
boolean isDragging = false;
int fillColor = 100;
int generation = 0;

PFont font;


void setup() {
 size( 500, 500 ); 
 frameRate(10);
 smooth();
 background( 255 );
 font = loadFont("PrestigeEliteStd-Bd-9.vlw");
 textFont(font);
 world = new int[lifeSize][lifeSize][2];
 for ( int i = 0; i < lifeSize; i++ ){
   for ( int k = 0; k < lifeSize; k++ ){
       world[i][k][0] = 0;
       world[i][k][1] = 0;
       //world[i][k][2] = 0;
   }
 }
}

void draw() {
  if (isOn) {
    background(255);
    stroke(255);
  }else {
    background(200);
    stroke(200);
  }

  
  if ( mousePressed ) {
    int i = mouseX/cellSize;
    int k = mouseY/cellSize;
    if ( !isDragging ) {
    if ( world[i][k][0] == 1 ) toggler = 0;
    else toggler = 1;
    }
    isDragging = true;
    world[i][k][0] = toggler;
    world[i][k][1] = neighborCount( world, i, k );
    fill(fillColor);
    rect( i*cellSize, k*cellSize, cellSize, cellSize );
  }
  
  neighborUpdate(world);
  if ( isOn ) {
    updateWorld(world);
    generation++;
  }
  //draw world
  for ( int i = 0; i < lifeSize; i++ ){
    for ( int k = 0; k < lifeSize; k++ ){
      if ( world[i][k][0] == 1 ) {
        fill(fillColor);
        rect( i*cellSize, k*cellSize, cellSize, cellSize );
      }
    }
  }
  fill (255,0,0);
  text("Generation: "+generation,0,10);
}

int neighborCount ( int[][][] W, int ro, int co ) {
  int ct = 0;
  for ( int row = ro-1; row <= ro+1; row++) {
    for ( int col = co-1; col <= co+1; col++) {
      if ( row >= 0 && col >= 0 && row < lifeSize && col < lifeSize ){
        if (row == ro && col == co );
        else ct += W[row][col][0];
      }
    }
  }
  return ct; 
}

void neighborUpdate ( int[][][] W ) {
  for ( int i = 0; i < lifeSize; i++ ){
    for ( int k = 0; k < lifeSize; k++ ){
      W[i][k][1] = neighborCount( W, i, k );
    }
  }
}

void updateWorld ( int[][][] W ) {
  for ( int i = 0; i < lifeSize; i++ ) {
    for ( int k = 0; k < lifeSize; k++ ) {
      if ( W[i][k][0] == 1 ) {
        if ( W[i][k][1] < 2 || W[i][k][1] > 3 ) {
          W[i][k][0] = 0;
        }
        //otherwise, the living cell lives on!
      } else {
         //reproduction
         if ( W[i][k][1] == 3 ) W[i][k][0] = 1;
      }
    }
  }
}

void keyReleased () {
  if (key == 32) { //toggle on/off with space
    isOn = !isOn;
    if ( fillColor == 0 ) fillColor += 50;
    else fillColor -= 50;
  } else if ( key == 'r' || key == 'R' ) {
    isOn = false;
    for ( int i = 0; i < lifeSize; i++ ){
      for ( int k = 0; k < lifeSize; k++ ){
        world[i][k][0] = 0;
        world[i][k][1] = 0;
        generation = 0;
      }
    }
  }
}

void mouseReleased() {
  isDragging = false;
}

