
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 *
 * keys: 
 * '1' = setting speed using random()-function
 * '2' = setting speed using noise()-function
 *  
 * mouseX: 
 * click canvas to change cellsize
 * 
 */
/* @pjs preload=sonnenblume2.jpg";*/
PImage myImg;
int cellSize = 10;
int numCells;
float yStart;
int movingCells;  // how many 'cells' are in motion
int randMode = 2; // '1' -> random,  '2' -> noise for speed-Value
float angle = 0; 
Tile[] tiles;

void setup() {
  myImg = loadImage("sonnenblume2.jpg");
  //size(myImg.width, myImg.height);  
  size(480, 320); 
  
  background(255);  

  myImg.loadPixels(); 

  numCells = width / cellSize;  
  yStart = height/2 - cellSize/2; 

  initTiles();
}

void draw() {

  if (mousePressed) { //change cellsize according to mouse-X-position
    cellSize = (int) map(mouseX, 0, width, 2, 25);
    numCells = width / cellSize;  
    yStart = height/2 - cellSize/2;
    initTiles();
  }

  if (movingCells > 0) {
    for (int i = 0; i < numCells; i++) {
      if (tiles[i].move) {
        tiles[i].moveTile();
        tiles[i].drawTile();
      }
    }
  } else {
    // if none of the cells is moving anymore, start over
    initTiles(); 
    movingCells = numCells;
    angle = 0;  
    background(255);
  }

  angle++;
}

class Tile {
  float x, y1, y2; 
  float speed; 
  float direction; 
  boolean move = true; 

  Tile(float _x, float _noise) {
    x = _x;

    if (randMode == 1) {
      speed = random(1, 3);
    } else {
      speed = .5 + _noise * 3;
    } 

    move = true;
  }

  void moveTile() {     
    float tAngle; 
    tAngle = radians(angle * speed);

    y1 = yStart/2 + cos(tAngle) * yStart/2;  // upper half of the canvas        
    y2 = height - y1; // lower half (mirror y1) 

    // stop after one cosine-phase and wait for the other tiles before starting new...
    // determine phase of cos: 0 -> PI: cell goes up, PI -> TWO_PI: cell goes down
    direction = (tAngle / PI) % 2; 
    if (direction >= 1.95) {
      move = false;
      movingCells--;
    }
  }

  void drawTile() {
    float xp, yp; 
    color c; 
    int i; 

    x  = constrain(x, 0, myImg.width - 1 - cellSize );
    y1 = constrain(y1, 0, myImg.height - 1 - cellSize);
    y2 = constrain(y2, 0, myImg.height - 1 - cellSize);   

    // on the way up, paint the image
    if (direction >= 0 && direction < 1) { 
      noStroke();

      i = (int) x + ( (int)y1 * myImg.width); 
      c = myImg.pixels[i];
      fill(c);  
      rect(x, y1, cellSize, cellSize);

      i = (int) x + ( (int)y2 * myImg.width); 
      c = myImg.pixels[i];
      fill(c);   
      rect(x, y2, cellSize, cellSize);
      
    } else {  // on the way down - erase... 
      fill(255); 
      noStroke();  
      rect(x, y1, cellSize, cellSize+3); 
      rect(x, y2, cellSize, cellSize+3);
    }
  }

}

void initTiles() {
  float x;  
  float xnoise = random(5); 
  float cSize = cellSize; 

  tiles = new Tile[numCells];
  for (int i = 0; i < numCells; i++) {
    x = (i * cellSize); 
    tiles[i] = new Tile(x, noise(xnoise));
    xnoise += cSize/100; //0.01;    
  }

  movingCells = numCells;
  angle = 0;  
  background(255);
}

void keyReleased() {
  if (key == '1') {
    randMode = 1;
    initTiles();
  }
  if (key == '2') {
    randMode = 2;
    initTiles();
  }
}



