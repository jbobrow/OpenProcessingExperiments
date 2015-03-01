
/* Futurelearn
 * Creative Coding - Monash University
 * Week 2, 05 - Vera Molnar 25 Squares
 *
 * Click Canvas to start again
 */

Tile[] tiles = new Tile[25];

int   numTiles = 5; 
int   anzTiles = 25; 
float tileSize; 
float gap = 10; 
float border = 20; 
int   counter = 0;
int   counterMax = 20;

void setup() {
  size(500, 500); 
  noStroke(); 
  frameRate(20); 

  tileSize = (width - (numTiles - 1) * gap - (2 * border)) / numTiles;

  initTiles();
} 

void draw() {
  if (counter <= counterMax) {
    drawBackground(); 

    for (int i = 0; i < anzTiles; i++) {
      tiles[i].drawRect(); 
      if(counter >= 5){
      tiles[i].updateRect();
      }
    }
  } else if (counter >= 80){
    drawBackground(); 

    for (int i = 0; i < anzTiles; i++) {
      tiles[i].drawRect(); 
      tiles[i].updateRect();
      tiles[i].vx *= 1.5;
      tiles[i].vy *= 1.5;
    }    
  }
  
  counter++;
  
}

class Tile {
  float x, y;     // x, y, position rectangle 
  float vx, vy;   // velocity

  float r = 5;    // rgb-values
  float g = 30; 
  float b = 155; 

  Tile(float _x, float _y) {
    x = _x; 
    y = _y; 

    vx = random(-1, 1);
    vy = random(-1, 1);

    r += random(r, 30); 
    g += random(-20, 30);
    b += random(-45, 45);
  }

  void drawRect() {
    noStroke();     
    fill(r, g, b, 200); 
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

void drawBackground() {
  float x, y; 

  background(225);

  for (int i = 0; i < numTiles; i++) {
    for (int j = 0; j < numTiles; j++) {
      y = border + gap * (i) + tileSize * i;
      x = border + gap * (j) + tileSize * j;

      noStroke(); 
      fill(0); 
      rect(x, y, tileSize, tileSize);
      strokeWeight(4); 
      stroke(75); 
      line(x+2, y+2, x+tileSize-2, y+2);
      line(x+2, y+2, x+2, y+tileSize-2);
      stroke(175); 
      line(x+tileSize-2, y+2, x+tileSize-2, y+tileSize-2);
      line(x+2, y+tileSize-2, x+tileSize-2, y+tileSize-2);
    }
  }
}; 

void mouseReleased() {
  initTiles(); 
  counter = 0;
}

void keyReleased() {
  if (key == 'S' || key == 's') {
    saveFrame("Square_25.jpg");
  }
}



