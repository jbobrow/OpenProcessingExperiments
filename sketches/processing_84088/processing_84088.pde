
import processing.opengl.*;

int screenSizeX = 600;
int screenSizeY = 600;
float tileSize = 20;
int gridResolutionX, gridResolutionY;
char[][] tiles;
color[][] tileColors;
color activeTileColor = color(200, 0, 100);
char activeModulsSet = 'A';

float rot=0;


void setup() {
  size(600, 600, OPENGL);

  gridResolutionX = round(screenSizeX/tileSize)+2;
  gridResolutionY = round(screenSizeX/tileSize)+2;
  tiles = new char[gridResolutionX][gridResolutionY];
  tileColors = new color[gridResolutionX][gridResolutionY];

  initTiles();
}

void draw() {
  background(255);

  camera(mouseX, mouseY, 200, width/2.0, height/2.0, 0, 0, 1, 0);
  pushMatrix();
  translate(width / 2, height / 2, -20);
  popMatrix();

  if (keyCode == UP) {
    println(keyCode);
    rotateX(1);
    rotateY(1);
    rotateZ(1);
  } 
  else if (keyCode == DOWN) {
    println(keyCode);
  }

  if (mousePressed && (mouseButton == LEFT)) setTile();
  drawModuls();
}

void initTiles() {
  for (int gridY=0; gridY< gridResolutionY; gridY++) {
    for (int gridX=0; gridX< gridResolutionX; gridX++) {  
      tiles[gridX][gridY] = '0';
      tileColors[gridX][gridY] = color(random(255), 0, random(255));
    }
  }
}

void setTile() {
  // convert mouse position to grid coordinates
  int gridX = floor((float)mouseX/tileSize) + 1;
  gridX = constrain(gridX, 1, gridResolutionX-2);
  int gridY = floor((float)mouseY/tileSize) + 1;
  gridY = constrain(gridY, 1, gridResolutionY-2);
  tiles[gridX][gridY] = activeModulsSet;
  tileColors[gridX][gridY] = activeTileColor;
}


void drawModuls() {
  shapeMode(CENTER);
  for (int gridY=1; gridY< gridResolutionY-1; gridY++) {  
    for (int gridX=1; gridX< gridResolutionX-1; gridX++) { 
      char currentTile = tiles[gridX][gridY];
      if (currentTile != '0') {
        float posX = tileSize*gridX - tileSize/2;
        float posY = tileSize*gridY - tileSize/2;

        fill(tileColors[gridX][gridY]);
        noStroke();

        pushMatrix();
        translate(posX, posY);
        rotateX(radians(30));
        rotateY(radians(30));
        rect(0, 0, tileSize, tileSize);
        popMatrix();
      }
    }
  }
}

void keyReleased() { 
  if (key == '1') activeModulsSet = 'A';
  if (key == 'y' || key == 'Y') activeTileColor = color(0);
}
