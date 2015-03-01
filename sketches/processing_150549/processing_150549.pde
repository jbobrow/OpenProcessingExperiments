
Tile[] tiles = new Tile[25];

int   numTiles = 5; 
int   anzTiles = 25; 
float tileSize; 
float gap = 5; 
float border = 10; 
int counter = 0; 

void setup() {
  size(500, 500); 
  noStroke(); 
  frameRate(10); 

  tileSize = (width - (numTiles - 1) * gap - (2 * border)) / numTiles;

  initTiles();
} 

void draw() {
  if (counter <= 10) {

    background(220);

    for (int i = 0; i < anzTiles; i++) {
      tiles[i].drawRect(); 
      tiles[i].updateRect();
    }

    counter++;
  }
}

class Tile {
  float x, y;     // x, y, position rectangle 
  float vx, vy;   // velocity
  color c;        // color

  Tile(float _x, float _y) {
    float randNum = random(1);
    x = _x; 
    y = _y; 

    vx = random(-1, 1);
    vy = random(-1, 1);
    
    if (randNum < 0.8) {
      c = color(137, 35, 26, 200);
    } else {
      c = color(173, 0, 0, 200);
    }
  }

  void drawRect() {
    fill(c); 
    rect(x, y, tileSize, tileSize);
  }

  void updateRect() {
    x += vx; 
    y += vy;
  }
} 

void initTiles() {
  float x, y; 
  int ind = 0; 

  for (int i = 0; i < numTiles; i++) {
    for (int j = 0; j < numTiles; j++) {
      y = border + gap * (i) + tileSize * i;
      x = border + gap * (j) + tileSize * j;

      tiles[ind] = new Tile(x, y);  
      ind++;
    }
  }
}


void mouseReleased() {
  initTiles(); 
  counter = 0; 
}

void keyReleased() {
  if (key == 'S' || key == 's') {
    saveFrame("Square_25.jpg");
  }
}



